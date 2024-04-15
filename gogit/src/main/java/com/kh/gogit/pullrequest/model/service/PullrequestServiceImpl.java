package com.kh.gogit.pullrequest.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.gogit.pullrequest.model.dao.PullrequestDao;

@Service
public class PullrequestServiceImpl implements PullrequestService {
	
	@Autowired
	private PullrequestDao prqDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

}
