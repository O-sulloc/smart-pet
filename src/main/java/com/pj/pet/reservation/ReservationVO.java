package com.pj.pet.reservation;

import java.sql.Date;
import lombok.Data;

import java.util.List;

import com.pj.pet.service.ReservationSettingVO;
import com.pj.pet.service.ServiceVO;


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
