package com.kh.gogit.member.controller;



import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class MemberController {
	


	

	@RequestMapping("/callback")
	public String loginMember(@RequestParam String code,HttpSession session) {
		
		session.setAttribute("code", code);
		
		return "/github/callback";
	}

}
