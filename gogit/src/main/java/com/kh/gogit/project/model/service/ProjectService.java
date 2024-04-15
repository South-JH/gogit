package com.kh.gogit.project.model.service;

import java.util.ArrayList;

import com.kh.gogit.common.model.vo.PageInfo;
import com.kh.gogit.project.model.vo.Project;

public interface ProjectService {
	
	int selectListCount();
	ArrayList<Project> selectList(PageInfo pi);

}
