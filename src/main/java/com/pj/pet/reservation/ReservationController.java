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
	

	
	@GetMapping("calendar")
	public ModelAndView setCalendar()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("reservationManage/calendar");
		return mv;
	}

	
}
