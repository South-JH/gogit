package com.kh.gogit.pr.model.service;

import java.util.ArrayList;

import com.kh.gogit.common.model.vo.PageInfo;
import com.kh.gogit.pr.model.vo.Pr;
import com.kh.gogit.pr.model.vo.Reply;

public interface PrService {
	
	
	int selectListCount();
	ArrayList<Pr> selectPrList(PageInfo pi);
	int increaseCount(int bno);
	Pr prdetailView(int bno);
	String memberProfile(String memId);
	int insertReply(Reply r);
	ArrayList<Reply> selectReply(int bno);
	int deleteReply(int rno);
	
}
