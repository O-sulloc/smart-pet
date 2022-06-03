package com.pj.pet.reservation;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pj.pet.service.ReservationSettingVO;
import com.pj.pet.service.ServiceVO;
import com.pj.pet.user.UserVO;

	

@Mapper
public interface ReservationMapper {
	
	//예약 중복 방지
	public Long repetition(ReservationVO reservationVO) throws Exception;
	
	// 예약 정보 수정 (날짜,시간,메모 변경)
	public int setUpdate(ReservationVO reservationVO) throws Exception;
	
	// 예약 정보 수정을 위한 상세 정보 전달
	public ReservationVO getDetail(ReservationVO reservationVO) throws Exception;
	
	// 예약 추가
	public int setAdd(ReservationVO reservationVO) throws Exception;
	
	// 예약 목록 
	public List<ReservationVO> confirmList(ReservationVO reservationVO) throws Exception;

	// 예약 삭제 (취소)
	public int setDelete(ReservationVO reservationVO) throws Exception;
	
	//예약 시간 띄어주기
	public ReservationSettingVO getAllReservationSetting(ServiceVO serviceVO) throws Exception;
	
	//예약 시간 띄어주기
	public ServiceVO getService (ServiceVO serviceVO) throws Exception;
	
	//serviceUserInterceptor user role가져오기
	public UserVO serviceUserInterceptor(UserVO userVO) throws Exception;
}
