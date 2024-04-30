package com.kh.gogit.member.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.gogit.member.model.service.MemberServiceImpl;
import com.kh.gogit.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberServiceImpl mService;
	
	@RequestMapping("logout")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping("follow.me")
	public boolean follow(String nickname, HttpServletResponse response, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		return mService.follow(loginUser, nickname);
	}
	
	@ResponseBody
	@RequestMapping("unfollow.me")
	public boolean unfollow(String nickname, HttpServletResponse response, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		return mService.unfollow(loginUser, nickname);
	}

}
