package com.kh.gogit.pr.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.gogit.common.model.vo.PageInfo;
import com.kh.gogit.pr.model.dao.PrDao;
import com.kh.gogit.pr.model.vo.Pr;

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
	public ArrayList<Pr> selectPrList(PageInfo pi) {
		
		return pDao.selectPrList(sqlSession,pi);
	}

}
