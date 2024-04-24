package com.kh.gogit.commitcalendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommitCalendarController {
	
	@RequestMapping("commitcl.cl")
	public String commitcal() {
		return "commitcalendar/commitcal";
	}

}
