package com.kh.gogit.pr.model.service;

import java.util.ArrayList;

import com.kh.gogit.common.model.vo.PageInfo;
import com.kh.gogit.pr.model.vo.Pr;

public interface PrService {
	
	
	int selectListCount();
	ArrayList<Pr> selectPrList(PageInfo pi);
	
}
