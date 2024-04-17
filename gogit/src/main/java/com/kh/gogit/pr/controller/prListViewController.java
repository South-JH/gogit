package com.kh.gogit.pr.controller;

import java.sql.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.kh.gogit.common.model.vo.PageInfo;
import com.kh.gogit.common.template.Pagination;
import com.kh.gogit.pr.model.service.PrServiceImpl;
import com.kh.gogit.pr.model.vo.Pr;
import com.kh.gogit.pr.model.vo.Reply;
import com.kh.gogit.pr.model.vo.Stack;

@Controller
public class prListViewController {
	
	@Autowired
	private PrServiceImpl prService;
	
	

	@RequestMapping("mypr.pr")
	public String prListForm() {
		
		return "mypr_list/prListView";
	}

	
	
	@RequestMapping("detail.mp")
	public String prDetailView(int bno, Model model) {
		
		int result = prService.increaseCount(bno);
		Pr p = new Pr();
		String memProfile = "";
		
		if(result>0) {
			p = prService.prdetailView(bno);
			if(p!=null) {
				memProfile = prService.memberProfile(p.getMemId());
			}
			
			
		}else {
			//에러페이지
		}
	
		model.addAttribute("pr", p);
		model.addAttribute("memProfile", memProfile);
		
		return "mypr_list/prDetailView";
	}
	
	@ResponseBody
	@RequestMapping(value="rinsert.mp", produces = "text/html; charset=UTF-8")
	public String insertReply(Reply r) {
		
		
		
		int result = prService.insertReply(r);
		
		
		return result>0?"댓글 등록 성공" : "댓글등록 실패";
		
	}
	
	@ResponseBody
	@RequestMapping(value="rselect.mp")
	public ArrayList<Reply> selectReply(int bno) {
		
		ArrayList<Reply> list = prService.selectReply(bno);
		
		
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="rdelete.mp", produces = "text/html; charset=UTF-8")
	public String deleteReply(int rno) {
		
		int result = prService.deleteReply(rno);
		
		
		return result>0?"댓글 삭제 성공":"댓글 삭제 실패";
	}
	
	
	
	@RequestMapping("insertForm.mp")
	public String insertMyprForm() {
		
		
		
		return "mypr_list/insertMyprForm";
	}
	
	@ResponseBody
	@RequestMapping("select.st")
	public ArrayList<Stack> selectStack(){
		ArrayList<Stack> list = prService.selectStack();
		return list;
	}
	
	@RequestMapping("insert.mp")
	public String insertMyPr(Pr p) {
		int result = prService.insertMyPr(p);
		return "mypr_list/prListView";
	}
	
	@ResponseBody
	@RequestMapping("search.mp")
	public HashMap<String, Object> searchPr(@RequestParam(value="cpage", defaultValue = "1")int currentPage, String condition, String searchPr) {
		HashMap<String, String> keyword = new HashMap<String, String>();
		
		keyword.put("condition", condition);
		keyword.put("searchPr", searchPr);
		
		int listCount = prService.selectSearchList(keyword);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Pr> list = prService.searchPr(keyword,pi);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pi", pi);
		map.put("condition", condition);
		map.put("searchPr", searchPr);

		
		return map;
	}
	
	
	@RequestMapping("updateForm.mp")
	public String updateForm(int prNo,Model model) {
		Pr p =prService.prdetailView(prNo);
		String memProfile = prService.memberProfile(p.getMemId());

		model.addAttribute("pr", p);
		model.addAttribute("memProfile", memProfile);
		return "mypr_list/prUpdateForm";
	}
	
	@RequestMapping("update.mp")
	public String updateMyPr(Pr p, HttpSession session) {
	
		int result = prService.updateMyPr(p);
		if(result>0) {
			session.setAttribute("alertMsg", "수정 되었습니다.");
		}else {
			session.setAttribute("alertMsg", "수정 실패 했습니다.");
		}
		
		return "redirect:/mypr.pr";
	}
	
	@RequestMapping("delete.mp")
	public String deleteMyPr(int prNo, HttpSession session) {
		int result = prService.deleteMyPr(prNo);
		
		if(result>0) {
			session.setAttribute("alertMsg", "삭제 되었습니다.");
		}else {
			session.setAttribute("alertMsg", "삭제 실패했습니다.");
		}
		
		return "redirect:/mypr.pr";
	}
	
	@ResponseBody
	@RequestMapping("prTop.mp")
	public ArrayList<Pr> prTopList(Model model) {
		ArrayList<Pr> list = prService.prTopList();

		
		return list;
	}
	
}
