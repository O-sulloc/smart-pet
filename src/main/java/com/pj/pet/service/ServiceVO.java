package com.pj.pet.service;


import java.util.List;

import com.pj.pet.util.Pager;

import lombok.Data;

@Data
public class ServiceVO {


	private String id;

	private Long serNum;
	private String serName;
	private String serTel;
	private String serAddress;

	private String serTime;//운영시간 
	private String hospitalField;
	private String homepage;
	private Long serKind;//0:병원 1:샵 
	
	private ServiceFileVO serviceFileVO;
	
	private List<ReservationSettingVO> reservationSettingVOs;
	
	//private Pager pager;
}

