package com.kh.gogit.repository.model.service;

import java.util.Base64;
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

import com.google.gson.JsonObject;
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
		
		boolean readmeBo, visibilityBo;
		String url = "https://api.github.com/user/repos";
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		headers.set("Authorization", "Bearer " + m.getMemToken());
		headers.set("Accept", "Accept: application/vnd.github+json");
		
		Map<String, Object> map = new HashMap<>();
        map.put("name", repoName); 
        map.put("description", repoDesc); 
		visibilityBo = visibility.equals("true") ? true : false;
        map.put("private", visibilityBo); 
        readmeBo = readme.equals("true") ? true : false;
        map.put("auto_init", readmeBo);
        
        HttpEntity<Map<String, Object>> request = new HttpEntity<>(map, headers);
        
        ResponseEntity<String> response = restTemplate.postForEntity(url, request, String.class);
        
        String createRepo = "";
        
        if (response.getStatusCode() == HttpStatus.CREATED) {
	   		 System.out.println("여기타냐?"); 
	   		 createRepo = response.getBody();
	   		 return createRepo; 
   		} else {
	   		 System.out.println("생성 실패"); 
	   		 return null; 
   		}
		
	}
	
	public String createGitignore(Member m, String repoName, String git) {
		
		System.out.println("여기까지오냐?");
		
  		String url = "https://api.github.com/repos/" + m.getGitNick() + "/" + repoName + "/contents/.gitignore";
  		 
 		RestTemplate restTemplate = new RestTemplate();
		
 		HttpHeaders headers = new HttpHeaders();
 		headers.setContentType(MediaType.APPLICATION_JSON);
		
  		headers.set("Authorization", "Bearer " + m.getMemToken());
  		headers.set("Accept", "Accept: application/vnd.github+json");
  		 
  		String encodedContent = Base64.getEncoder().encodeToString(git.getBytes());
  		
  		Map<String, Object> committerMap = new HashMap<>();
  		committerMap.put("name", m.getGitNick());
  		committerMap.put("email", "null");
  		
  		Map<String, Object> map = new HashMap<>();
  		map.put("message", "gitignore 생성");
  		map.put("content", encodedContent);
  		map.put("committer", committerMap);
  		
        HttpEntity<Map<String, Object>> request = new HttpEntity<>(map, headers);
        
        ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.PUT, request, String.class);
        
        System.out.println(response.getStatusCode());
        
        String createGit = "";
        
        if (response.getStatusCode() == HttpStatus.CREATED) {
	   		 System.out.println("깃이그노어성공했냐?"); 
	   		 createGit = response.getBody();
	   		 return createGit; 
   		} else {
	   		 System.out.println("깃이그노어 생성 실패"); 
	   		 return null; 
   		}
  		
	}
	
}
