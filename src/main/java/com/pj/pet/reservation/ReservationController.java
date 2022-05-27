package com.pj.pet.reservation;


import java.sql.Date;
import java.util.ArrayList;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pj.pet.service.ReservationSettingVO;
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

	// 서비스 예약 폼 추가
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
			
			// 로그인이 안되어 있을 경우
			int result =0;
			
			mv.setViewName("./user/login");
			
			System.out.println("예약 실패");
			
			
		}
		
		return mv;
	}
	
	// 서비스 예약 폼
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
	
	// 사용자 예약 목록 확인
	@GetMapping(value="/user/appointment")
	public ModelAndView confirmList(HttpSession session,ReservationVO reservationVO,ServiceVO serviceVO )throws Exception{
		ModelAndView mv = new ModelAndView();
		UserVO userVO= (UserVO)session.getAttribute("user");
		String id=userVO.getId();
		
		reservationVO.setId(id);
		List<ReservationVO> confirmList = reservationService.confirmList(reservationVO);
//		confirmList=reservationService.confirmList(reservationVO.getResTime().substring(0, 5));
//		System.out.println("예약 시간"+reservationVO.getResTime());
//		reservationVO.setResTime(reservationVO.getResTime().substring(0,5));
		
		mv.addObject("confirmList",confirmList);
		mv.setViewName("./user/appointment");
		
		return mv;
	}
	
	// 사용자 예약 수정을 위한 상세 정보
	@GetMapping("/user/appointmentDetail")
	public ModelAndView getDetail(HttpSession session, ReservationVO reservationVO,ServiceVO serviceVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		UserVO userVO= (UserVO)session.getAttribute("user");
		String id=userVO.getId();
		
		reservationVO.setId(id);
		serviceVO = reservationService.getService(serviceVO);
		reservationVO=reservationService.getDetail(reservationVO);
		ReservationSettingVO reservationSettingVO= reservationService.getAllReservationSetting(serviceVO);
		mv.addObject("vo",serviceVO);
		mv.addObject("vo",reservationVO);
		mv.addObject("settingVO",reservationSettingVO);
		mv.setViewName("./user/appointmentUpdate");
		return mv;
		
	}
	// 사용자 예약 수정 폼 -상세 정보랑 겹치는건가..? 줄일수 있는지
	@GetMapping("/user/appointmentUpdate")
	public ModelAndView setUpdate(HttpSession session,ReservationVO reservationVO,ServiceVO serviceVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		UserVO userVO= (UserVO)session.getAttribute("user");
		String id=userVO.getId();
		
		reservationVO.setId(id);
		serviceVO = reservationService.getService(serviceVO);
		reservationVO=reservationService.getDetail(reservationVO);
		ReservationSettingVO reservationSettingVO= reservationService.getAllReservationSetting(serviceVO);
		mv.addObject("vo",serviceVO);
		mv.addObject("vo",reservationVO);
		mv.addObject("settingVO",reservationSettingVO);
		mv.setViewName("./user/appointmentUpdate");
		return mv;
	}

	// 사용자 예약 수정 하기 (수정 후 예약 목록 보여줌)
	@PostMapping("/user/appointmentUpdate")
	public ModelAndView setUpdate(HttpSession session,ReservationVO reservationVO,ModelAndView mv) throws Exception{
		
		UserVO userVO= (UserVO)session.getAttribute("user");
		String id=userVO.getId();
		
		reservationVO.setId(id);
		int reseult= reservationService.setUpdate(reservationVO);
		mv.addObject("vo",reservationVO);
		mv.setViewName("redirect:./appointment");
		return mv;
	}

	// 사용자 예약 취소
	@GetMapping("/user/appointmentDelete")
	public ModelAndView setDelete(ReservationVO reservationVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result=reservationService.setDelete(reservationVO);
		if(result>0) {
			mv.setViewName("common/getResult");
			mv.addObject("msg","예약 취소되었습니다.");
			mv.addObject("path","./appointment");
			
		}else {
			mv.setViewName("common/getResult");
			mv.addObject("msg","취소 실패하였습니다.");
			mv.addObject("path","$");
		}
		return mv;
	}
	
}
