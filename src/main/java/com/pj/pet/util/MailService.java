package com.pj.pet.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.pj.pet.user.UserVO;

@Service
public class MailService {

	
	@Autowired
	private JavaMailSender javaMailSender;
	
	public void sendMail(String userEmail, String contents) {
		UserVO userVO = new UserVO();
		String toUser = userEmail;
		
		SimpleMailMessage simpleMessage = new SimpleMailMessage();
		
		simpleMessage.setTo(toUser);
		simpleMessage.setSubject("[petService 임시 비밀번호 입니다.]");
		simpleMessage.setText(contents);
		javaMailSender.send(simpleMessage);
	}
	

}
