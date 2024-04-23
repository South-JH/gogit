package com.kh.gogit.pullrequest.model.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.google.gson.JsonParser;
import com.kh.gogit.member.model.vo.Member;
import com.kh.gogit.pullrequest.model.vo.Pullrequest;

@Service
public class PullrequestServiceImpl implements PullrequestService {
	
	public String getPullrequestList(Member loginUser, String repoName, String owner) {
		
        // https://api.github.com/repos/OWNER/REPO/pulls
        String requestUrl = "https://api.github.com/repos/" + owner + "/" + repoName + "/pulls?state=all";
        
        RestTemplate restTemplate = new RestTemplate();
        
        HttpHeaders headers = new HttpHeaders();
        headers.setBearerAuth(loginUser.getMemToken());
        headers.set("Accept", "application/vnd.github+json");
        
        HttpEntity<String> request = new HttpEntity<String>(headers);
        
        ResponseEntity<String> response = restTemplate.exchange(requestUrl, HttpMethod.GET, request, String.class);
        
        if(response.getStatusCode() == HttpStatus.OK) {
        	return response.getBody();
        	
        } else {
        	return null;
        }
	}
	
	public String getBranchList(Member loginUser, Pullrequest pullrq) {
		
		// https://api.github.com/repos/OWNER/REPO/branches
		String url = "https://api.github.com/repos/" + pullrq.getRepoOwner() + "/" + pullrq.getRepoName() + "/branches";
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setBearerAuth(loginUser.getMemToken());
		headers.set("Accept", "application/vnd.github+json");
		
		HttpEntity<String> request = new HttpEntity<String>(headers);
		
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, request, String.class);
		
		if(response.getStatusCode() == HttpStatus.OK) {
			return response.getBody();
		} else {
			return null;
		}
		
	}
	
	public boolean createPullRequest(Member loginUser, Pullrequest pullrq) {
		
		// https://api.github.com/repos/OWNER/REPO/pulls
		String url = "https://api.github.com/repos/" + pullrq.getRepoOwner() + "/" + pullrq.getRepoName() + "/pulls";
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setBearerAuth(loginUser.getMemToken());
		headers.set("Accept", "application/vnd.github+json");
		
		Map<String, String> body = new HashMap<String, String>();
		body.put("title", pullrq.getPullTitle());
		body.put("body", pullrq.getPullContent());
		body.put("head", loginUser.getGitNick() + ":" + pullrq.getCompareBranch());
		body.put("base", pullrq.getBaseBranch());
		
		HttpEntity<Map<String, String>> request = new HttpEntity<Map<String, String>>(body, headers);
		
		ResponseEntity<String> response = restTemplate.postForEntity(url, request, String.class);
		
		if(response.getStatusCode() == HttpStatus.CREATED) {
			return true;
		} else {
			return false;
		}
		
	}
	
	public String getPullrequest(Member loginUser, String owner, String repoName, int pullNo) {
		
		// https://api.github.com/repos/OWNER/REPO/pulls/PULL_NUMBER
		String url = "https://api.github.com/repos/" + owner + "/" + repoName + "/pulls/" + pullNo;
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setBearerAuth(loginUser.getMemToken());
		headers.set("Accept", "application/vnd.github+json");
		
		HttpEntity<String> request = new HttpEntity<String>(headers);
		
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, request, String.class);
		
		if(response.getStatusCode() == HttpStatus.OK) {
			return response.getBody();
			
		} else {
			return null;
		}
		
	}
	
	public String getCommitList(String url, Member loginUser) {
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setBearerAuth(loginUser.getMemToken());
		headers.set("Accept", "application/vnd.github+json");
		
		HttpEntity<String> request = new HttpEntity<String>(headers);
		
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, request, String.class);
		
		if(response.getStatusCode() == HttpStatus.OK) {
			return response.getBody();
		} else {
			return null;
		}
		
	}

}
