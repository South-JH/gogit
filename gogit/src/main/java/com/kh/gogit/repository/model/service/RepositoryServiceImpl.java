package com.kh.gogit.repository.model.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.kh.gogit.member.model.vo.Member;

@Service
public class RepositoryServiceImpl implements RepositoryService {

	public String repositoryList(Member m) {
		
		String url = "https://api.github.com/user/repos";
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		
		headers.set("Authorization", "Bearer " + m.getMemToken());
		headers.set("Accept", "Accept: application/vnd.github+json");
		
		//MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
		//body.add("direction", "desc");
		
		HttpEntity<String> request = new HttpEntity<String>(headers);
		//HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(body, headers);
		
		//ResponseEntity<String> response = restTemplate.postForEntity(url, headers, String.class);
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, request, String.class);
		
		String repoList = "";
		if(response.getStatusCode() == HttpStatus.OK) {
			//System.out.println(response.getBody());
			repoList = response.getBody();
		} else {
			System.out.println("api 실패");
		}
		
		return repoList;
		
	}
	
	public void repoDetailView(Member m) {
		
		String url = "https://api.github.com/repos/OWNER/REPO/contents/PATH";
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		
		headers.set("Authorization", "Bearer " + m.getMemToken());
		headers.set("Accept", "Accept: application/vnd.github+json");
	}
	
	public String createRepo(Member m, String repoName, String repoDesc, String visibility, String readme) {
		
		String url = "https://api.github.com/user/repos";
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		headers.set("Authorization", "Bearer " + m.getMemToken());
		headers.set("Accept", "Accept: application/vnd.github+json");
		
		MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
		body.add("name", repoName);
		body.add("description", repoDesc);
		body.add("private", visibility);
		body.add("auto_init", readme);
		System.out.println(body);
		
		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(body, headers);
		System.out.println(request);
		
		ResponseEntity<String> response = restTemplate.postForEntity(url, request, String.class);
		System.out.println(response);
		
		
		String createRepo = "";
		
		if (response.getStatusCode() == HttpStatus.OK) {
		    createRepo = response.getBody();
		} else {
		    System.out.println("안됨");
		}
		
		return createRepo;
	}
	
}
