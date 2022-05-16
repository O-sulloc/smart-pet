package com.pj.pet.reservation;

import java.sql.Date;

import com.pj.pet.service.ServiceVO;

import lombok.Data;
@Data
public class ReservationVO {

	
	 private Long resNum;
	 private String id;
	 private Long serNum;
	 private Date resDate;
	 private String resTime;
	 private String resMemo;
	 private Long resState;
	 
	 private ServiceVO serviceVO;
	 
	 
}
