package com.kh.gogit.commitcalendar.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.JsonArray;
import com.google.gson.JsonParser;
import com.kh.gogit.commitcalendar.model.service.CommitCalServiceImpl;
import com.kh.gogit.member.model.vo.Member;

@Controller
public class CommitCalendarController {
	
	@Autowired
	private CommitCalServiceImpl cService;
	
	@RequestMapping("commitcl.cl")
	public String commitcal(HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("loginUser");
		String repoList = cService.repositoryList(m);
		
		JsonArray repoArr = JsonParser.parseString(repoList).getAsJsonArray();
		
		
		
		
		System.out.println(repoList);
		return "commitcalendar/commitcal";
	}
	
	

}
