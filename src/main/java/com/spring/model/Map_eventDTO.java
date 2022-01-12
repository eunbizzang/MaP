package com.spring.model;

import java.io.File;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Map_eventDTO {

	private int bno;
	private String btitle;
	private String bcont;
	private String bupload;
	private String bpath;
	private int bhit;
	private String bdate;
	private String bstart;
	private String bend;
	
}
