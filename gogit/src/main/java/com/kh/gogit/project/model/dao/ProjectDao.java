package com.kh.gogit.project.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gogit.common.model.vo.PageInfo;
import com.kh.gogit.project.model.vo.Project;
import com.kh.gogit.project.model.vo.Stack;

@Repository
public class ProjectDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("projectMapper.selectListCount");
	}
	
	public ArrayList<Project> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("projectMapper.selectList", null, rowBounds);
	}
	
	public int insertProject(SqlSessionTemplate sqlSession, Project p) {
		return sqlSession.insert("projectMapper.insertProject", p);
	}
	
	public ArrayList<Stack> selectStackList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("projectMapper.selectStackList");
	}
	
	public int selectSearchCount(SqlSessionTemplate sqlSession, String keyword) {
		return sqlSession.selectOne("projectMapper.selectSearchCount", keyword);
	}
	
	public ArrayList<Project> selectSearchList(SqlSessionTemplate sqlSession, PageInfo pi, String keyword){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 내가보고있는페이지 - 1 * 한페이지당 몇개보여줄껀지의 개수/ 처음엔 하나도 건너뛰지말고 조회된거 전부 갖고와라
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("projectMapper.selectSearchList", keyword, rowBounds);
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int pno) {
		return sqlSession.update("projectMapper.increaseCount", pno);
	}
	
	public Project selectDetailList(SqlSessionTemplate sqlSession, int pno) {
		return sqlSession.selectOne("projectMapper.selectDetailList", pno);
	}

}
