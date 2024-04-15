package com.kh.gogit.pr.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Reply {

	private int replyNo;
	private String memId;
	private String repContent;
	private String refPrNo;
	private String repDate;
	private String status;
	private String gitNick;

}
