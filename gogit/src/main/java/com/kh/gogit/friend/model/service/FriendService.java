package com.kh.gogit.friend.model.service;

import java.util.ArrayList;

import com.kh.gogit.common.model.vo.PageInfo;
import com.kh.gogit.friend.model.vo.Friend;

public interface FriendService {

	int listCount(String memId);
	ArrayList<Friend> selectFriendList(String memId,PageInfo pi1);
	int addFriend(Friend f);
}
