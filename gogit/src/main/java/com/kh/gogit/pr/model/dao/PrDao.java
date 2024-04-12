package com.kh.gogit.pr.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gogit.common.model.vo.PageInfo;
import com.kh.gogit.pr.model.vo.Pr;

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

}
