package com.kh.gogit.issue.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Issue {

	private String state; // 상태 open / close
	private String title; // 제목
	private String body; // 내용
	private String user; // 작성자닉네임
	private String userAvatar; // 유저프로필사진
	private String[] labels; // 라벨이름 배열형
	private String[] labelColors; // 라벨색 배열형
	private String[] assignees; // 이슈 검토자 닉네임 배열형
	private String[] assigneesAvatar; // 이슈 검토자 프로필 사진 배열형
	private String comment;
	private String createAt; // 작성일
	private String closeAt; // 닫힌일
	private String assignee; // 검토자이름 문자형
	private String assigneeAvatar; // 검토자프로필사진 문자형
	private String label; // 라벨이름 문자형
	private String labelColor; // 라벨색 문자형
	private String labelDesc; // 라벨설명
	
}
