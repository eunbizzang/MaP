package com.spring.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO{

	
	@Autowired
	private SqlSessionTemplate SqlSession;
	
	// 회원가입
	@Override
	public int insertMember(MemberDTO dto) {
		
		return this.SqlSession.insert("signup", dto);
	}

	// 아이디 중복체크
	@Override
	public int userIdCheck(String id) {
		return this.SqlSession.selectOne("idCheck", id);
	}
	
	// 비밀번호 중복체크
	@Override
	public int userPhoneCheck(String phone) {
		return this.SqlSession.selectOne("phoneCheck", phone);
	}
	
	// user info
	@Override
	public MemberDTO getMember(String id) {
		return this.SqlSession.selectOne("login", id);
	}

	@Override
	public MemberDTO userFindId(MemberDTO dto) {
		return this.SqlSession.selectOne("findId", dto);
	}

	@Override
	public MemberDTO userFindPwd(MemberDTO dto) {
		return this.SqlSession.selectOne("findPwd", dto);
	}

	@Override
	public int modifyPwd(MemberDTO dto) {
		return this.SqlSession.update("modifyPwd", dto);
	}

	@Override
	public int modifyOk(MemberDTO dto) {
		return this.SqlSession.update("modifyOk", dto);
	}

	@Override
	public int deleteId(String id) {
		return this.SqlSession.delete("deleteId", id);
	}

	

	




}
