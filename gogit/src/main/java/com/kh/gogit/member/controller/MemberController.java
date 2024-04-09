package com.kh.gogit.member.controller;



import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class MemberController {
	


	

	@RequestMapping("/callback")
	public String loginMember(String code,HttpSession session) {
		
		
		session.setAttribute("code", code);
		
		System.out.println("memberController");
	
		return "/github/callback";
	}

}
