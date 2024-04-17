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

}
