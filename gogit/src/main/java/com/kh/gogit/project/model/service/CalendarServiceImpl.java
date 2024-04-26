package com.kh.gogit.project.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.gogit.project.model.dao.CalendarDao;
import com.kh.gogit.project.model.vo.Calendar;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private CalendarDao cDao;

	@Override
	public int insertCalEvent(Calendar cal) {
		// TODO Auto-generated method stub
		return cDao.insertCalEvent(sqlSession,cal);
	}

	@Override
	public int updateCalEvent(Calendar cal) {
		// TODO Auto-generated method stub
		return cDao.updateCalEvent(sqlSession,cal);
	}

	@Override
	public int deleteCalEvent(int eNo) {
		// TODO Auto-generated method stub
		return cDao.deleteCalEvent(sqlSession,eNo);
	}

	@Override
	public ArrayList<Calendar> selectCalEvent(String groupId) {
		// TODO Auto-generated method stub
		return cDao.selectCalEvent(sqlSession,groupId);
	}

	@Override
	public int checkNo() {
		// TODO Auto-generated method stub
		return cDao.checkNo(sqlSession);
	}
}
