package com.pj.pet.order;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.pj.pet.carts.CartVO;
import com.pj.pet.pay.PayService;
import com.pj.pet.pay.PayVO;
import com.pj.pet.products.ProductService;
import com.pj.pet.products.ProductVO;
import com.pj.pet.user.UserVO;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;
	@Autowired
	private PayService payService;
	@Autowired
	private ProductService productService;

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

	// 주문내역 상세페이지
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

	// 배송 
	@PostMapping("/order/update")
	public ModelAndView cartUpdate(OrderVO orderVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = orderService.shipUpdate(orderVO);
		mv.addObject("result", result);
		mv.setViewName("common/result");

		return mv;
	}
	
	// 환불
	@PostMapping("/order/refund")
	public ModelAndView refund(OrderVO orderVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = orderService.refund(orderVO);		
		mv.addObject("result", result);
		mv.setViewName("common/result");

		return mv;
	}
	

}
