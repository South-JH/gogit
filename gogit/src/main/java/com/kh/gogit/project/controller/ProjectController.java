package com.kh.gogit.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	public String detailView() {
		return "project/projectDetailView";
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
			return "project/projectListView";
		}else {
			model.addAttribute("errorMsg", "프로젝트 작성 실패!");
			return "common/errorPage";
		}	
	}
	
	
	

}
