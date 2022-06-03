package com.pj.pet.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.pj.pet.reservation.ReservationVO;
import com.pj.pet.user.UserVO;

import com.pj.pet.util.Pager;


@Mapper
public interface ServiceMapper {
	
	//overdue 거부로 자동 update
	public int updateOverdue(UserVO userVO)throws Exception;
	
	//overdue(방문확인 체크용)
	public List<ReservationVO> getOverdue(Pager pager)throws Exception;

	//예약확인 메일에 들어갈 데이터가져오기 
	public ReservationVO getMailData(ReservationVO reservationVO)throws Exception;
	
	//예약자 이메일 가져오기 
	public UserVO findEmail(ReservationVO reservationVO)throws Exception;
	
	//예약시간 업데이트 
	public int updateReservationTime(ReservationTimeVO reservationTimeVO)throws Exception;
	
	//예약세팅 업데이트
	public int updateReservationSetting(ReservationSettingVO reservationSettingVO)throws Exception;
	
	//아이디로 예약시간정보 가져오기
	public List<ReservationTimeVO> getReservationTime(UserVO userVO)throws Exception;
	
	//아이디로 예약세팅정보 가져오기 
	public ReservationSettingVO getReservationSetting(UserVO userVO) throws Exception;
	
	//예약세팅 페이지 인터셉터 확인용 
	public ReservationSettingVO getReservationSettingCheck(UserVO userVO)throws Exception;
	
	//서비스 판매자 권한 여부 확인 
	public UserVO sellerInterceptor(UserVO userVO) throws Exception;
	
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
	
	//예약 리스트 _월별 _resState Count
	public List<ReservationVO> getResStateCount(ReservationVO reservationVO)throws Exception;
	
	//예약 리스트 _월별 
	public List<ReservationVO> getMonthReservationList(Pager pager)throws Exception;
	
	//예약 리스트 _최신순 
	public List<ReservationVO> getReservationList(Pager pager)throws Exception;


	//예약 리스트 _대기중인예약만 
	public List<ReservationVO> getResStateIs0(Pager pager)throws Exception;
	
	//예약 리스트 _날짜별 
	public List<ReservationVO> getDayReservationList(Pager pager)throws Exception;
	
	//get totalCount
	public Long getTotalCount(Pager pager)throws Exception;
	
	//update reservationState
	public int setUpdateResState(ReservationVO reservationVO)throws Exception;
	//==
	
	//list : getList

	// parameterType HashMap 을 이용해서 여러개 넣기
	public ServiceVO getSerKindPager(HashMap<String, Object> map);
	
	// 고객측 서비스 list : getList serKind 1 병원/ 2 미용실
	public List<ServiceVO> getListc(Pager pager) throws Exception;
	
	public List<ServiceVO> getServiceKind(ServiceVO serviceVO) throws Exception;
	
	
	//detail소비자측 판매자측 detail에 몰았음  - 안쓰는 메서드
	public ServiceVO getDetailc(ServiceVO serviceVO) throws Exception;
	
	//total
	public Long total(Pager pager) throws Exception;

}
