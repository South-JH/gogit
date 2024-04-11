package com.kh.gogit.project.model.vo;

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
public class Project {
	
	private int proNo;
    private String proWriter; // member_id 참조
    private String proStack;
    private String proTitle;
    private String proContent;
    private int proMember;
    private String proPeriod;
    private String deadLine;
    private String startDate;
    private String positoin;
    private String proStatus;
    private String status;
    private int count;
    private String createDate;

}
