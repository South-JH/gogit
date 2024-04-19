package com.kh.gogit.milestone.model.vo;

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
public class Milestone {
	public int milNo;
	public String milTitle;
	public Date createDate;
	public Date modifyDate;
	public Date endDate;
	public String issuing;
	public int progress;
	public String status;
	public String memId;
	public int repoNo;

}


