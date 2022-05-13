package com.pj.pet.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {

	//petdelete
	public int setPetDelete(UserPetVO userPetVO) throws Exception;
	
	//petdetail
	public UserPetVO getPetDetail(UserPetVO userPetVO) throws Exception;
	
	//petupdate
	public int setPetUpdate(UserPetVO userPetVO) throws Exception;
	
	//petList
	public List<UserPetVO> getPetList(UserPetVO userPetVO) throws Exception;
	
	//petInsert
	public int setPetAdd(UserPetVO userPetVO) throws Exception;
	
	//delete
	public int setDelete(UserVO userVO) throws Exception;
	
	//update
	public int setUpdate(UserVO userVO) throws Exception;
	
	//mypage
	public UserVO getDetail(UserVO userVO) throws Exception;
	
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
