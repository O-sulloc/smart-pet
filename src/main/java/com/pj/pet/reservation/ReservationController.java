package com.pj.pet.reservation;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pj.pet.service.ServiceVO;

@Controller
@RequestMapping("reservationManage/*")
public class ReservationController {

	@Autowired
	private ReservationService reservationService;
	
	@GetMapping("reservationSetting")
	public ModelAndView setReservationSetting()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("reservationManage/reservationSetting");
		return mv;
	}
	
	@GetMapping("calendar")
	public ModelAndView setCalendar()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("reservationManage/calendar");
		return mv;
	}
	
	@GetMapping("manage")
	public ModelAndView manage()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("reservationManage/manage");
		return mv;
	}
	
	//예약 현황 
	@GetMapping("list")
	public ModelAndView getList(HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		//session에서 id 빼와서 넣어 
		ServiceVO serviceVO= new ServiceVO();
		serviceVO.setId("id1");
		List<ReservationVO> ar=reservationService.getList(serviceVO);
		
		mv.addObject("list", ar);
		mv.setViewName("reservationManage/list");
		return mv;
	}
}
