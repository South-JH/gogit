package com.kh.gogit.search.model.vo;

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
public class Search {
	
	private String totalCount;
	private String login; // 아이디
	private String avatarUrl; // 프로필사진
	private String htmlUrl; // 누르면 넘어가는 링크
	private String type;
	
	private String name;
	private String visibility; // 퍼블릭인지
	private String language;
	private String description; // 레포내용
	
}
