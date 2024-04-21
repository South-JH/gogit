package com.kh.gogit.commit.model.service;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.kh.gogit.member.model.vo.Member;

@Service
public class CommitServiceImpl {

	public String getCommitList(Member m, String repoName, String owner) {
		
		String url = "https://api.github.com/repos/" + owner + "/" + repoName + "/commits?sha=main";
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		headers.set("Authorization", "Bearer " + m.getMemToken());
		headers.set("Accept", "Accept: application/vnd.github+json");
		
		HttpEntity<String> request = new HttpEntity<String>(headers);
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, request, String.class);
		
		String commitList = "";
		if(response.getStatusCode() == HttpStatus.OK) {
			//System.out.println(response.getBody());
			commitList = response.getBody();
			return commitList;
		} else {
			System.out.println("커밋리스트 조회 실패");
			return null;
		}
		
	}
	
	public String branchCommitList(Member m, String repoName, String owner, String branches) {
		
		String url = "https://api.github.com/repos/" + owner + "/" + repoName + "/commits?sha=" + branches;
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		headers.set("Authorization", "Bearer " + m.getMemToken());
		headers.set("Accept", "Accept: application/vnd.github+json");
		
		HttpEntity<String> request = new HttpEntity<String>(headers);
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, request, String.class);
		
		String commitList = "";
		if(response.getStatusCode() == HttpStatus.OK) {
			//System.out.println(response.getBody());
			commitList = response.getBody();
			return commitList;
		} else {
			System.out.println("커밋리스트 조회 실패");
			return null;
		}
		
	}
	
}
