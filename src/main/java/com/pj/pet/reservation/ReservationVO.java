package com.pj.pet.reservation;

import java.sql.Date;
import java.util.List;

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
	 
	 private String serName;
	 private String serTel;
	 private String serAddress;
	 private String serTime;
	 private String hospitalField;
	 private String homepage;
	 
	 
}
