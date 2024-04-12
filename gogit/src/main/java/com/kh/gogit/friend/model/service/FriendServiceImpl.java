package com.kh.gogit.friend.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.gogit.common.model.vo.PageInfo;
import com.kh.gogit.friend.model.dao.FriendDao;
import com.kh.gogit.friend.model.vo.Friend;

@Service
public class FriendServiceImpl implements FriendService{

	@Autowired
	private FriendDao fDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int listCount(String memId) {
		return fDao.listCount(sqlSession, memId);
	}

	@Override
	public ArrayList<Friend> selectFriendList(String memId, PageInfo pi1) {
		
		return fDao.selectFriendList(sqlSession, memId, pi1);
	}

	public int addFriend(Friend f) {
		
		return fDao.addFriend(sqlSession, f);
		}
	}


	

	
		
	


	

	

	
	

