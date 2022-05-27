package com.pj.pet.carts;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.pet.user.UserVO;

@Service
public class CartService {
	@Autowired
	CartMapper cartMapper;

	public int cartAdd(CartVO cartVO) throws Exception {
		CartVO cartCheck = cartMapper.cartCheck(cartVO);
		if (cartCheck != null) {
			return 3;
		}
		return cartMapper.cartAdd(cartVO);
	}

	public List<CartVO> cartList(UserVO userVO) throws Exception {
		return cartMapper.cartList(userVO);
	}

	public int cartUpdate(CartVO cartVO) throws Exception {
		return cartMapper.cartUpdate(cartVO);
	}

	public int cartDelete(CartVO cartVO) throws Exception {
		return cartMapper.cartDelete(cartVO);
	}
	
	public int cartpayUpdate(CartVO cartVO)throws Exception{
		return cartMapper.cartpayUpdate(cartVO);
	}
}
