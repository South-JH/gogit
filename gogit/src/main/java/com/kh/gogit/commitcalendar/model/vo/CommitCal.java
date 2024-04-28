package com.kh.gogit.commitcalendar.model.vo;

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
public class CommitCal {
	
	private String owner;
	private String repoName;
	private String commitDate;

}
