package com.kh.gogit.commit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommitController {

	@RequestMapping("list.cm")
	public String commitList() {
		return "commit/commitList";
	}
	
}
