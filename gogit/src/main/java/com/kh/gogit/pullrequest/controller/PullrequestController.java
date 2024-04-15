package com.kh.gogit.pullrequest.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.gogit.member.model.vo.Member;
import com.kh.gogit.pullrequest.model.service.PullrequestServiceImpl;

@Controller
public class PullrequestController {
	
	@Autowired
	private PullrequestServiceImpl prqService;
	
	@RequestMapping("list.pullrq")
	public void pullRequestList(HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		prqService.getGitHubRepositoryList(loginUser);
		
//		return "pullrequest/pullRequestList";
	}
	
	@RequestMapping("create.pullrq")
	public String createPullRequestForm() {
		return "pullrequest/pullRequestEnroll";
	}

}
