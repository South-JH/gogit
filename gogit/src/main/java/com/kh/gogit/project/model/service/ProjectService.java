package com.kh.gogit.project.model.service;

import java.util.ArrayList;

import com.kh.gogit.common.model.vo.PageInfo;
import com.kh.gogit.project.model.vo.Project;
import com.kh.gogit.project.model.vo.Stack;

public interface ProjectService {
	
	// 프로젝트 게시글 갯수구하기
	int selectListCount();
	
	// 프로젝트 게시글 페이징 처리해서 가져오기
	ArrayList<Project> selectList(PageInfo pi);
	
	// 프로젝트 작성하기
	int insertProject(Project p);
	
	// 스택 가져오기
	ArrayList<Stack> selectStackList();
	
	// searchCount 가져오기
	int selectSearchCount(String keyword);
	ArrayList<Project> selectSearchList(PageInfo pi, String keyword);
	
	// 조회수 증가
	int increaseCount(int pno);
	
	// 프로젝트 상세조회 가져오기
	Project selectDetailList(int pno);

}
