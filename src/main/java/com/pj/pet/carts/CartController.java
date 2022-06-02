package com.pj.pet.carts;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.pj.pet.user.UserVO;

@Controller
@RequestMapping("cart/*")
public class CartController {

	@Autowired
	private CartService cartService;
	
	@PostMapping("add")
	@ResponseBody
	public Long cartAdd(CartVO cartVO, HttpSession session,Integer buyCheck) throws Exception {
		
		UserVO user = (UserVO) session.getAttribute("user");
		// 로그인 x상태
		if (user == null) {
			return 2L;
		}
		// 장바구니 중복체크
		int result = cartService.cartAdd(cartVO,buyCheck);
		if(result==3) {
			return 3L;
		}
		// 로그인 상태
		cartVO.setId(user.getId());
		Long cn=cartVO.getCartNum();
		return cn;
	}
	

	@GetMapping("list")
	public ModelAndView getCartList(HttpSession session, CartVO cartVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		UserVO user = (UserVO) session.getAttribute("user");
		cartVO.setId(user.getId());
		List<CartVO> ar = cartService.cartList(user);
		mv.addObject("list", ar);
		mv.setViewName("cart/list");
		return mv;
	}

	@PostMapping("update")
	public ModelAndView cartUpdate(CartVO cartVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = cartService.cartUpdate(cartVO);
		mv.addObject("result", result);
		mv.setViewName("common/result");

		return mv;
	}

	@PostMapping("delete")
	public ModelAndView setDelete(CartVO cartVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = cartService.cartDelete(cartVO);
		mv.setViewName("redirect:./list");
		mv.addObject("result", result);
		mv.setViewName("common/result");

		return mv;
	}
	
}
