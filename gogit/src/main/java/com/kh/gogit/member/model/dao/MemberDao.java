package com.kh.gogit.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gogit.member.model.vo.Member;

@Repository
public class MemberDao {
	
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	public int checkMemberId(SqlSessionTemplate sqlSession, String memId) {
		return sqlSession.selectOne("memberMapper.checkMemberId", memId);
	}
	
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}
	
	public Member loginMember(SqlSessionTemplate sqlSession, String memId) {
		return sqlSession.selectOne("memberMapper.loginMember", memId);
	}

}
