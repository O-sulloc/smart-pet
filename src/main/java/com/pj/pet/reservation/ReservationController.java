package com.pj.pet.reservation;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.pj.pet.service.ServiceVO;

@RestController
public class ReservationController {

	@Autowired
	private ReservationService reservationService;
	
	@PostMapping(value="add")
	public String add(ReservationVO reservationVO) throws Exception{
		int result = reservationService.setAdd(reservationVO);
		System.out.println("예약 완료");
		return "redirect:./detail";
	}
	
	
	@GetMapping(value="add")
	public void setAdd(ReservationVO reservationVO, Model model, ServiceVO serviceVO) throws Exception{
		List<ReservationVO> ar = new ArrayList<>();
		
		reservationVO.setSerNum(serviceVO.getSerNum());
//		reservationVO=reservationService.detail(reservationVO);// serviceService.detail(serviceVO);
		model.addAttribute("vo",reservationVO);
	}
}
