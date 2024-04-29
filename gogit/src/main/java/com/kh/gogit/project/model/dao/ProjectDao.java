package com.kh.gogit.project.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gogit.common.model.vo.PageInfo;
import com.kh.gogit.member.model.vo.Member;
import com.kh.gogit.pr.model.vo.Reply;
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
		int result = sqlSession.insert("projectMapper.insertProject", p);
		if(result > 0) {
			return sqlSession.update("projectMapper.updateWriter", p);
		}else {
			return 0;
		}
		
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
	
	public int updateApplyProject(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("projectMapper.updateApplyProject", map);
	}
	
	public Member selectMember(SqlSessionTemplate sqlSession, String memId) {
		return (Member)sqlSession.selectOne("memberMapper.loginMember", memId);
	}
	
	public int updateCancleProject(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("projectMapper.updateCancleProject", map);
	}
	
	public int updateCompleteProject(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		int result = sqlSession.update("projectMapper.updateCompleteProject", map);
		if(result > 0) {
			return sqlSession.update("projectMapper.updateMemStatus", map);	
		}else {
			return 0;
		}
	}
	
	public int updateRestartProject(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("projectMapper.updateRestartProject", map);
	}
	
	public ArrayList<Project> applySelectList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("projectMapper.applySelectList", null, rowBounds);
	}
	
	public int updateProject(SqlSessionTemplate sqlSession, Project p) {
		return sqlSession.update("projectMapper.updateProject", p);
	}
	
	public int applyListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("projectMapper.applyListCount");
	}
	
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("projectMapper.insertReply", r);
	}
	
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int pno){
		return (ArrayList)sqlSession.selectList("projectMapper.selectReplyList", pno);
	}
	
	public int deleteReply(SqlSessionTemplate sqlSession, int pno) {
		return sqlSession.update("projectMapper.deleteReply", pno);
	}
	
	public int applycompleteListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("projectMapper.applycompleteListCount");
	}
	
	public ArrayList<Project> applycompleteList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("projectMapper.applycompleteList", null, rowBounds);
	}
	
	public ArrayList<Member> selectProjectMemberList(SqlSessionTemplate sqlSession, String nickName){
		return (ArrayList)sqlSession.selectList("memberMapper.selectProjectMemberList", nickName);
	}
}
