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
	private String repoContent;
	private String visibility;
	private String updateAt;
	private String language;
	private String stargazers;
	private String fork;
	private String openIssue;
	
}
