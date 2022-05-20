package com.pj.pet.reservation;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.pj.pet.service.ServiceVO;

	

@Mapper
public interface ReservationMapper {
	
	public int setUpdate(ReservationVO reservationVO) throws Exception;
	
	public ReservationVO getDetail(ReservationVO reservationVO) throws Exception;
	
	public int setAdd(ReservationVO reservationVO) throws Exception;
	
	public List<ReservationVO> confirmList(ReservationVO reservationVO) throws Exception;

}
