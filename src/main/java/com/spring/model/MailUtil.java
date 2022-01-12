package com.spring.model;

import org.apache.commons.mail.HtmlEmail;

public class MailUtil {
	public void sendMail(MemberDTO dto) throws Exception {
		
		//Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "almond8689";
		String hostSMTPpw = "!a159983";
		
		// 보내는 사람
		String fromEmail = "almond8689@naver.com";	// 보내는 사람 메일
		String fromName = "MaP";	// 보내는 사람 이름
		
		String subject = "";	// 메일 제목
		String msg = "";	// 메일 내용
		
		
		subject = "[MaP] 임시 비밀번호 발급";
		msg += "<div align='left'>";
		msg += "<h3>";
		msg += dto.getId() + "님의 임시 비밀번호입니다. <br>비밀번호를 변경하여 사용해주세요.";
		msg += "<p>임시 비밀번호 : ";
		msg += dto.getPwd() + "</p></div>";
		
		
		//email 전송
		String mailRecipient = dto.getEmail();
		try {
			// 객체 선언
			HtmlEmail mail = new HtmlEmail();
			mail.setDebug(true);
			mail.setCharset(charSet);
			mail.setSSLOnConnect(true);
			mail.setHostName(hostSMTP);
			mail.setSmtpPort(587);
			mail.setAuthentication(hostSMTPid, hostSMTPpw);
			mail.setStartTLSEnabled(true);
			mail.addTo(mailRecipient, charSet);
			mail.setFrom(fromEmail, fromName, charSet);
			mail.setSubject(subject);
			mail.setHtmlMsg(msg);
			mail.send();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
