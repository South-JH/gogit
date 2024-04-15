package com.kh.gogit.pullrequest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.gogit.pullrequest.model.service.PullrequestServiceImpl;

@Controller
public class PullrequestController {
	
	@Autowired
	private PullrequestServiceImpl prqService;
	
	@RequestMapping("list.pullrq")
	public String pullRequestList() {
		return "repository/pullRequestList";
	}
	
	@RequestMapping("create.pullrq")
	public String createPullRequestForm() {
		return "repository/pullRequestEnroll";
	}

}
