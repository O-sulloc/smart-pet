package com.pj.pet.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.pet.user.UserVO;

@Service
public class OrderService {	
	@Autowired
	private OrderMapper orderMapper;
	
	public int setAdd(OrderVO orderVO) throws Exception{
		return orderMapper.setAdd(orderVO);
	}
	
	public String getOrderName() throws Exception{
		return orderMapper.getOrderName();
	}
	
	public List<OrderVO> orderList(UserVO userVO)throws Exception{
		return orderMapper.orderList(userVO);
	}
}
