package com.pj.pet.order;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pj.pet.user.UserVO;

@Mapper
public interface OrderMapper {
	
	public int setAdd(OrderVO orderVO) throws Exception;
	
	public String getOrderName() throws Exception;
	
	public List<OrderVO> orderList(UserVO userVO)throws Exception;
}
