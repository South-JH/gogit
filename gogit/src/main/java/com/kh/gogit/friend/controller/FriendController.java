package com.kh.gogit.friend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.gogit.friend.model.service.FriendServiceImpl;

@Controller
public class FriendController {

	@Autowired // DI(Dependency Injection);
	private FriendServiceImpl fService;
	
	
	@RequestMapping("form.fr")
	public String FriendForm() {
		return "friend/friendForm";
	}
	
}
