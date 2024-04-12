package com.kh.gogit.pr.controller;

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
	
}
