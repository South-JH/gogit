package com.kh.gogit.repository.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Branch {

	private String branchName;
	private String commitSha;
	
}
