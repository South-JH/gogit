package com.kh.gogit.common.websockethandler.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.gogit.common.websockethandler.model.service.AlarmListServiceImpl;
import com.kh.gogit.common.websockethandler.model.vo.AlarmList;

@Controller
public class AlarmListController {

	@Autowired
	private AlarmListServiceImpl aService;
	
	@ResponseBody
	@RequestMapping("alarm.me")
	public ArrayList<AlarmList> selectAlarmList(String memId) {
		
		ArrayList<AlarmList> list = aService.selectAlarmList(memId);
		
		
		return list;
	}
	
	
	@RequestMapping("update.al")
	public String updateAlarm(int alarmNo) {
		int result = aService.updateAlarm(alarmNo);
		return result>0?"success":"fale";
	}
}
