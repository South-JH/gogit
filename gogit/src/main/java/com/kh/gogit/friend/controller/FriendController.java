package com.kh.gogit.friend.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.gogit.common.model.vo.PageInfo;
import com.kh.gogit.common.template.Pagination;
import com.kh.gogit.friend.model.service.FriendServiceImpl;
import com.kh.gogit.friend.model.vo.Friend;
import com.kh.gogit.member.model.vo.Member;





@Controller
public class FriendController {


@Autowired
private FriendServiceImpl fservice;


	@RequestMapping("form.fr")
	public String friendForm() {
		return "friend/friendForm";
	}
	
	@RequestMapping("list.fr")
	public String friendList(@RequestParam(value="cpage", defaultValue = "1")int currentPage, HttpSession session) {
String memId = ((Member)session.getAttribute("loginUser")).getMemId();
		
		
		//=================== 특정 회원의 친구 ==========================
		
			// 이건 특정 회원의 친구목록을 조회하는 메소드(전체 회원 조회 아님)
		int listCount = fservice.listCount(memId);
		
		PageInfo pi1 =  new Pagination().getPageInfo(listCount, currentPage, 5, 5);
		
		
		ArrayList<Friend> arr = fservice.selectFriendList(memId, pi1);

		return "friend/friendForm";
	}
	
	@ResponseBody
	@RequestMapping("addFriend.fr")
	public int addFriend(String bfTaker, String bfGiver, HttpSession session) {
		Friend f = new Friend();
		f.setBfTaker(bfTaker);
		f.setBfGiver(bfGiver);

		int result = fservice.addFriend(f);
		
		return result;
	}
	
	
	
	
}