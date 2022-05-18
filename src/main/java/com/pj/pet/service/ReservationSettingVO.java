package com.pj.pet.service;




import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ReservationSettingVO {

	private Long setNum;    //setting 일련번호 [pk]
	private Long serNum;    //서비스 일련번호 
	private Long capacity;  //한 텀당 수용인원 
	private	Long term;      //몇 분 단위로 예약 할건지  (분단위로 작성)//0:평일 1:주말 
	private String startBreaktime; //점심시간 시작 
	private String endBreaktime;   //점심시간 끝 
	private String holiday;  //쉬는 요일 
	
	private List<ReservationTimeVO> reservationTimeVO;
} 
