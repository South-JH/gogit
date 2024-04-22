package com.kh.gogit.issue.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IssueController {
	
	@RequestMapping("list.is")
	public String issueList(Model model, String repoName, String visibility, String owner) {
		
//		System.out.println(repoName);
//		System.out.println(visibility);
//		System.out.println(owner);
		
		model.addAttribute("repoName", repoName);
		model.addAttribute("visibility", visibility);
		model.addAttribute("owner", owner);
		
		return "issue/issueList";
	}
	
//	@RequestMapping("getList.is")
//	public 
	
	@RequestMapping("create.is")
	public String createIssue() {
		return "issue/issueEnroll";
	}
	
	@RequestMapping("detail.is")
	public String issueDetail() {
		return "issue/issueDetail";
	}
	
}
