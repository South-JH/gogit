package com.kh.gogit.repository.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RepositoryController {

	@RequestMapping("list.rp")
	public String repositoryList() {
		return "repository/repositoryList";
	}
	
	@RequestMapping("enrollForm.rp")
	public String repoEnrollForm() {
		return "repository/repositoryEnrollForm";
	}
	
	@RequestMapping("detail.rp")
	public String repoDetailView() {
		return "repository/repositoryDetailView";
	}
	
	@RequestMapping("list.cm")
	public String commitList() {
		return "repository/commitList";
	}
	
	@RequestMapping("list.is")
	public String issueList() {
		return "repository/issueList";
	}
	
	@RequestMapping("create.is")
	public String createIssue() {
		return "repository/issueEnroll";
	}
	
}
