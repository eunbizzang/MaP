package com.spring.model;

import lombok.Data;

@Data
public class MemberDTO {

	private String id;
	private String pwd;
	private String name;
	private String phone;
	private String email;
	private String zipcode;
	private String addr1;
	private String addr2;
	private String regdate;
}
