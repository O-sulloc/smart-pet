package com.pj.pet.service;

import java.sql.Time;

import lombok.Data;

@Data
public class ReservationTimeVO {

	private Long serNum;
	private Long timeCase;
	private Time openTime;
	private Time closeTime;
}
