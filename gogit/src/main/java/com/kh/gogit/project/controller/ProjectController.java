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
import com.kh.gogit.member.model.service.MemberServiceImpl;
import com.kh.gogit.member.model.vo.Member;
import com.kh.gogit.pr.model.vo.Reply;
import com.kh.gogit.project.model.service.ProjectServiceImpl;
import com.kh.gogit.project.model.vo.Project;
import com.kh.gogit.project.model.vo.Stack;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectServiceImpl pService;
	/*
	@RequestMapping("list.pj")
	public ModelAndView selectList(@RequestParam (value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		int listCount = pService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 3, 8);
		
		ArrayList<Project> list = pService.selectList(pi);
		ArrayList<Stack> stackList = pService.selectStackList();
		
		// 여기서 rightbar에 담을 애들 조회해오기
		//ArrayList<Member> prMemberList = pService.selectProjectMemberList();
		selectProMember();
		mv.addObject("pi",pi)
		  .addObject("list", list)
		  .addObject("stackList", stackList)
		  .setViewName("project/projectListView");
		
		return mv;
	}
	
	
	public String selectProMember(Model model) { 
		ArrayList<Member> prMemberList = pService.selectProjectMemberList();					
		
	        model.addAttribute("prMemberList", prMemberList);
	        return "common/rightBar";    
	}
	
	*/
	
	@RequestMapping("list.pj")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
	    int listCount = pService.selectListCount();
	    
	    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 3, 8);
	    
	    ArrayList<Project> list = pService.selectList(pi);
	    ArrayList<Stack> stackList = pService.selectStackList();
	    
	    // selectProMember() 메서드 호출하여 ModelAndView 객체 반환받기
	    ModelAndView rightBarModelAndView = selectProMember();
	    
	    mv.addObject("pi", pi)
	      .addObject("list", list)
	      .addObject("stackList", stackList)
	      .addAllObjects(rightBarModelAndView.getModel()) // rightBarModelAndView에서 모든 모델 속성 추가
	      .setViewName("project/projectListView");
	    
	    return mv;
	}

	// selectProMember() 메서드 정의
	public ModelAndView selectProMember() {
	    ModelAndView modelAndView = new ModelAndView("common/rightBar");
	    ArrayList<Member> prMemberList = pService.selectProjectMemberList(); // 데이터베이스에서 멤버 리스트를 가져와서
	    modelAndView.addObject("prMemberList", prMemberList); // 모델에 추가
	    return modelAndView; // 모델이 포함된 ModelAndView 객체 반환
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
	
	@RequestMapping("insert.pr")
	public String insertProject(Project p, Model model, HttpSession session) {
		p.setProWriter(((Member)session.getAttribute("loginUser")).getMemId());
		
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
	
	@RequestMapping(value="applypro.pr", produces="application/json; charset=utf-8")
	public void updateApplyProject(String pno, String userId, HttpServletResponse response, HttpSession session) throws IOException {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("pno", pno);
		map.put("userId", userId);
		
		int result = pService.updateApplyProject(map);
		
		if(result>0) {			
			Member updateMember = pService.selectMember(userId);
			session.setAttribute("loginUser", updateMember);
		}
		response.getWriter().print(result);
	}
	
	@RequestMapping(value="cancel.pr", produces="application/json; charset=utf-8")
	public void cancelProject(String pno, String userId, HttpServletResponse response, HttpSession session) throws IOException {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("pno", pno);
		map.put("userId", userId);
		
		int result = pService.updateCancleProject(map);
		
		if(result>0) {			
			Member updateMember = pService.selectMember(userId);
			session.setAttribute("loginUser", updateMember);
		}
		response.getWriter().print(result);
	}	
	
	@RequestMapping(value="projectEnd.pr", produces="application/json; charset=utf-8")
	public void completeProject(String pno, String userId, HttpServletResponse response, HttpSession session) throws IOException {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("pno", pno);
		map.put("userId", userId);
		
		int result = pService.updateCompleteProject(map);
		
		if(result>0) {			
			Member updateMember = pService.selectMember(userId);
			session.setAttribute("loginUser", updateMember);
		}
		response.getWriter().print(result);
	}
	
	@RequestMapping(value="projectReStart.pr", produces="application/json; charset=utf-8")
	public void restartProject(String pno, String userId, HttpServletResponse response, HttpSession session) throws IOException {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("pno", pno);
		map.put("userId", userId);
		
		int result = pService.updateRestartProject(map);
		
		if(result>0) {			
			Member updateMember = pService.selectMember(userId);
			session.setAttribute("loginUser", updateMember);
		}
		response.getWriter().print(result);
	}
	
	@RequestMapping(value="applyingList.pr", produces="application/json; charset=utf-8")
	public void applySelectList(@RequestParam (value="cpage", defaultValue ="1" ) int currentPage, HttpServletResponse response) throws JsonIOException, IOException {
		int listCount = pService.applyListCount();
	
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 3, 8);
		ArrayList<Project> list = pService.applySelectList(pi);
		
		ArrayList<Stack> stackList = pService.selectStackList();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pi", pi);
		map.put("list", list);
		map.put("stackList", stackList);
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(map, response.getWriter());
	}
	
	@RequestMapping(value="applycompleteList.pr", produces="application/json; charset=utf-8")
	public void applycompleteList(@RequestParam (value="cpage", defaultValue = "1") int currentPage, HttpServletResponse response) throws JsonIOException, IOException {
		int listCount = pService.applycompleteListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 3, 8);
		
		ArrayList<Project> list = pService.applycompleteList(pi);
		ArrayList<Stack> stackList = pService.selectStackList();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pi", pi);
		map.put("list", list);
		map.put("stackList", stackList);
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(map, response.getWriter());	
	}
	
	@RequestMapping("updateForm.pr")
	public String updateProjectEnrollForm(int pno, Model model) {
		model.addAttribute("p", pService.selectDetailList(pno));	
		return "project/projectUpdateForm";
	}
	
	@RequestMapping("update.pr")
	public String updateProject(Project p, Model model, HttpSession session) {		
		int result = pService.updateProject(p);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 게시글 수정되었습니다.");
			return "redirect:detail.pr?pno=" + p.getProNo();
		}else {
			model.addAttribute("errorMsg","게시글 수정 실패");
			return "common/errorPage";
		}	
	}
	
	@ResponseBody
	@RequestMapping(value="rlist.pr", produces="application/json; charset=utf-8")
	public String ajaxSelectReplyList(int pno) {
		ArrayList<Reply> list = pService.selectReplyList(pno);
		
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="rinsert.pr")
	public String ajaxInsertReply(Reply r) {
		int result = pService.insertReply(r);
		return result > 0 ? "success" : "fail";
	}
	
	@ResponseBody
	@RequestMapping(value="prdelete.pr")
	public String ajaxDeleteReply(int pno) {
		int result = pService.deleteReply(pno);
		return result > 0 ? "success" : "fail";
	}
}
