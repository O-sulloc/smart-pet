package com.pj.pet.pay;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.pet.cartrefer.CartReferMapper;
import com.pj.pet.cartrefer.CartReferVO;
import com.pj.pet.carts.CartService;
import com.pj.pet.carts.CartVO;
import com.pj.pet.order.OrderService;
import com.pj.pet.order.OrderVO;

@Service
public class PayService {
	@Autowired
	private PayMapper payMapper;
	@Autowired
	private CartReferMapper cartReferMapper;
	@Autowired
	private CartService cartService;

	public List<CartVO> payCartList(CartVO cartVO, Long[] cartNum) throws Exception {

		List<CartVO> ar = new ArrayList<>();

		for (Long cn : cartNum) {

			cartVO.setCartNum(cn);
			CartVO cart = payMapper.payCartList(cartVO);
			ar.add(cart);

		}
		return ar;
	}

	public int setAdd(PayVO payVO, Long[] cartNum) throws Exception {

		int result = payMapper.setAdd(payVO);
		//결제 -> order add

		
		for (Long cn : cartNum) {
			//결제참조 add
			CartReferVO cartReferVO = new CartReferVO();
			cartReferVO.setCartNum(cn);
			cartReferVO.setPayNum(payVO.getPayNum());
			//결제 -> 카트 paycheck=1
			CartVO cartVO = new CartVO();
			cartVO.setCartNum(cn);
			result = cartService.cartpayUpdate(cartVO);
			result = cartReferMapper.setReferAdd(cartReferVO);
		}

		return result;
	}
}
