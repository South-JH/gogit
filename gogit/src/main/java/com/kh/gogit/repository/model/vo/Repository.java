package com.kh.gogit.repository.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Repository {

	private int repoNo;
	private String repoTitle;
	private String repoContent; // 레파지토리 설명
	private String visibility;
	private String updateAt;
	private String language;
	private String stargazers;
	private String fork;
	private String openIssue;
	private String contentName; // 레파지토리 컨텐츠 내 파일명
	private String sha; // 파일 커밋 번호
	private String type; // 파일 타입
	private String path; // 파일 경로
	private String contentDesc; // 레파지토리 컨텐츠 내용
	private String owner;
	private String collaborator;
	private String avatar;
	private String permission; // 권한
	
}
