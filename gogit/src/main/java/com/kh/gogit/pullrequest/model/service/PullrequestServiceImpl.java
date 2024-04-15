package com.kh.gogit.pullrequest.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.kh.gogit.member.model.vo.Member;
import com.kh.gogit.pullrequest.model.dao.PullrequestDao;

@Service
public class PullrequestServiceImpl implements PullrequestService {
	
	@Autowired
	private PullrequestDao prqDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void getGitHubRepositoryList(Member loginUser) {
		String url = "https://api.github.com/users/" + loginUser.getGitNick() + "/repos";
//		https://api.github.com/users/[username]/repos
        
        RestTemplate restTemplate = new RestTemplate();
        
        HttpHeaders headers = new HttpHeaders();
        headers.setBearerAuth(loginUser.getMemToken());
//        headers.set("Authorization", "Bearer " + loginUser.getMemToken());
        headers.set("Accept", "application/vnd.github.v3+json");
        
        HttpEntity<String> request = new HttpEntity<String>(headers);
        
        ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, request, String.class);
        
        if(response.getStatusCode() == HttpStatus.OK) {
        	System.out.println(response.getBody());
        } else {
        	System.out.println("실패~");
        }
	}

}
