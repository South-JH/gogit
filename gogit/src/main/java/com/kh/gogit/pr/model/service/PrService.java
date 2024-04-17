package com.kh.gogit.pr.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.gogit.common.model.vo.PageInfo;
import com.kh.gogit.pr.model.vo.Pr;
import com.kh.gogit.pr.model.vo.Reply;
import com.kh.gogit.pr.model.vo.Stack;

public interface PrService {
	
	
	int selectListCount();
	int increaseCount(int bno);
	Pr prdetailView(int bno);
	String memberProfile(String memId);
	int insertReply(Reply r);
	ArrayList<Reply> selectReply(int bno);
	int deleteReply(int rno);
	ArrayList<Stack> selectStack();
	int insertMyPr(Pr p);
	int selectSearchList(HashMap<String, String> keyword);
	ArrayList<Pr> searchPr(HashMap<String, String> keyword, PageInfo pi);
	int updateMyPr(Pr p);
	int deleteMyPr(int prNo);
	ArrayList<Pr> prTopList();
}
