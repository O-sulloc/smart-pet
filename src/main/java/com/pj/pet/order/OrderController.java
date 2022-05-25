package com.pj.pet.order;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pj.pet.user.UserVO;

@Controller
@RequestMapping("order/*")
public class OrderController {
//	@PostMapping("add")
//	public ModelAndView setAdd(OrderVO orderVO,HttpSession session)throws Exception{
//		ModelAndView mv = new ModelAndView();
//		UserVO user = (UserVO) session.getAttribute("user");
//	}
}
