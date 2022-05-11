package com.pj.pet.user;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {

	//ResetPw(임시비밀번호발급)
	public int setResetPw(UserVO userVO) throws Exception;
	
	//findPw
	public int getFindPw(UserVO userVO) throws Exception;
	
	//findId
	public UserVO getFindId(UserVO userVO) throws Exception;
	
	//LOGIN
	public UserVO getLogin(UserVO userVO) throws Exception;
	
	//회원가입
	public int setAdd(UserVO userVO) throws Exception;
}
