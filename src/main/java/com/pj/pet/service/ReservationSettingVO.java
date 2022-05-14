package com.pj.pet.service;

import java.sql.Time;

import lombok.Data;

@Data
public class ReservationSettingVO {

	private Long setNum;    //setting 일련번호 [pk]
	private Long serNum;    //서비스 일련번호 
	private Long capacity;  //한 텀당 수용인원 
	private	Long term;      //몇 분 단위로 예약 할건지  (분단위로 작성)
	private Long timeCase;  //0:평일 1:주말 
	private Time startBreaktime; //점심시간 시작 
	private Time endBreaktime;   //점심시간 끝 
	private String holiday;  //쉬는 요일 
} 
