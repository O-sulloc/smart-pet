package com.pj.pet.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.pet.cartrefer.CartReferVO;
import com.pj.pet.carts.CartVO;
import com.pj.pet.pay.PayVO;
import com.pj.pet.user.UserVO;

@Service
public class OrderService {	
	@Autowired
	private OrderMapper orderMapper;
	
	public int setAdd(OrderVO orderVO) throws Exception{
		return orderMapper.setAdd(orderVO);
	}
	
	public List<OrderVO> orderList(OrderVO orderVO)throws Exception{
		return orderMapper.orderList(orderVO);
	}
	
	public int getOrderName(OrderVO orderVO) throws Exception{
		return orderMapper.getOrderName(orderVO);
	}
	
	public List<CartVO> orderDetailList(PayVO payVO)throws Exception{
		return orderMapper.orderDetailList(payVO);
	}
	
	public List<OrderVO> sellerOrder()throws Exception{
		return orderMapper.sellerOrder();
	}
	
	public int shipUpdate(OrderVO orderVO) throws Exception{
		return orderMapper.shipUpdate(orderVO);
	}
}
