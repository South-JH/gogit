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
	private String[] labelName; // 라벨이름
	private String[] labelColor; // 라벨색
	private String[] assignee; // 이슈 검토자 닉네임
	private String[] assigneeAvatar; // 이슈 검토자 프로필 사진
	private String comment;
	private String createAt; // 작성일
	private String closeAt; // 닫힌일
	
}
