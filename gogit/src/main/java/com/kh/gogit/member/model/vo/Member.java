package com.kh.gogit.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Member {
	
	private String memId;
	private String memToken;
	private String memIntro;
	private Date createDate;
	private String status;
	private String stackName;
	private int team;
	private String teamStatus;
	private String gitNick;
	private String profile;
	private int fileNo;

}
