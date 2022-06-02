package com.pj.pet.order;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pj.pet.cartrefer.CartReferVO;
import com.pj.pet.carts.CartVO;
import com.pj.pet.pay.PayVO;
import com.pj.pet.user.UserVO;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;

	// 주문내역 페이지
	@GetMapping("/user/orderList")
	public ModelAndView orderList(HttpSession session, OrderVO orderVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		UserVO user = (UserVO) session.getAttribute("user");
		orderVO.setId(user.getId());
		List<OrderVO> ar = orderService.orderList(orderVO);
		mv.addObject("olist", ar);
		mv.setViewName("user/orderList");
		return mv;
	}
	
	 //주문내역 상세페이지  
	  @GetMapping("/user/detailList") 
	  public ModelAndView orderDetailList(HttpSession session, CartVO cartVO, PayVO payVO) throws Exception {
	  ModelAndView mv = new ModelAndView();
	  UserVO user = (UserVO) session.getAttribute("user");
	  cartVO.setId(user.getId());
	  List<CartVO> ar2 = orderService.orderDetailList(payVO);
	  mv.addObject("plist", ar2);
	  mv.setViewName("user/detailList");
	  return mv;
	}
	 
}
