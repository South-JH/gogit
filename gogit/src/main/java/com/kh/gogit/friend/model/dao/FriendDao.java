package com.kh.gogit.friend.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gogit.common.model.vo.PageInfo;
import com.kh.gogit.friend.model.vo.Friend;
import com.kh.gogit.member.model.vo.Member;

@Repository
public class FriendDao {



   public int listCount(SqlSessionTemplate sqlSession, String memId) {
      
      return sqlSession.selectOne("friendMapper.listCount");
   }


   public int addFriend(SqlSessionTemplate sqlSession, Friend f) {
      
      return sqlSession.insert("friendMapper.addFriend");
   }

   public int acceptFriend(Friend f, SqlSessionTemplate sqlSession){
      return sqlSession.insert("friendMapper.acceptFriend", f);
   }

   public int acceptMyFriend(Friend f, SqlSessionTemplate sqlSession){
      return sqlSession.update("friendMapper.acceptMyFriend", f);
   }

   public int deleteFriend(Friend f,SqlSessionTemplate sqlsession) {
      return sqlsession.delete("friendMapper.deleteFriend", f);
   }
   
   public int deleteMyFriend(Friend f,SqlSessionTemplate sqlsession) {
      return sqlsession.delete("friendMapper.deleteMyFriend", f);
            
   }

   public int refuseFriend(Friend f, SqlSessionTemplate sqlSession){
      return sqlSession.insert("friendMapper.refuseFriend", f);
   }


   
public ArrayList<Member> searchMember(String search, String memId,SqlSessionTemplate sqlsession){
      
      HashMap<String, String> map = new HashMap<String, String>();
      map.put("search", search);
      map.put("memId", memId);
      
      return (ArrayList)sqlsession.selectList("friendMapper.searchMember", map);
      
   }


public ArrayList<Member> selectFriendList(String memId, SqlSessionTemplate sqlSession) {
	// TODO Auto-generated method stub
	return null;
}


public ArrayList<Member> allMemberList(String memId, SqlSessionTemplate sqlSession) {
	
	return (ArrayList)sqlSession.selectList("friendMapper.allMemberList", memId);
}









}