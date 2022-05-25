package com.pj.pet.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderService {
	@Autowired
	private OrderMapper orderMapper;
	
	public int setAdd(OrderVO orderVO)throws Exception{
		return setAdd(orderVO);
	}
}
