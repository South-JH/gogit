package com.kh.gogit.pullrequest.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Pullrequest {
	
	private int pullNo;
	private String pullTitle;
	private String pullContent;
	private String pullWriter;
	private String pullManager;
	private String pullManagerProfile;
	private int repoNo;
	private int issNo;
	private int milNo;
	private String status;
	private String createDate;

}
