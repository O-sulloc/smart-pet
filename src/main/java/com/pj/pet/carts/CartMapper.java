package com.pj.pet.carts;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pj.pet.user.UserVO;

@Mapper
public interface CartMapper {

	public List<CartVO> getCartList(CartVO cartVO)throws Exception;
	
	public int cartAdd(CartVO cartVO)throws Exception;
	
	public List<CartVO> cartList(UserVO userVO)throws Exception;
	
	public int cartUpdate(CartVO cartVO)throws Exception;
	
	public int cartDelete(CartVO cartVO)throws Exception;

	
}
