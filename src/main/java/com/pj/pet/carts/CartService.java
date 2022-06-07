package com.pj.pet.carts;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.pet.user.UserVO;

@Service
public class CartService {
	@Autowired
	CartMapper cartMapper;

	public int cartAdd(CartVO cartVO, Integer buyCheck) throws Exception {
		if (buyCheck == null) {

			CartVO check = cartMapper.cartCheck(cartVO);

			if (check != null) {
				return 3;
			}
		} //buyCheck=2바로결제 ==payCheck 2 설정
		else if (buyCheck == 2) {
			cartVO.setPayCheck(buyCheck);
		} // cart add-> 기존에 장바구니가 없으면 payCheck 0 설정
		else {
			cartVO.setPayCheck(0);
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

	public int cartpayUpdate(CartVO cartVO) throws Exception {
		return cartMapper.cartpayUpdate(cartVO);
	}
	
	public int buyDelete(CartVO cartVO) throws Exception{
		return cartMapper.buyDelete(cartVO);
	}
	
	public List<CartVO> buyCheck(CartVO cartVO) throws Exception{
		return cartMapper.buyCheck(cartVO);
	}

}
