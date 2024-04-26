package com.kh.gogit.project.model.service;

import java.util.ArrayList;

import com.kh.gogit.project.model.vo.Calendar;

public interface CalendarService {

	int insertCalEvent(Calendar cal);
	int updateCalEvent(Calendar cal);
	int deleteCalEvent(int eNo);
	ArrayList<Calendar> selectCalEvent(String groupId);
	int checkNo();
}
