package com.pj.pet.reservation;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pj.pet.service.ServiceVO;

@Mapper
public interface ReservationMapper {
	
	public List<ReservationVO> getList(ServiceVO serviceVO)throws Exception;
}
