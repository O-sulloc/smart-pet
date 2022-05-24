package com.pj.pet.carts;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.pj.pet.user.UserVO;

@Controller
@RequestMapping("cart/*")
public class CartController {

	@Autowired
	private CartService cartService;

	@PostMapping("add")
	public ModelAndView cartAdd(CartVO cartVO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		UserVO user = (UserVO) session.getAttribute("user");

		// 로그인 x
		if (user == null) {
			mv.addObject("result", 2);
			mv.setViewName("common/result");
			return mv;
		}
		// 로그인 o
		int result = cartService.cartAdd(cartVO);
		cartVO.setId(user.getId());

		mv.addObject("result", result);
		mv.setViewName("common/result");
		return mv;
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
