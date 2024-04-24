package com.kh.gogit.search.model.service;

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
public class SearchServiceImpl {
	
	public String test1(Member loginUser, String keyword, int aType) {
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		//headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		
		headers.set("Authorization", "Bearer " + loginUser.getMemToken());
		headers.set("Accept", "Accept: application/vnd.github+json");
		
		if(aType == 0) {
			String url = "https://api.github.com/search/repositories?q=" + keyword;						

			//MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();

			HttpEntity<String> request = new HttpEntity<String>(headers);		
			//HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(headers);
			
			ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET , request, String.class);
			
			String totalCount = "";
			if(response.getStatusCode() == HttpStatus.OK) {
				totalCount = response.getBody();
			}else {
				System.out.println("검색 api 실패");
			}	
			return totalCount;
			
		}else {
			String url = "https://api.github.com/search/users?q=" + keyword;	
			
			// 서치값 받아올꺼임

			//MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();

			HttpEntity<String> request = new HttpEntity<String>(headers);		
			//HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(headers);
			
			ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET , request, String.class);
			
			String searchList = "";
			if(response.getStatusCode() == HttpStatus.OK) {
				searchList = response.getBody();
			}else {
				System.out.println("검색 api 실패");
			}
			return searchList;	
		}		
	}
	
	public String test2(Member loginUser, String keyword, String page) {
		String url = "https://api.github.com/search/users?q=" + keyword + "&page=" + page;
		// 서치값 받아올꺼임
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		
		headers.set("Authorization", "Bearer " + loginUser.getMemToken());
		headers.set("Accept", "Accept: application/vnd.github+json");

//		MultiValueMap<String, Object> body = new LinkedMultiValueMap<String, Object>();
//		body.add("page", page);
//		body.add("q", keyword);

	
		
		HttpEntity<String> request = new HttpEntity<String>(headers);		
		//HttpEntity<MultiValueMap<String, Object>> request = new HttpEntity<MultiValueMap<String, Object>>(headers);
		
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET , request, String.class);
		
		String searchList = "";
		if(response.getStatusCode() == HttpStatus.OK) {
			searchList = response.getBody();
		}else {
			System.out.println("검색 api 실패");
		}
		return searchList;
	}
	
	public String userDetailView(String nickName, Member loginUser) {
		String url = "https://api.github.com/users/" + nickName + "/repos";
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		
		headers.set("Authorization", "Bearer " + loginUser.getMemToken());
		headers.set("Accept", "Accept: application/vnd.github+json");
		
		
		HttpEntity<String> request = new HttpEntity<String>(headers);
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, request, String.class);
		
		String userContent = "";
		if(response.getStatusCode() == HttpStatus.OK) {
			userContent = response.getBody();
		}else {
			System.out.println("content 조회 실패");
		}
		return userContent;
	}
	
	public String repoDetailView(String keyword, Member loginUser) {
		String url = "https://api.github.com/search/repositories?q=" + keyword;
		
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		
		headers.set("Authorization", "Bearer" + loginUser.getMemToken());
		headers.set("Accept", "Accept: application/vnd.github+json");
		
		HttpEntity<String> request = new HttpEntity<String>(headers);
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, request, String.class);
		
		String repoList = "";
		if(response.getStatusCode() == HttpStatus.OK) {
			repoList = response.getBody();
		}else {
			System.out.println("repoList 조회 실패!");
		}
		return repoList;
	}
	
	public String test4(Member loginUser, String keyword, String page) {
		String url = "https://api.github.com/search/repositories?q=" + keyword + "&page=" + page;
		
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
			System.out.println("검색 api 실패!");
		}
		return repoList;
	}

}
