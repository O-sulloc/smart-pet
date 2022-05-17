package com.pj.pet.reservation;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReservationMapper {

	public int setAdd(ReservationVO reservationVO) throws Exception;
	
	public ReservationVO confirmDetail(ReservationVO reservationVO) throws Exception;
}