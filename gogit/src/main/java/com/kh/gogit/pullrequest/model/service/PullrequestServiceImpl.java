package com.kh.gogit.pullrequest.model.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import com.google.gson.JsonParser;
import com.kh.gogit.comment.model.vo.Comment;
import com.kh.gogit.commit.model.vo.Commit;
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
		
		try {
			ResponseEntity<String> response = restTemplate.postForEntity(url, request, String.class);
			return response.getStatusCode() == HttpStatus.CREATED ? true : false;
			
		} catch (HttpClientErrorException e1) {
			System.out.println(e1);
			return false;
		}
		
		
	}
	
	public String getPullrequest(Member loginUser, String owner, String repoName, int pullNo) {
		
		// https://api.github.com/repos/OWNER/REPO/pulls/PULL_NUMBER
		String url = "https://api.github.com/repos/" + owner + "/" + repoName + "/pulls/" + pullNo;
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setBearerAuth(loginUser.getMemToken());
		headers.set("Accept", "application/vnd.github.html+json");
		
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
	
	public String getCommentsList(String url, Member loginUser) {
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setBearerAuth(loginUser.getMemToken());
		headers.set("Accept", "application/vnd.github.html+json");
		
		HttpEntity<String> request = new HttpEntity<String>(headers);
		
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, request, String.class);
		
		if(response.getStatusCode() == HttpStatus.OK) {
			return response.getBody();
		} else {
			return null;
		}
		
	}
	
	public boolean createMerge(Member loginUser, Pullrequest pullrq, Commit commit) {
		
		// https://api.github.com/repos/OWNER/REPO/pulls/PULL_NUMBER/merge
		String url = "https://api.github.com/repos/" + pullrq.getRepoOwner() + "/" + pullrq.getRepoName() + "/pulls/" + pullrq.getPullNo() + "/merge";
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setBearerAuth(loginUser.getMemToken());
		headers.set("Accept", "application/vnd.github+json");
		
		Map<String, String> body = new HashMap<String, String>();
		body.put("commit_title", commit.getTitle());
		body.put("commit_message", commit.getMessage());
		
		HttpEntity<Map<String, String>> request = new HttpEntity<Map<String,String>>(body, headers);
		
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.PUT, request, String.class);
		
		if(response.getStatusCode() == HttpStatus.OK) {
			return true;
		} else {
			return false;
		}
		
	}
	
	public boolean updatePullrequest(Member loginUser, Pullrequest pullrq) {
		
		// https://api.github.com/repos/OWNER/REPO/pulls/PULL_NUMBER
		String url = "https://api.github.com/repos/" + pullrq.getRepoOwner() + "/" + pullrq.getRepoName() + "/pulls/" + pullrq.getPullNo();
		
		// RestTemplate이 PATCH를 사용하여 호출하는 경우 발생하는 에러 => java.net.ProtocolException: Invalid HTTP method: PATCH
		// pom.xml에서 org.apache.httpcomponents의 httpclient 추가 후,
		// RestTemplate 객체 생성 시 HttpClientFactory 주입하여 생성하면 에러 해결 가능
		RestTemplate restTemplate = new RestTemplate(new HttpComponentsClientHttpRequestFactory());
		
		HttpHeaders headers = new HttpHeaders();
		headers.setBearerAuth(loginUser.getMemToken());
		headers.set("Accept", "application/vnd.github+json");
		
		Map<String, String> body = new HashMap<String, String>();
		
		if(pullrq.getPullTitle() != null) {
			body.put("title", pullrq.getPullTitle());
		} else if(pullrq.getPullContent() != null) {
			body.put("body", pullrq.getPullContent());
		} else {
			body.put("state", pullrq.getStatus());
		}
		
		HttpEntity<Map<String, String>> request = new HttpEntity<Map<String,String>>(body, headers);
		
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.PATCH, request, String.class);
		
		if(response.getStatusCode() == HttpStatus.OK) {
			return true;
		} else {
			return false;
		}
		
	}
	
	public boolean createComment(Member loginUser, Pullrequest pullrq, Comment comment) {
		
		// https://api.github.com/repos/OWNER/REPO/issues/ISSUE_NUMBER/comments
		String url = "https://api.github.com/repos/" + pullrq.getRepoOwner() + "/" + pullrq.getRepoName() + "/issues/" + pullrq.getPullNo() + "/comments";
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setBearerAuth(loginUser.getMemToken());
		
		Map<String, String> body = new HashMap<String, String>();
		body.put("body", comment.getComment());
		
		HttpEntity<Map<String, String>> request = new HttpEntity<Map<String,String>>(body, headers);
		
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, request, String.class);
		
		if(response.getStatusCode() == HttpStatus.CREATED) {
			return true;
		} else {
			return false;
		}
		
	}

}
