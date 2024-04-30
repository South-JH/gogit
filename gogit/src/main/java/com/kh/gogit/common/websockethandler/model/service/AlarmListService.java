package com.kh.gogit.common.websockethandler.model.service;

import java.util.ArrayList;

import com.kh.gogit.common.websockethandler.model.vo.AlarmList;

public interface AlarmListService {
	ArrayList<AlarmList> selectAlarmList(String memId);
	int updateAlarm(int memId);
	String selectMemId(String memId);
	int applyProject(int pNo,String memId);
	int cancelProject(String memId);
	int deleteAlarm(int alarmNo);
	int alCircle(String memId);
	int prApplyCancel(AlarmList al);
	int updateCalAlarm(int alarmNo);
	int deleteCalAlarm(int alarmNo);
	ArrayList<AlarmList> selectAlarmListTest();
}
