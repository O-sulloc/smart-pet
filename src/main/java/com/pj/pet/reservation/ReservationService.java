package com.pj.pet.reservation;

import java.util.List;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pj.pet.service.ReservationSettingVO;
import com.pj.pet.service.ServiceVO;
import com.pj.pet.user.UserVO;

@Service
@Transactional(rollbackFor=Exception.class)
public class ReservationService {
	
	@Autowired
	private ReservationMapper reservationMapper;
	
	//예약 중복 방지
	public Long repetition(ReservationVO reservationVO) throws Exception{
		return reservationMapper.repetition(reservationVO);
	}
	
	//예약 정보 수정
	public int setUpdate(ReservationVO reservationVO) throws Exception{
		return reservationMapper.setUpdate(reservationVO);
	}

	//예약 정보 수정을 위한 상세 정보 전달
	public ReservationVO getDetail(ReservationVO reservationVO) throws Exception{
		return reservationMapper.getDetail(reservationVO);
	}
	// 예약 추가
	public int setAdd(ReservationVO reservationVO) throws Exception{
		
		return  reservationMapper.setAdd(reservationVO);
	}
	// 예약 목록
	public List<ReservationVO> confirmList(ReservationVO reservationVO) throws Exception{
		
		return reservationMapper.confirmList(reservationVO);
	}

	// 예약 삭제 (취소)
	public int setDelete(ReservationVO reservationVO) throws Exception{
		return reservationMapper.setDelete(reservationVO);
	}
	
	//예약 시간 띄어주기
	public ReservationSettingVO getAllReservationSetting(ServiceVO serviceVO) throws Exception{
		return reservationMapper.getAllReservationSetting(serviceVO);
	}
	
	//예약 시간 띄어주기
	public ServiceVO getService (ServiceVO serviceVO) throws Exception{
		return reservationMapper.getService(serviceVO);
	}
	
	//serviceUserInterceptor user role가져오기
	public UserVO serviceUserInterceptor(UserVO userVO) throws Exception{
		return reservationMapper.serviceUserInterceptor(userVO);
	}
}
