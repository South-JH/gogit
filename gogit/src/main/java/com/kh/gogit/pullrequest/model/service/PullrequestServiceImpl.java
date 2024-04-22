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

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.gogit.member.model.vo.Member;
import com.kh.gogit.pullrequest.model.vo.Pullrequest;

@Service
public class PullrequestServiceImpl implements PullrequestService {
	
	public String getPullrequestList(Member loginUser, String repoName) {
		// ================================= repository 조회 =================================
		String url = "https://api.github.com/user/repos";
        
        RestTemplate restTemplate1 = new RestTemplate();
        
        HttpHeaders headers1 = new HttpHeaders();
        headers1.set("Authorization", "Bearer " + loginUser.getMemToken());
        headers1.set("Accept", "application/vnd.github+json");
        
        HttpEntity<String> request1 = new HttpEntity<String>(headers1);
        
        ResponseEntity<String> response1 = restTemplate1.exchange(url, HttpMethod.GET, request1, String.class);
        
        if(response1.getStatusCode() == HttpStatus.OK) {
        	System.out.println("가져왔다 repository");
        } else {
        	System.out.println("실패~");
        	return null;
        }
        
        JsonArray repoArr = JsonParser.parseString(response1.getBody()).getAsJsonArray();
        JsonObject repoObj = repoArr.get(15).getAsJsonObject();
        
        // ===============================================================================================
        
        // pull request 조회
        // https://api.github.com/repos/OWNER/REPO/pulls
        String owner = repoObj.getAsJsonObject("owner").get("login").getAsString(); // repository owner의 nickname 값
        String repo = repoName; // repository name 값
        
        String requestUrl = "https://api.github.com/repos/" + owner + "/" + repo + "/pulls?state=all";
        
        RestTemplate restTemplate = new RestTemplate();
        
        HttpHeaders headers = new HttpHeaders();
        headers.setBearerAuth(loginUser.getMemToken());
        headers.set("Accept", "application/vnd.github+json");
        
        HttpEntity<String> request = new HttpEntity<String>(headers);
        
        ResponseEntity<String> response = restTemplate.exchange(requestUrl, HttpMethod.GET, request, String.class);
        
        if(response1.getStatusCode() == HttpStatus.OK) {
//        	System.out.println(response.getBody());
        	return response.getBody();
        	
        } else {
        	System.out.println("pull request list 조회 실패");
        	return null;
        }
	}
	
	public String getAssigneesProfile(Member loginUser, String assignee) {
		
		String profile = "";
		String url = "https://api.github.com/users/" + assignee;
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "Bearer " + loginUser.getMemToken());
        headers.set("Accept", "application/vnd.github+json");
        
        HttpEntity<String> request = new HttpEntity<String>(headers);
        
        ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, request, String.class);
        
        if(response.getStatusCode() == HttpStatus.OK) {
        	profile = JsonParser.parseString(response.getBody()).getAsJsonObject().get("avatar_url").getAsString();
        }
        
        return profile;
		
	}
	
	public String getBranchList(Member loginUser, String owner, String repoName) {
		
		// https://api.github.com/repos/OWNER/REPO/branches
		String url = "https://api.github.com/repos/" + owner + "/" + repoName + "/branches";
		
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

}
