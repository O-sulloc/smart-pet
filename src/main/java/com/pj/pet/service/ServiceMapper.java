package com.pj.pet.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.pj.pet.reservation.ReservationVO;
import com.pj.pet.user.UserVO;

import com.pj.pet.util.Pager;


@Mapper
public interface ServiceMapper {


	
	
	public ServiceVO getDetail(ServiceVO serviceVO)throws Exception;

	//서비스 파일 업데이트
	public int setUpdateFile(ServiceFileVO serviceFileVO)throws Exception;
	
	//서비스 파일 디테일
	public ServiceFileVO getFileDetail(ServiceVO serviceVO)throws Exception;
	
	//서비스 디테일 
	public ServiceVO getService(ServiceVO serviceVO)throws Exception;
	
	//예약세팅 모음 select
	public ReservationSettingVO getAllReservationSetting(ServiceVO serviceVO)throws Exception;
	
	//예약세팅 등록
	public int setReservationSetting(ReservationSettingVO reservationSettingVO)throws Exception;
	
	//운영시간 등록
	public int setReservationTime(ReservationTimeVO reservationTimeVO)throws Exception;
	
	//서비스 등록 
	public int setService(ServiceVO serviceVO)throws Exception;
	
	//서비스 정보 수정 
	public int setUpdate(ServiceVO serviceVO)throws Exception;
	
	//서비스 대표 파일 추가
	public int setFileAdd(ServiceFileVO serviceFileVO)throws Exception;
	
	//서비스 삭제
	public int setDelete(ServiceVO serviceVO)throws Exception;
	
	//예약 리스트 
	public List<ReservationVO> getList(UserVO userVO)throws Exception;

	//list : getList
	public List<ServiceVO> getListc(Pager pager) throws Exception;
	
	//detail
	public ServiceVO getDetailc(ServiceVO serviceVO) throws Exception;
	
	//total
	public Long total(Pager pager) throws Exception;

}
