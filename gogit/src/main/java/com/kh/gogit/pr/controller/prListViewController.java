package com.kh.gogit.pr.controller;

import java.sql.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

@Controller
public class prListViewController {
	
	@Autowired
	private PrServiceImpl prService;
	
	

	@RequestMapping("mypr.pr")
	public String prListForm() {
		
		return "mypr_list/prListView";
	}
	
	@ResponseBody
	@RequestMapping("prList.pr")
	public HashMap<String, Object> selectPrList(@RequestParam(value = "cpage",defaultValue = "1")int currentPage) {
		
		int listCount = prService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Pr> list = prService.selectPrList(pi);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pi", pi);
		map.put("list", list);
		
		
		
		return map;
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
	
	
	
	@RequestMapping("insertFrom.mp")
	public String insertMyprForm() {
		return "insertMyprForm";
	}
}
