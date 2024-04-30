package com.kh.gogit.project.model.service;

import java.util.ArrayList;
import java.util.HashMap;

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
import com.kh.gogit.pr.model.vo.Reply;
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

	@Override
	public int insertProject(Project p) {
		return pDao.insertProject(sqlSession, p);
	}

	@Override
	public ArrayList<Stack> selectStackList() {
		return pDao.selectStackList(sqlSession);
	}

	@Override
	public int selectSearchCount(String keyword) {
		return pDao.selectSearchCount(sqlSession, keyword);
	}

	@Override
	public ArrayList<Project> selectSearchList(PageInfo pi, String keyword) {
		return pDao.selectSearchList(sqlSession, pi, keyword);
	}

	@Override
	public int increaseCount(int pno) {
		return pDao.increaseCount(sqlSession, pno);
	}

	@Override
	public Project selectDetailList(int pno) {
		return pDao.selectDetailList(sqlSession, pno);
	}

	@Override
	public int updateApplyProject(HashMap<String, String> map) {
		return pDao.updateApplyProject(sqlSession, map);
	}

	@Override
	public Member selectMember(String memId) {
		return pDao.selectMember(sqlSession, memId);
	}

	@Override
	public int updateCancleProject(HashMap<String, String> map) {
		return pDao.updateCancleProject(sqlSession, map);
	}

	@Override
	public int updateCompleteProject(HashMap<String, String> map) {
		return pDao.updateCompleteProject(sqlSession, map);
	}

	@Override
	public int updateRestartProject(HashMap<String, String> map) {
		return pDao.updateRestartProject(sqlSession, map);
	}

	@Override
	public ArrayList<Project> applySelectList(PageInfo pi) {
		return pDao.applySelectList(sqlSession, pi);
	}

	@Override
	public int updateProject(Project p) {
		return pDao.updateProject(sqlSession, p);
	}

	@Override
	public int applyListCount() {
		return pDao.applyListCount(sqlSession);
	}

	@Override
	public int insertReply(Reply r) {
		return pDao.insertReply(sqlSession, r);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int pno) {
		return pDao.selectReplyList(sqlSession, pno);
	}

	@Override
	public int deleteReply(int pno) {
		return pDao.deleteReply(sqlSession, pno);
	}

	@Override
	public int applycompleteListCount() {
		return pDao.applycompleteListCount(sqlSession);
	}

	@Override
	public ArrayList<Project> applycompleteList(PageInfo pi) {
		return pDao.applycompleteList(sqlSession, pi);
	}

	@Override
	public ArrayList<Member> selectProjectMemberList(String nickName) {
		return pDao.selectProjectMemberList(sqlSession, nickName);
	}

	@Override
	public int deleteProject(int pno) {
		return pDao.deleteProject(sqlSession, pno);
	}

	@Override
	public ArrayList<Member> selectCircle(int pno) {
		return pDao.selectCircle(sqlSession, pno);
	}

	
	
}
