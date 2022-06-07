package com.pj.pet.user;

import java.util.List;

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
	
	//petdelete
	public int setPetDelete(UserPetVO userPetVO) throws Exception{
		return userMapper.setPetDelete(userPetVO);
	}
	
	//petdetail
	public UserPetVO getPetDetail(UserPetVO userPetVO) throws Exception{
		return userMapper.getPetDetail(userPetVO);
	}
	
	//petupdate
	public int setPetUpdate(UserPetVO userPetVO) throws Exception{
		return userMapper.setPetUpdate(userPetVO);
	}
	
	//petlist
	public List<UserPetVO> getPetList(UserPetVO userPetVO) throws Exception{
		List<UserPetVO> ar =  userMapper.getPetList(userPetVO);
		return ar;
	}
	
	//petInsert
	public int setPetAdd(UserPetVO userPetVO) throws Exception{
		return userMapper.setPetAdd(userPetVO);
	}
	
	//delete
	public int setDelete(UserVO userVO) throws Exception{
		return userMapper.setDelete(userVO);
	}
	
	//pwUpdate
	public int setPwUpdate(UserVO userVO) throws Exception{
		return userMapper.setPwUpdate(userVO);
	}
	
	//Update
	public int setUpdate(UserVO userVO) throws Exception{
		return userMapper.setUpdate(userVO);
	}
	
	//mypage
	public UserVO getDetail(UserVO userVO) throws Exception{
		return userMapper.getDetail(userVO);
	}
	
	//setResetPw
	public void setResetPw(UserVO userVO) throws Exception{
		userMapper.setResetPw(userVO);
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
		
		//pw=checkpw
		if(!userVO.getPw().equals(userVO.getCheckPw())) {
			check=true;
			bindingResult.rejectValue("checkPw", "user.pw.notEqual");
		}
		
		//id중복검사
		UserVO idCheck=userMapper.getId(userVO);
		if(idCheck != null) {
			check = true;
			bindingResult.rejectValue("id", "user.id.exist");
		}
		
		//email 중복검사
		UserVO emailCheck = userMapper.getEmail(userVO);
		if(emailCheck != null) {
			check = true;
			bindingResult.rejectValue("email", "user.email.exist");
		}
		
		return check;
	}
	
	//회원가입
	public int setAdd(UserVO userVO) throws Exception{
		return userMapper.setAdd(userVO);
	}
	
	
	
	//관리자 페이지
	public List<UserVO> getData() throws Exception{
		return userMapper.getData();
	}
	
	//관리자페이지 - 유저 ROLE 변경
	public int setUserRole(UserVO userVO) throws Exception{
		return userMapper.setUserRole(userVO);
	}
	
}
