package com.spring.model;

public interface MemberDAO {

	// 회원가입
	int insertMember(MemberDTO dto);
	
	// 아이디 중복 검사
	int userIdCheck(String id);

	// 핸드폰번호 중복 검사
	int userPhoneCheck(String phone);
	
	// user info
	MemberDTO getMember(String id);
	
	// 아이디 찾기
	MemberDTO userFindId(MemberDTO dto);

	// 비밀번호 찾기
	MemberDTO userFindPwd(MemberDTO dto);
	
	// 비밀번호 변경
	int modifyPwd(MemberDTO dto);
	
	// 개인정보 수정
	int modifyOk(MemberDTO dto);
	
	// 회원탈퇴
	int deleteId(String id);
}
