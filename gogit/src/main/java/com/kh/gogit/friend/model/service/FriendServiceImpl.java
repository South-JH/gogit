package com.kh.gogit.friend.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.gogit.common.model.vo.PageInfo;
import com.kh.gogit.friend.model.dao.FriendDao;
import com.kh.gogit.friend.model.vo.Friend;
import com.kh.gogit.member.model.vo.Member;

@Service
public class FriendServiceImpl implements FriendService {

	@Autowired
	private FriendDao fDao;

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int listCount(String memId) {
		return fDao.listCount(sqlSession, memId);
	}

	@Override
	public int addFriend(Friend f) {

		return fDao.addFriend(sqlSession, f);
	}

	@Override
	public int acceptFriend(Friend f) {
		return fDao.acceptFriend(f, sqlSession);
	}

	@Override
	public int acceptMyFriend(Friend f) {
		return fDao.acceptMyFriend(f, sqlSession);
	}

	@Override
	public int deleteFriend(Friend f) {

		return fDao.deleteFriend(f, sqlSession);
	}

	@Override
	public int deleteMyFriend(Friend f) {

		return fDao.deleteMyFriend(f, sqlSession);
	}

	@Override
	public int refuseFriend(Friend f) {
		return fDao.refuseFriend(f, sqlSession);

	}


	@Override
	public int blockOldFriend(Friend f) {
		
		return fDao.blockOldFriend(f, sqlSession);
	}


	
	@Override
	public int blockNoneFriend(Friend f) {
		
		return fDao.blockNoneFriend(f, sqlSession);
	}



	@Override
	public ArrayList<Member> searchMember(String search, String memId) {

		return fDao.searchMember(search, memId, sqlSession);
	}

	public ArrayList<Member> allMemberList(String memId) {

		return fDao.allMemberList(memId, sqlSession);
	}

	public ArrayList<Member> myFriendList(String memId) {
		
		return fDao.myFriendList(memId, sqlSession);
	}

	public int cancelAddFriend(Friend f) {
		return fDao.cancelAddFriend(f, sqlSession);
	}

	public int cancelRefuseFriend(Friend f) {
		return fDao.cancelRefuseFriend(f, sqlSession);
	}

	public int cancelRefuseFriend2(Friend f) {
		return fDao.cancelRefuseFriend2(f, sqlSession);
	}


	

}
