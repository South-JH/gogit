package com.kh.gogit.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.gogit.project.model.service.ProjectServiceImpl;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectServiceImpl pService;
	
	@RequestMapping("list.pr")
	/*
	public ModelAndView selectList(@RequestParam (value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		int listCount = pService.selectListCount();
		
		mv.setViewName("project/projectListView");
	}
	*/
	public String enrollForm() {
		return "project/projectListView";
	}
	
	
	

}
