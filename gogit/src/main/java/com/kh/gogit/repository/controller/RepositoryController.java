package com.kh.gogit.repository.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RepositoryController {

	@RequestMapping("List.rp")
	public String repositoryList() {
		
		return "repository/repositoryList";
		
	}
	
}
