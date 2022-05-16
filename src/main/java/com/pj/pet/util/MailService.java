package com.pj.pet.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.pj.pet.user.UserVO;

@Service
public class MailService {

//	@Autowired
	private JavaMailSender javaMailSender;
	
	public void sendMail() {
		UserVO userVO = new UserVO();
		String toUser = "bujjaf@gmail.com";
		
		SimpleMailMessage simpleMessage = new SimpleMailMessage();
		
		simpleMessage.setTo(toUser);
		simpleMessage.setSubject("[petService 임시 비밀번호 입니다.]");
		simpleMessage.setText("<h1>임시비밀번호 발급</h1>" +
				"<br/>비밀번호 찾기를 통한 임시 비밀번호입니다."+
				"<br/>임시비밀번호 : ㅋㅋ"+
				"<br/>로그인 후 비밀번호를 변경 해주세요."+
				"<a href='http://localhost:80/user/login"+
				">로그인 페이지</a>");
		javaMailSender.send(simpleMessage);
	}
}
