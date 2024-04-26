package com.kh.gogit.project.model.vo;

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
public class Calendar {

	private int calNo;
	private String calTitle;
	private String startDate;
	private String endDate;
	private String groupId;
	private String backgroundCol;
	private String status;

}
