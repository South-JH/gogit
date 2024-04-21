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
	
	public String test1(Member loginUser, String keyword) {
		String url = "https://api.github.com/search/users?q=" + keyword;
		// 서치값 받아올꺼임
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		
		headers.set("Authorization", "Bearer " + loginUser.getMemToken());
		headers.set("Accept", "Accept: application/vnd.github+json");
		
		//MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
		//body.add("name", "test");
		//body.add("body", "hi");
		
		HttpEntity<String> request = new HttpEntity<String>(headers);		
		
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
