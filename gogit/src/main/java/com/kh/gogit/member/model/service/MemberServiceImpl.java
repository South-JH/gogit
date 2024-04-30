package com.kh.gogit.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.kh.gogit.member.model.dao.MemberDao;
import com.kh.gogit.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(sqlSession, m);
	}

	@Override
	public int checkMemberId(String memId) {
		return mDao.checkMemberId(sqlSession, memId);
	}

	@Override
	public int updateMember(Member m) {
		return mDao.updateMember(sqlSession, m);
	}

	@Override
	public Member loginMember(String memId) {
		return mDao.loginMember(sqlSession, memId);
	}
	
	public boolean checkFollow(Member loginUser, String checkNick) {
		// https://api.github.com/user/following/USERNAME
		String url = "https://api.github.com/user/following/" + checkNick;
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setBearerAuth(loginUser.getMemToken());
		
		HttpEntity<String> request = new HttpEntity<String>(headers);
		
		try {
			ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, request, String.class);
			
			if(response.getStatusCode() == HttpStatus.NO_CONTENT) {
				return true;
			} else {
				System.out.println("follow 여부 확인 중 새로운 상황 발생 확인 필요");
				return false;
			}
			
		} catch (Exception e) {
			if(e.getMessage().contains("404")) {
				return false;
			} else {
				System.out.println("exception : follow 여부 확인 중 새로운 상황 발생 확인 필요");
				return false;
			}
		}
	}
	
	public boolean follow(Member loginUser, String nickname) {
		// https://api.github.com/user/following/USERNAME
		String url = "https://api.github.com/user/following/" + nickname;
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setBearerAuth(loginUser.getMemToken());
		
		HttpEntity<String> request = new HttpEntity<String>(headers);
		
		try {
			ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.PUT, request, String.class);
			
			if(response.getStatusCode() == HttpStatus.NO_CONTENT) {
				return true;
			} else {
				System.out.println("204도 404도 아닌 상황. 확인 필요");
				return false;
			}
			
		} catch (Exception e) {
			return false;
		}
	}
	
	public boolean unfollow(Member loginUser, String nickname) {
		// https://api.github.com/user/following/USERNAME
		String url = "https://api.github.com/user/following/" + nickname;
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setBearerAuth(loginUser.getMemToken());
		
		HttpEntity<String> request = new HttpEntity<String>(headers);
		
		try {
			ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.DELETE, request, String.class);
			
			if(response.getStatusCode() == HttpStatus.NO_CONTENT) {
				return true;
			} else {
				System.out.println("204도 404도 아닌 상황. 확인 필요");
				return false;
			}
			
		} catch (Exception e) {
			return false;
		}
	}

}
