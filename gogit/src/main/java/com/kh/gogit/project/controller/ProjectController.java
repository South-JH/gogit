package com.kh.gogit.project.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.gogit.common.model.vo.PageInfo;
import com.kh.gogit.common.template.Pagination;
import com.kh.gogit.member.model.vo.Member;
import com.kh.gogit.project.model.service.ProjectServiceImpl;
import com.kh.gogit.project.model.vo.Project;
import com.kh.gogit.project.model.vo.Stack;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectServiceImpl pService;

	@RequestMapping("list.pj")
	public ModelAndView selectList(@RequestParam (value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		int listCount = pService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 3, 8);
		
		ArrayList<Project> list = pService.selectList(pi);
		ArrayList<Stack> stackList = pService.selectStackList();
		
		mv.addObject("pi",pi)
		  .addObject("list", list)
		  .addObject("stackList", stackList)
		  .setViewName("project/projectListView");
		
		return mv;
	}
	
	@RequestMapping("enrollForm.pj")
	public String enrollForm() {
		return "project/projectEnrollForm";
	}
	
	@RequestMapping("detail.pr")
	public String detailView(int pno, Model model) {
		int result = pService.increaseCount(pno);
		
		if(result > 0) {
			Project p = pService.selectDetailList(pno);
			ArrayList<Stack> stackList = pService.selectStackList();
			
			model.addAttribute("p",p).addAttribute("stackList",stackList);
					
			return "project/projectDetailView";
		} else {
			return "common/errorPage";
		}		
	}
	
	@RequestMapping("test.pr")
	public void test1(HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		
		pService.test1(m);
	}
	
	@RequestMapping("insert.pr")
	public String insertProject(Project p, Model model, HttpSession session) {
		p.setProWriter(((Member)session.getAttribute("loginUser")).getMemId());
		
		// System.out.println(p);
		
		int result = pService.insertProject(p);
				
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 프로젝트 작성이 완료되었습니다!");
			return "redirect:list.pj";
		}else {
			model.addAttribute("errorMsg", "프로젝트 작성 실패!");
			return "common/errorPage";
		}	
	}

	@RequestMapping(value="search.pr", produces="application/json; charset=utf-8")
	public void searchProject(String keyword, int cpage, HttpServletResponse response) throws JsonIOException, IOException {
		
		int searchCount = pService.selectSearchCount(keyword);
		int currentPage = cpage;
		
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 3, 8);
		
		ArrayList<Project> list1 = pService.selectSearchList(pi, keyword);
		ArrayList<Stack> stackList = pService.selectStackList();
		
		HashMap<String, Object> list = new HashMap<String, Object>();
		list.put("pi", pi);
		list.put("list1", list1);
		list.put("stackList", stackList);
		list.put("keyword", keyword);
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(list, response.getWriter());
	}
	
	
	

}
