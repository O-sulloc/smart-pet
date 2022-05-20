package com.pj.pet.reservation;


import java.sql.Date;
import java.util.ArrayList;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pj.pet.service.ServiceVO;


import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


import com.pj.pet.service.ServiceVO;
import com.pj.pet.user.UserVO;

@RestController
public class ReservationController {

	@Autowired
	private ReservationService reservationService;
	


	
	@GetMapping("/reservation/calendar")
	public ModelAndView setCalendar()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("reservation/calendar");
		return mv;
	}


//	@ResponseBody
	@PostMapping(value="/reservation/confirm")
	public ModelAndView setAdd(HttpSession session,ReservationVO reservationVO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		UserVO userVO= (UserVO)session.getAttribute("user");
		
		if(userVO!=null) {
			reservationVO.setId(userVO.getId());
			int result= reservationService.setAdd(reservationVO);
			mv.addObject("vo",reservationVO);
			mv.setViewName("./reservation/confirm");
			System.out.println("========예약완료============");
		}else {
			int result =0;
			
			mv.setViewName("./user/login");
			
			System.out.println("예약 실패");
			
			
		}
		
		return mv;
	}
	
	@GetMapping("/reservation/confirm")
	public ModelAndView setAdd(@ModelAttribute ReservationVO reservationVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("./reservation/confirm");
		return mv;
	}
	
//	@GetMapping(value="/reservation/confirm")
//	public void setAdd(ReservationVO reservationVO, Model model, ServiceVO serviceVO) throws Exception{
//		List<ReservationVO> ar = new ArrayList<>();
//		
//		reservationVO.setSerNum(serviceVO.getSerNum());
//		model.addAttribute("vo",reservationVO);
//	}
//	
	
	
	@GetMapping(value="/user/appointment")
	public ModelAndView confirmList(HttpSession session,ReservationVO reservationVO,ServiceVO serviceVO )throws Exception{
		ModelAndView mv = new ModelAndView();
		UserVO userVO= (UserVO)session.getAttribute("user");
		String id=userVO.getId();
		
		reservationVO.setId(id);
		
		List<ReservationVO> confirmList = reservationService.confirmList(reservationVO);
		mv.addObject("confirmList",confirmList);
		mv.setViewName("./user/appointment");
		
		return mv;
	}
	
	@GetMapping("/user/appointmentDetail")
	public ModelAndView getDetail(HttpSession session, ReservationVO reservationVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		UserVO userVO= (UserVO)session.getAttribute("user");
		String id=userVO.getId();
		
		reservationVO.setId(id);
		reservationVO=reservationService.getDetail(reservationVO);
		mv.addObject("vo",reservationVO);
		mv.setViewName("./user/appointmentUpdate");
		return mv;
		
	}
	
	@GetMapping("/user/appointmentUpdate")
	public ModelAndView setUpdate(HttpSession session,ReservationVO reservationVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		UserVO userVO= (UserVO)session.getAttribute("user");
		String id=userVO.getId();
		
		reservationVO.setId(id);
		reservationVO= reservationService.getDetail(reservationVO);
		mv.addObject("vo",reservationVO);
		mv.setViewName("./user/appointmentUpdate");
		return mv;
	}

	@PostMapping("/user/appointmentUpdate")
	public ModelAndView setUpdate(HttpSession session,ReservationVO reservationVO,ModelAndView mv) throws Exception{
		
		UserVO userVO= (UserVO)session.getAttribute("user");
		String id=userVO.getId();
		
		reservationVO.setId(id);
		int reseult= reservationService.setUpdate(reservationVO);
		mv.addObject("vo",reservationVO);
		mv.setViewName("./user/appointmentUpdate");
		return mv;
	}

}
