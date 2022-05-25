package com.pj.pet.data;

import java.sql.Date;

import lombok.Data;

@Data
public class DataVO {
	
	private Long apiSid;
	private String apiDongName;
	private String apiNewAddress;
	private String apiOldAddress;
	private String apiTel;
	private Double apiLat;
	private Double apiLng;
	private Date apiRegDate;
}
