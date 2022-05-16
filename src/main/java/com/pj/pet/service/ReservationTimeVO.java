package com.pj.pet.service;

import java.sql.Time;

import lombok.Data;

@Data
public class ReservationTimeVO {

	private Long setNum;
	private Long serNum;
	private Long timecase;
	private String openTime;
	private String closeTime;
}


