package com.kh.gogit.commitcalendar.model.service;

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
public class CommitCalServiceImpl {
	
	public String repositoryList(Member loginUser) {
		
		String url = "https://api.github.com/user/repos?sort=created&direction=desc";
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		
		headers.set("Authorization", "Bearer " + loginUser.getMemToken());
		headers.set("Accept", "Accept: application/vnd.github+json");
		
		HttpEntity<String> request = new HttpEntity<String>(headers);
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, request, String.class);
		
		String repoList = "";
		if(response.getStatusCode() == HttpStatus.OK) {
			repoList = response.getBody();
		}else {
			System.out.println("레포 가져오기 실패!");
		}
		return repoList;		
	}
}
