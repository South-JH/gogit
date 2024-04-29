package com.kh.gogit.project.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.gogit.common.model.vo.PageInfo;
import com.kh.gogit.member.model.vo.Member;
import com.kh.gogit.pr.model.vo.Reply;
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
	
	// 프로젝트 참여하기(신청자입장)
	int updateApplyProject(HashMap<String, String> map);
	
	// 프로젝트 취소하기(신청자입장)
	int updateCancleProject(HashMap<String, String> map);
	
	// 프로젝트 모집 마감(모집자 입장)
	int updateCompleteProject(HashMap<String, String> map);
	
	// 프로젝트 모집 재개(모집자 입장)
	int updateRestartProject(HashMap<String, String> map);
	
	// 세션 갈아끼운 유저 조회해오기
	Member selectMember(String memId);
	
	// 프로젝트 수정하기
	int updateProject(Project p);
	
	// 모집중만 조회
	ArrayList<Project> applySelectList(PageInfo pi);
	
	// 모집완료만 조회
	ArrayList<Project> applycompleteList(PageInfo pi);
	
	// 모집중 카운트 가져오기
	int applyListCount();
	
	// 모집완료 카운트 가져오기
	int applycompleteListCount();
	
	// 댓글 등록
	int insertReply(Reply r);
	
	// 댓글 가져오기
	ArrayList<Reply> selectReplyList(int pno);
	
	// 댓글 삭제
	int deleteReply(int pno);
	
	// 프로젝트 멤버들 가져오기
	ArrayList<Member> selectProjectMemberList(String nickName);

}
