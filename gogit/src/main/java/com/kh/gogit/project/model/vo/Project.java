package com.kh.gogit.project.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Project {
	
	private int proNo;
    private String proWriter; // member_id 참조
    private String proStack; // 사용기술스택
    private String proTitle; // 프로젝트 이름
    private String proContent; // 프로젝트 모집내용
    private int proMember; // 모집인원
    private String proPeriod; // 프로젝트 진행기간
    private String deadLine; // 모집 마감일
    private String startDate; // 시작 예정일
    private String positoin; // 백엔드, 프론트엔드
    private String proStatus; // 프로젝트 모집상태
    private String status; // 프로젝트 게시글 상태
    private int count; // 조회수
    private String createDate; // 모집 생성일

}
