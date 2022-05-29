package com.pj.pet.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.pj.pet.user.UserVO;

@Service
public class ReservationMailService {
	@Autowired
	private JavaMailSender javaMailSender;
	
	public void sendReservationMail(String userEmail, String contents) {
//		UserVO userVO = new UserVO();
		String toUser = userEmail;
		
		SimpleMailMessage simpleMessage = new SimpleMailMessage();
		
		simpleMessage.setTo(toUser);
		simpleMessage.setSubject("[Pet Service 예약이 승인되었습니다.]");
		simpleMessage.setText(contents);
		javaMailSender.send(simpleMessage);
	}
	


}
