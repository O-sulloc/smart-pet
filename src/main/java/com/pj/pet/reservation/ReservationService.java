package com.pj.pet.reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor=Exception.class)
public class ReservationService {
	
	@Autowired
	private ReservationMapper reservationMapper;

	public int setAdd(ReservationVO reservationVO) throws Exception{
		int result= reservationMapper.setAdd(reservationVO);
		return result;
	}
}
