package com.pj.pet.reservation;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ReservationController {

	@Autowired
	private ReservationService reservationService;
	
	@PostMapping("/reservation/{serNum}/{resDate}")
	public int setAdd(@PathVariable Long serNum,@PathVariable Date resDate)throws Exception {
		System.out.println("service Number:"+serNum);
		ReservationVO reservationVO = new ReservationVO();
		reservationVO.setSerNum(serNum);
		reservationVO.setResDate(resDate);
		int result = reservationService.setAdd(reservationVO);
		System.out.println("Result:"+result);
		return result;
	}
}
