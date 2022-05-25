package com.pj.pet.cartrefer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartReferService {
	
	@Autowired
	private CartReferMapper cartReferMapper;
	
	public int setReferAdd(CartReferVO cartReferVO)throws Exception{
		return cartReferMapper.setReferAdd(cartReferVO);
	}

}
