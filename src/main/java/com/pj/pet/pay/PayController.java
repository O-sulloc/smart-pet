package com.pj.pet.pay;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pj.pet.carts.CartVO;
import com.pj.pet.order.OrderService;
import com.pj.pet.order.OrderVO;
import com.pj.pet.products.ProductVO;

@Controller
@RequestMapping("pay/*")
public class PayController {
	// 결제 페이지 카트 리스트

	@Autowired
	private PayService payService;
	@Autowired
	private OrderService orderService;

	@GetMapping("pay_form")
	public ModelAndView payCartList(ModelAndView mv, CartVO cartVO, Long[] cartNum) throws Exception {

		List<CartVO> ar = payService.payCartList(cartVO, cartNum);

		mv.addObject("list", ar);
		mv.setViewName("pay/pay_form");

		return mv;
	}
	
	@PostMapping("pay_form")
	public ModelAndView setAdd(PayVO payVO, @RequestParam(value = "cartNum[]") Long[] cartNum, Long payNum) throws Exception {
		ModelAndView mv = new ModelAndView();

		int result = payService.setAdd(payVO, cartNum);
		//결제->주문 add
		OrderVO orderVO =new OrderVO();
		orderVO.setId(payVO.getId());
		orderVO.setPayNum(payVO.getPayNum());
		orderService.setAdd(orderVO);
		orderVO.setPayNum(orderVO.getPayNum());
		orderService.getOrderName(orderVO);

		mv.addObject("result",result);
		mv.setViewName("common/result");

		return mv;
	}

}
