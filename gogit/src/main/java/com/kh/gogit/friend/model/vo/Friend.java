package com.kh.gogit.friend.model.vo;

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
public class Friend {
	
	
	
	
	private String bfGiver;
	private String bfTaker;
	private String status;
	private Date requestDate;
}
