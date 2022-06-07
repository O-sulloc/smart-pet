package com.pj.pet.pay;

import org.apache.ibatis.annotations.Mapper;

import com.pj.pet.carts.CartVO;

@Mapper
public interface PayMapper {
	
	public CartVO payCartList(CartVO cartVO)throws Exception;
	
	public int setAdd(PayVO payVO) throws Exception;
	
	
}
