package com.kh.gogit.issue.model.service;

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
public class IssueServiceImpl {
	
	public String issueList(Member m, String repoName, String owner) {
		
		String url = "https://api.github.com/repos/" + owner + "/" + repoName + "/issues?state=open";
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		headers.add("Accept", "application/vnd.github+json");
		headers.add("Authorization", "Bearer " + m.getMemToken());
		
		HttpEntity<String> request = new HttpEntity<String>(headers);
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, request, String.class);
		
		String issueList = "";
		if(response.getStatusCode() == HttpStatus.OK) {
			issueList = response.getBody();
			//System.out.println(issueList);
			return issueList;
		} else {
			System.out.println("이슈리스트 없음");
			return null;
		}
		
	}

	public String getIssueList(Member m, String repoName, String owner, String status) {
		
		String url = "https://api.github.com/repos/" + owner + "/" + repoName + "/issues?state=" + status;
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		headers.add("Accept", "application/vnd.github+json");
		headers.add("Authorization", "Bearer " + m.getMemToken());
		
		HttpEntity<String> request = new HttpEntity<String>(headers);
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, request, String.class);
		
		String issueList = "";
		if(response.getStatusCode() == HttpStatus.OK) {
			issueList = response.getBody();
			System.out.println(issueList);
			return issueList;
		} else {
			System.out.println("이슈리스트 없음");
			return null;
		}
		
	}
	
}
