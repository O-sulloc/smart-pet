package com.pj.pet.reservation;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.pj.pet.service.ServiceVO;

	

@Mapper
public interface ReservationMapper {

	public int setAdd(ReservationVO reservationVO) throws Exception;
	
	public List<ReservationVO> confirmList(ReservationVO reservationVO) throws Exception;

}
