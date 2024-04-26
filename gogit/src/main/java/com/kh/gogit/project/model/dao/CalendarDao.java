package com.kh.gogit.project.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gogit.project.model.vo.Calendar;

@Repository
public class CalendarDao {

	public int insertCalEvent(SqlSessionTemplate sqlSession, Calendar cal) {
		// TODO Auto-generated method stub
		int result = sqlSession.selectOne("CalendarMapper.checkInsert", cal);
		if(result>0) {
			return 0;
		}
		return sqlSession.insert("CalendarMapper.insertCalEvent",cal);
	}

	public ArrayList<Calendar> selectCalEvent(SqlSessionTemplate sqlSession, String groupId) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("CalendarMapper.selectCalEvent",groupId);
	}

	public int updateCalEvent(SqlSessionTemplate sqlSession, Calendar cal) {
		// TODO Auto-generated method stub
		return sqlSession.update("CalendarMapper.updateCalEvent",cal);
	}

	public int deleteCalEvent(SqlSessionTemplate sqlSession, int eNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("CalendarMapper.deleteCalEvent",eNo);
	}

	public int checkNo(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("CalendarMapper.checkNo");
	}

}
