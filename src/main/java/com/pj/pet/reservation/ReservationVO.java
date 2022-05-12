package com.pj.pet.reservation;

import java.sql.Date;

import lombok.Data;
@Data
public class ReservationVO {

	
	 private Long resNum;
	 private String id;
	 private Long serNum;
	 private Date resDate;
	 private Date resTime;
	 private String resMemo;
	 private Long resState;
}
