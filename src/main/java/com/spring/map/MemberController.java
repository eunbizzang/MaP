package com.spring.map;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.model.MailUtil;
import com.spring.model.MemberDAO;
import com.spring.model.MemberDTO;

@Controller
public class MemberController {

	@Autowired
	private MemberDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("main.do")
	public String main() {
		
		return "main";
	}
	
	@RequestMapping("user_signup.do")
	public String signup() {
		
		return "signup";
	}
	
	
	@RequestMapping("user_loginPage.do")
	public String loginPage() {
		
		return "login";
	}
	
	@RequestMapping("agreement1.do")
	public String agreement1() {
		
		return "agreement1";
	}
	
	@RequestMapping("agreement2.do")
	public String agreement2() {
		
		return "agreement2";
	}
	
	
	// 회원가입
	@RequestMapping("user_signup_ok.do")
	public void signupOk(MemberDTO dto, HttpServletResponse response) throws IOException {
	
		
		int check = this.dao.userPhoneCheck(dto.getPhone());
		
		dto.setPwd(bcryptPasswordEncoder.encode(dto.getPwd()));
		
		
		response.setContentType("text/html; charset=UTF-8"); 
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('사용중인 핸드폰 번호입니다.')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			int res = this.dao.insertMember(dto);
			if(res > 0) {
				out.println("<script>");
				out.println("alert('회원가입 축하드립니다~')");
				out.println("location.href='user_loginPage.do'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('회원가입에 실패하셨습니다')");
				out.println("history.back()");
				out.println("</script>");
			}
		}
		
	}
	
	
	// id 중복 체크 컨트롤러
		@ResponseBody
		@RequestMapping(value = "/Check.do", produces="text/plane")
		public String idCheck(@RequestBody String paramData) {

			String id = paramData.trim();
			
			 int check = this.dao.userIdCheck(id);
			 
			 if(check > 0) {
				 return "check";
			 } else {
				 return "0";
			 }
		}
	
		
		// 로그인
		@RequestMapping("user_login.do")
		public String loginOk(MemberDTO dto, Model model, BindingResult bindingResult,
				HttpServletResponse response, HttpServletRequest request) throws IOException {
			
			int res = this.dao.userIdCheck(dto.getId());
			
			MemberDTO db_dto = this.dao.getMember(dto.getId());
			
			response.setContentType("text/html; charset=UTF-8");
			
			HttpSession session = request.getSession();
			
			PrintWriter out = response.getWriter();
			
			
			if(res > 0) {
				if(bcryptPasswordEncoder.matches(dto.getPwd(), db_dto.getPwd())) {
					model.addAttribute("db_dto", db_dto);
					session.setAttribute("id", db_dto.getId());
					return "main";
				}else {
					out.println("<script>");
					out.println("alert('비밀번호를 확인해주세요.')");
					out.println("history.back()");
					out.println("</script>");
					return null;
				}
			}else {
				out.println("<script>");
				out.println("alert('아이디를 확인해주세요.')");
				out.println("history.back()");
				out.println("</script>");
				return null;
			} 
			
		}
	
		
		// 로그아웃
		@RequestMapping("logout.do")
		public String logout(HttpSession session, HttpServletResponse response) {
			
	        session.invalidate();
	        
	       
	        
	        return "main";
	    }



		@RequestMapping("findId.do")
		public String findId() {
			
			return "find_id";
		}
		
		@RequestMapping("findPwd.do")
		public String findPwd() {
			
			return "find_pwd";
		}
		
		
		// 아이디 찾기
		@RequestMapping(value = "/searchId.do", method = RequestMethod.POST)
		@ResponseBody
		public String searchId(@RequestParam("name") String name,
				@RequestParam("phone") String phone, MemberDTO dto) throws IOException {

			dto.setName(name);
			dto.setPhone(phone);
			
			MemberDTO db_dto = this.dao.userFindId(dto);
			
			String result = db_dto.getId();
			return result;
		}
		
		
		// 비밀번호 찾기 (임시 비밀번호 이메일 전송)
		@RequestMapping("user_findPwd.do")
		public void searchPwd(MemberDTO dto, HttpServletResponse response) throws Exception {
			
			MemberDTO search_dto = this.dao.userFindPwd(dto);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			// 가입된 이메일이 존재한다면 이메일 발송
			if(search_dto != null) {
				
				// 임시 비밀번호 생성(UUID 이용)
				String tempPw = UUID.randomUUID().toString().replace("-", "");	// -를 제거
				tempPw = tempPw.substring(0, 6);	// 6자리 임시 비밀번호
				
				search_dto.setPwd(tempPw);
				
				// 메일 전송
				MailUtil mail = new MailUtil();
				mail.sendMail(search_dto);
				
				// 임시 비밀번호 암호화하여 DB에 다시 저장
				String securePw = bcryptPasswordEncoder.encode(search_dto.getPwd());
				dto.setPwd(securePw);
				
				int res = this.dao.modifyPwd(dto);
				if(res > 0) {
					out.println("<script>");
					out.println("alert('임시 비밀번호를 입력하신 메일로 발송하였습니다.')");
					out.println("location.href='user_loginPage.do'");
					out.println("</script>");
				}else {
					out.println("<script>");
					out.println("alert('아이디 또는 이메일을 확인해주세요.')");
					out.println("history.back()");
					out.println("</script>");
				}
			}else {
				out.println("<script>");
				out.println("alert('아이디 또는 이메일을 확인해주세요.')");
				out.println("history.back()");
				out.println("</script>");
			}
			
		}
		
		
		// 개인정보 수정 폼 페이지로 이동
		@RequestMapping("modify.do")
		public String modify(@RequestParam("id") String id, Model model) {
			
			MemberDTO dto = this.dao.getMember(id);
			model.addAttribute("dto", dto);
			return "mypage";
		}
		
		
		// 개인정보 수정
		@RequestMapping("modifyOk.do")
		public void modifyOk(@RequestParam("id") String id, @RequestParam("now_pwd") String now_pwd,
				MemberDTO dto, HttpServletResponse response) throws IOException {
			
			MemberDTO db_dto = this.dao.getMember(id);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			// 현재 비밀번호 값이 db값과 같아야 수정 가능
			if(bcryptPasswordEncoder.matches(now_pwd, db_dto.getPwd())) {
				dto.setPwd(bcryptPasswordEncoder.encode(dto.getPwd()));	// 변경 비밀번호값 암호화
				int res = this.dao.modifyOk(dto);
				if(res > 0) {
					out.println("<script>");
					out.println("alert('개인정보수정 성공하셨습니다.')");
					out.println("location.href='main.do'");
					out.println("</script>");
				}else {
					out.println("<script>");
					out.println("alert('개인정보수정 실패하셨습니다.')");
					out.println("history.back()");
					out.println("</script>");
				}
			}else { // 현재 비밀번호 값이 다른 경우
				out.println("<script>");
				out.println("alert('현재 비밀번호를 확인해주세요.')");
				out.println("history.back()");
				out.println("</script>");
			}
			
		}
		
		
		@RequestMapping("delete.do")
		public void deleteId(@RequestParam("id") String id, HttpServletResponse response,
				HttpSession session) throws IOException {
			int res = this.dao.deleteId(id);
			response.setContentType("text/html; charset=utf-8"); 
			PrintWriter out = response.getWriter();
			
			if(res > 0) {
				session.invalidate();
				out.println("<script>");
				out.println("alert('회원 탈퇴 완료.')");
				out.println("location.href='main.do'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('회원 탈퇴 실패.')");
				out.println("history.back()");
				out.println("<script>");
			}
		}
		
		
	
}
