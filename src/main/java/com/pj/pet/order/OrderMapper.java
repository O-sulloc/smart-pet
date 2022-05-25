package com.pj.pet.order;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderMapper {
	
	public int setAdd(OrderVO orderVO)throws Exception;
}
