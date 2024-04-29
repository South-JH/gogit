package com.kh.gogit.common.websockethandler.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gogit.common.websockethandler.model.vo.AlarmList;
import com.kh.gogit.project.model.vo.Project;

@Repository
public class AlarmListDao {

	public String selectMemid(SqlSessionTemplate sqlSession, String gitNick) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("alarmMapper.selectMemId",gitNick);
	}

	public int insertAlarm(SqlSessionTemplate sqlSession, AlarmList al) {
		// TODO Auto-generated method stub
		int result = sqlSession.selectOne("alarmMapper.checkInsert",al);
		if(result>0) {
			return 0;
		}else {
			return sqlSession.insert("alarmMapper.insertAlarm",al);
		}
		
		
	}

	public ArrayList<AlarmList> selectAlarmList(SqlSessionTemplate sqlSession, String memId) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("alarmMapper.selectAlarmList",memId);
	}

	public int updateAlarm(SqlSessionTemplate sqlSession, int alarmNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("alarmMapper.updateAlarm",alarmNo);
	}

	public int applyProject(SqlSessionTemplate sqlSession, int pNo, String memId) {
		// TODO Auto-generated method stub
		Project p = new Project();
		p.setProNo(pNo);
		p.setProWriter(memId);
		System.out.println(p);
		return sqlSession.update("alarmMapper.applyProject",p);
	}

	public int cancelProject(SqlSessionTemplate sqlSession, String memId) {
		// TODO Auto-generated method stub
		return sqlSession.update("alarmMapper.cancelProject",memId);
	}

	public int deleteAlarm(SqlSessionTemplate sqlSession, int alarmNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("alarmMapper.deleteAlarm",alarmNo);
	}

	public ArrayList<String> selectTeamid(SqlSessionTemplate sqlSession, String team) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("alarmMapper.selectTeamid",team);
	}

	public ArrayList<String> checkMemId(SqlSessionTemplate sqlSession, String memId) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("alarmMapper.checkMemId",memId);
	}

	public int alCircle(SqlSessionTemplate sqlSession, String memId) {
		// TODO Auto-generated method stub
		try {
			return sqlSession.selectOne("alarmMapper.alCircle",memId);
		} catch (NullPointerException e) {
			return 0;
		}
		
	}

	public int prApplyCancel(SqlSessionTemplate sqlSession, AlarmList al) {
		// TODO Auto-generated method stub
		return sqlSession.update("alarmMapper.prApplyCancel", al);
	}

	public int rinsertAlarm(SqlSessionTemplate sqlSession, AlarmList al) {
		return sqlSession.insert("alarmMapper.insertAlarm",al);
		
	}
}
