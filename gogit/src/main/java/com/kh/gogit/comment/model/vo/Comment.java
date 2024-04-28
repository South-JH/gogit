package com.kh.gogit.comment.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
public class Comment {
	
	private String comment;
	private String commentWriter;
	private String commentWriterProfile;
	private Boolean isAuthor;
	private String createDate;

}
