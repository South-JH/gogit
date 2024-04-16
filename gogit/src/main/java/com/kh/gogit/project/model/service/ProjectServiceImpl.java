package com.kh.gogit.project.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.kh.gogit.common.model.vo.PageInfo;
import com.kh.gogit.member.model.vo.Member;
import com.kh.gogit.project.model.dao.ProjectDao;
import com.kh.gogit.project.model.vo.Project;
import com.kh.gogit.project.model.vo.Stack;

@Service
public class ProjectServiceImpl implements ProjectService{
	
	@Autowired
	private ProjectDao pDao;
	
	@Autowired
	public SqlSessionTemplate sqlSession;	

	@Override
	public int selectListCount() {
		return pDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Project> selectList(PageInfo pi) {
		return pDao.selectList(sqlSession, pi);
	}
	
	
	public void test1(Member loginUser) {
		String url = "https://api.github.com/user/projects";
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		
		headers.set("Authorization", "Bearer " + loginUser.getMemToken());
		headers.set("Accept", "Accept: application/vnd.github+json");
		
		MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
		body.add("name", "test");
		body.add("body", "hi");
		
		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String,String>>(body, headers);
		System.out.println("리퀘스트" + request);
		
		
		ResponseEntity<String> response = restTemplate.postForEntity(url, request, String.class);
		System.out.println("리스폰스"+ response);
		
		
		if(response.getStatusCode() == HttpStatus.OK) {
			System.out.println(response.getBody());
		}	
	}

	@Override
	public int insertProject(Project p) {
		return pDao.insertProject(sqlSession, p);
	}

	@Override
	public ArrayList<Stack> selectStackList() {
		return pDao.selectStackList(sqlSession);
	}
	
}
