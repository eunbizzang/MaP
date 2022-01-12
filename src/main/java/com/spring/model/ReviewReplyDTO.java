package com.spring.model;

import lombok.Data;

@Data
public class ReviewReplyDTO {

	private int no;
	private int bno;
	private String writer;
	private String content;
	private String wdate;
	private String rdate;
}
