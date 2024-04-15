package com.kh.gogit.pr.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gogit.common.model.vo.PageInfo;
import com.kh.gogit.pr.model.vo.Pr;
import com.kh.gogit.pr.model.vo.Reply;

@Repository
public class PrDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("prMapper.selectListCount");
	}

	public ArrayList<Pr> selectPrList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); 
	    int limit = pi.getBoardLimit();
		
		return (ArrayList)sqlSession.selectList("prMapper.selectPrList", null, new RowBounds(offset, limit));
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
		return sqlSession.update("prMapper.increaseCount",bno);
	}

	public Pr prdetailView(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("prMapper.prdetailView",bno);
	}

	public String memberProfile(SqlSessionTemplate sqlSession, String memId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("prMapper.memberProfile",memId);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		// TODO Auto-generated method stub
		return sqlSession.insert("prMapper.insertReply",r);
	}

	public ArrayList<Reply> selectReply(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("prMapper.selectReply",bno);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, int rno) {
		// TODO Auto-generated method stub
		return sqlSession.update("prMapper.deleteReply",rno);
	}




}
