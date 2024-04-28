package com.kh.gogit.project.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.gogit.project.model.service.CalendarServiceImpl;
import com.kh.gogit.project.model.vo.Calendar;

@Controller
public class CalendarController {

	@Autowired
	private CalendarServiceImpl cService;
	
	@ResponseBody
	@RequestMapping(value="insert.cal", produces="text/html; charset=utf-8")
	public String insertCalEvent(Calendar cal) {

		int result = cService.insertCalEvent(cal);
		return result>0?"이벤트 등록 성공":"";
	}
	
	@ResponseBody
	@RequestMapping(value="select.cal")
	public ArrayList<Calendar> selectCalEvent(String groupId){
		
		ArrayList<Calendar> list = cService.selectCalEvent(groupId);
		
		return list;
	}
	
	
	@ResponseBody
	@RequestMapping(value="update.cal",produces="text/html; charset=utf-8")
	public String updateCalEvent(Calendar cal) {
		int result = cService.updateCalEvent(cal);
		return result>0?"이벤트 수정 성공":"";
	}
	
	@ResponseBody
	@RequestMapping(value="delete.cal",produces="text/html; charset=utf-8")
	public String deleteCalEvent(int calNo) {
		int result = cService.deleteCalEvent(calNo);
		return result>0?"이벤트 삭제 성공":"";
	}
	
	
	@ResponseBody
	@RequestMapping("checkNo.cal")
	public int checkNo() {
		int result = cService.checkNo();
		return result+1;
	}
}
