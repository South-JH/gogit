package com.kh.gogit.friend.model.service;

import java.util.ArrayList;

import com.kh.gogit.common.model.vo.PageInfo;
import com.kh.gogit.friend.model.vo.Friend;
import com.kh.gogit.member.model.vo.Member;

public interface FriendService {

	int listCount(String memId);
	//ArrayList<Member> selectFriendList(String memId,PageInfo pi1);
	int addFriend(Friend f);
	int acceptFriend(Friend f);
	int acceptMyFriend(Friend f);
	int deleteFriend(Friend f);
	int deleteMyFriend(Friend f);
	int refuseFriend(Friend f);
	ArrayList<Member> searchMember(String search, String memId);
	ArrayList<Member> myFriendList(String memId);
	int blockOldFriend(Friend f);
	int blockNoneFriend(Friend f);

}
