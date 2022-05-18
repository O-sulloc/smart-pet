package com.pj.pet.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor=Exception.class)
public class ReservationService {
	
	@Autowired
	private ReservationMapper reservationMapper;

	public int setAdd(ReservationVO reservationVO) throws Exception{
		
		return  reservationMapper.setAdd(reservationVO);
	}
	
	public List<ReservationVO> confirmList(ReservationVO reservationVO) throws Exception{
		
		return reservationMapper.confirmList(reservationVO);
	}
}
