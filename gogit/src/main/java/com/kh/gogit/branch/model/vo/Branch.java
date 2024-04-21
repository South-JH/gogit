package com.kh.gogit.branch.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Branch {
	
	private String name;
	private String commitSHA;
	private String commitUrl;
	private boolean isProtected;

}
