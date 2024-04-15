package com.kh.gogit.issue.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IssueController {
	
	@RequestMapping("list.is")
	public String issueList() {
		return "issue/issueList";
	}
	
	@RequestMapping("create.is")
	public String createIssue() {
		return "issue/issueEnroll";
	}
	
	@RequestMapping("detail.is")
	public String issueDetail() {
		return "issue/issueDetail";
	}
	
}
