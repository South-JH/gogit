package com.kh.gogit.common.websockethandler.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.gogit.common.websockethandler.model.service.AlarmListServiceImpl;
import com.kh.gogit.common.websockethandler.model.vo.AlarmList;
import com.kh.gogit.member.model.service.MemberService;
import com.kh.gogit.member.model.service.MemberServiceImpl;
import com.kh.gogit.member.model.vo.Member;

@Controller
public class AlarmListController {

	@Autowired
	private AlarmListServiceImpl aService;
	
	@Autowired
	private MemberServiceImpl mService;
	
	@ResponseBody
	@RequestMapping("alarm.me")
	public ArrayList<AlarmList> selectAlarmList(String memId) {
		
		ArrayList<AlarmList> list = aService.selectAlarmList(memId);
		
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping("alarmTest.me")
	public ArrayList<AlarmList> selectAlarmListTest() {
		
		ArrayList<AlarmList> list = aService.selectAlarmListTest();
		
		
		return list;
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="update.al",produces = "text/html; charset=utf-8")
	
	public String updateAlarm(int alarmNo) {
		int result = aService.updateAlarm(alarmNo);
		return result>0?"success":"fail";
	}
	
	@ResponseBody
	@RequestMapping(value="application.pr")
	public String applyProject(int pNo,String memId,HttpSession session) {
	
		int result = aService.applyProject(pNo, memId);
		return result>0?"success":"fail";
	}
	
	@ResponseBody
	@RequestMapping(value="alcancel.pr")
	public String cancelProject(String memId,HttpSession session) {

		int result = aService.cancelProject(memId);
		return result>0?"success":"fail";
	}
	
	@ResponseBody
	@RequestMapping(value="delete.al")
	public String deleteAlarm(int alarmNo) {
		int result = aService.deleteAlarm(alarmNo);
		
		return result>0?"success":"fail";
	}
	
	@ResponseBody
	@RequestMapping("alCircle.al")
	public int alCircle(String memId) {
		
		int result = aService.alCircle(memId);
		
		return result;
		
	}
	
	@ResponseBody
	@RequestMapping("alDelete.al")
	public String prApplyCancel(AlarmList al) {
		int result = aService.prApplyCancel(al);
		return result>0?"success":"fail";
	}
	


}
