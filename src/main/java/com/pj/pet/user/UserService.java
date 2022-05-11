package com.pj.pet.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.pj.pet.util.MailUtils;
import com.pj.pet.util.TempKey;

@Service
public class UserService {

	@Autowired
	private UserMapper userMapper;
	
	//setResetPw
	public void setResetPw(UserVO userVO) throws Exception{
		userMapper.setResetPw(userVO);
		
		String newPw = new TempKey().getKey(6, false);
		userVO.setPw(newPw);
		 MailUtils sendMail = new MailUtils(null);
			sendMail.setSubject("[petService 커뮤니티 임시 비밀번호 입니다.]"); //메일제목
			sendMail.setText(
					"<h1>임시비밀번호 발급</h1>" +
							"<br/>비밀번호 찾기를 통한 임시 비밀번호입니다."+
							"<br/>임시비밀번호 :   <h2>"+userVO.getPw()+"</h2>"+
							"<br/>로그인 후 비밀번호 변경을 해주세요."+
							"<a href='http://localhost:80/user/login"+
							">로그인 페이지</a>");
			sendMail.setFrom("[보낼이메일]", "petService");
			sendMail.setTo(userVO.getEmail());
			sendMail.send();
	}
	
	//getFindPw
	public int getFindPw(UserVO userVO) throws Exception{
		return userMapper.getFindPw(userVO);
	}
	
	//getFindId
	public UserVO getFindId(UserVO userVO) throws Exception{
		return userMapper.getFindId(userVO);
	}
	
	//login
	public UserVO getLogin(UserVO userVO) throws Exception{
		return userMapper.getLogin(userVO);
	}
	
	//사용자 정의 검증 메서드 (pw==checkPw)
	public boolean userError(UserVO userVO,BindingResult bindingResult) throws Exception{
		boolean check = false;
		//false -> 에러없음, 검증성공
		
		check=bindingResult.hasErrors();
		
		if(!userVO.getPw().equals(userVO.getCheckPw())) {
			check=true;
			bindingResult.rejectValue("checkPw", "user.pw.notEqual");
		}
		
		return check;
	}
	
	//회원가입
	public int setAdd(UserVO userVO) throws Exception{
		return userMapper.setAdd(userVO);
	}
	
}
