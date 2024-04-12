package com.kh.gogit.friend.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gogit.common.model.vo.PageInfo;
import com.kh.gogit.friend.model.vo.Friend;

@Repository
public class FriendDao {



	public int listCount(SqlSessionTemplate sqlSession, String memId) {
		
		return sqlSession.selectOne("friendMapper.listCount");
	}

	public ArrayList<Friend> selectFriendList(SqlSessionTemplate sqlSession, String memId, PageInfo pi1) {
		
		return sqlSession.selectOne("friendMapper.selectFriendList");
	}

	public int addFriend(SqlSessionTemplate sqlSession, Friend f) {
		
		return sqlSession.insert("friendMapper.addFriend");
	}

}
