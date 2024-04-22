package com.kh.gogit.common.websockethandler.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.gogit.common.websockethandler.model.dao.AlarmListDao;
import com.kh.gogit.common.websockethandler.model.vo.AlarmList;



@Service
public class AlarmListServiceImpl implements AlarmListService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AlarmListDao aDao;
	
	@Override
	public ArrayList<AlarmList> selectAlarmList(String memId) {
		// TODO Auto-generated method stub
		return aDao.selectAlarmList(sqlSession,memId);
	}

	@Override
	public int updateAlarm(int alarmNo) {
		// TODO Auto-generated method stub
		return aDao.updateAlarm(sqlSession,alarmNo);
	}

}
