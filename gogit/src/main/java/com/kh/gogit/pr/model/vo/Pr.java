package com.kh.gogit.pr.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Pr {

	private int prNo;
	private String prTitle;
	private String prContent;
	private String createDate;
	private String prTime;
	private String status;
	private String stackName;
	private String memId;
	private int count;
	

	
}
