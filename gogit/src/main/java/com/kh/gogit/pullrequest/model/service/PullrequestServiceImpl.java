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

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.gogit.member.model.vo.Member;
import com.kh.gogit.pullrequest.model.dao.PullrequestDao;

@Service
public class PullrequestServiceImpl implements PullrequestService {
	
	@Autowired
	private PullrequestDao prqDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void getGitHubRepositoryList(Member loginUser) {
		// ================================= repository 조회 =================================
		String url = "https://api.github.com/user/repos";
        
        RestTemplate restTemplate = new RestTemplate();
        
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + loginUser.getMemToken());
        headers.set("Accept", "application/vnd.github+json");
        
        HttpEntity<String> request = new HttpEntity<String>(headers);
        
        ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, request, String.class);
        
        if(response.getStatusCode() == HttpStatus.OK) {
        	System.out.println("가져왔다 repository");
        } else {
        	System.out.println("실패~");
        	return;
        }
        // ===============================================================================================
        
        // pull request 생성
        JsonObject repoObj = (JsonObject)new JsonParser().parse(response.getBody());
        System.out.println(repoObj);
//        url = "https://api.github.com/repos/" + response.getBody(). + "/" + REPO + "/pulls";
	}

}
