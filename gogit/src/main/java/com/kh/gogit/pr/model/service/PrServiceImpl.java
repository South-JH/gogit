package com.kh.gogit.pr.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.gogit.common.model.vo.PageInfo;
import com.kh.gogit.pr.model.dao.PrDao;
import com.kh.gogit.pr.model.vo.Pr;
import com.kh.gogit.pr.model.vo.Reply;
import com.kh.gogit.pr.model.vo.Stack;

@Service
public class PrServiceImpl implements PrService{
	
	@Autowired
	private PrDao pDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		
		return pDao.selectListCount(sqlSession);
	}



	@Override
	public int increaseCount(int bno) {
		// TODO Auto-generated method stub
		return pDao.increaseCount(sqlSession,bno);
	}

	@Override
	public Pr prdetailView(int bno) {
		// TODO Auto-generated method stub
		return pDao.prdetailView(sqlSession,bno);
	}

	@Override
	public String memberProfile(String memId) {
		// TODO Auto-generated method stub
		return pDao.memberProfile(sqlSession,memId);
	}

	@Override
	public int insertReply(Reply r) {
		// TODO Auto-generated method stub
		return pDao.insertReply(sqlSession,r);
	}

	@Override
	public ArrayList<Reply> selectReply(int bno) {
		// TODO Auto-generated method stub
		return pDao.selectReply(sqlSession, bno);
	}

	@Override
	public int deleteReply(int rno) {
		// TODO Auto-generated method stub
		return pDao.deleteReply(sqlSession, rno);
	}

	@Override
	public ArrayList<Stack> selectStack() {
		// TODO Auto-generated method stub
		return pDao.selectStack(sqlSession);
	}

	@Override
	public int insertMyPr(Pr p) {
		// TODO Auto-generated method stub
		return pDao.insertMyPr(sqlSession,p);
	}

	@Override
	public int selectSearchList(HashMap<String, String> keyword) {
		// TODO Auto-generated method stub
		return pDao.selectSearchList(sqlSession,keyword);
	}

	@Override
	public ArrayList<Pr> searchPr(HashMap<String, String> keyword, PageInfo pi) {
		// TODO Auto-generated method stub
		return pDao.searchPr(sqlSession,keyword,pi);
	}



	@Override
	public Pr selectMyPr(int prNo) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public int deleteMyPr(int prNo) {
		// TODO Auto-generated method stub
		return pDao.deleteMyPr(sqlSession,prNo);
	}



}
