package com.pj.pet.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.pet.service.ServiceVO;

@Service
public class ReservationService {
	
	@Autowired
	ReservationMapper reservationMapper;

	public List<ReservationVO> getList(ServiceVO serviceVO)throws Exception{
		
		return reservationMapper.getList(serviceVO);
	}
	
}
