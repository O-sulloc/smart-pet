package com.pj.pet.cartrefer;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CartReferMapper {
	
	public int setReferAdd(CartReferVO cartReferVO)throws Exception;

}
