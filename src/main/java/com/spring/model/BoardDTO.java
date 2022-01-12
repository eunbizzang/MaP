package com.spring.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardDTO {

	private int bno;
	private String bwriter;
	private String btitle;
	private String bcontent;
	private String bdate;
	private String bredate;
	private int bhit;
	private int blike;
	private String bfile_name;
	private MultipartFile uploadFile;
	private int reply_count;
	private int bchecklike;
}
