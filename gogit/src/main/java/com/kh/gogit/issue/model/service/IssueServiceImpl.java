package com.kh.gogit.issue.model.service;

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
	
	public String assigneesList(Member m, String repoName, String owner) {
		
		String url = "https://api.github.com/repos/" + owner + "/" + repoName + "/assignees";
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		headers.add("Accept", "application/vnd.github+json");
		headers.add("Authorization", "Bearer " + m.getMemToken());
		
		HttpEntity<String> request = new HttpEntity<String>(headers);
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, request, String.class);
		
		String assigness = "";
		if(response.getStatusCode() == HttpStatus.OK) {
			assigness = response.getBody();
			return assigness;
		} else {
			System.out.println("검토자 없음");
			return null;
		}
		
	}
	
	public String labelList(Member m, String repoName, String owner) {
		
		String url = "https://api.github.com/repos/" + owner + "/" + repoName + "/labels";
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		headers.add("Accept", "application/vnd.github+json");
		headers.add("Authorization", "Bearer " + m.getMemToken());
		
		HttpEntity<String> request = new HttpEntity<String>(headers);
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, request, String.class);
		
		String label = "";
		if(response.getStatusCode() == HttpStatus.OK) {
			label = response.getBody();
			return label;
		} else {
			System.out.println("검토자 없음");
			return null;
		}
		
	}
	
	public void createIssue(Member m, String repoName, String owner, String title, String body, String[] assignees, String[] label) {
		
		String url = "https://api.github.com/repos/" + owner + "/" + repoName + "/issues";
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		headers.add("Accept", "application/vnd.github+json");
		headers.add("Authorization", "Bearer " + m.getMemToken());
		
		Map<Object, Object> map = new HashMap<>();
		map.put("title", title);
		map.put("body", body);
		map.put("assignees", assignees);
		map.put("label", label);
		
		HttpEntity<Map<Object, Object>> request = new HttpEntity<>(map, headers);
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, request, String.class);
		
		String createIs = "";
		
		
	}
	
}
