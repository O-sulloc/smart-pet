package com.pj.pet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pj.pet.reservation.ReservationVO;
import com.pj.pet.user.UserVO;
import com.pj.pet.util.FileManager;


import org.springframework.transaction.annotation.Transactional;

import com.pj.pet.util.Pager;

@Service
@Transactional(rollbackFor = Exception.class)

public class ServiceService {

	@Autowired
	private ServiceMapper serviceMapper;

	@Autowired
	private FileManager fileManager;
	
	//예약 가능한 시간 띄어주기
	public Long resCount(ReservationVO reservationVO) throws Exception{
		return serviceMapper.resCount(reservationVO);
	}
	
	public int updateOverdue(UserVO userVO)throws Exception{
		return serviceMapper.updateOverdue(userVO);
	}
	
	public ReservationVO getMailData(ReservationVO reservationVO)throws Exception{
		return serviceMapper.getMailData(reservationVO);
	}
	
	public UserVO findEmail(ReservationVO reservationVO)throws Exception{
		return serviceMapper.findEmail(reservationVO); 
	}
	
	public int updateReservationSetting(ReservationSettingVO reservationSettingVO)throws Exception{
		return serviceMapper.updateReservationSetting(reservationSettingVO);
	}
	
	public int updateReservationTime(ReservationTimeVO reservationTimeVO)throws Exception{
		return serviceMapper.updateReservationTime(reservationTimeVO);
	}
	
	public List<ReservationTimeVO> getReservationTime(UserVO userVO)throws Exception{
		return serviceMapper.getReservationTime(userVO);
	}
	
	public ReservationSettingVO getReservationSetting(UserVO userVO)throws Exception{
		return serviceMapper.getReservationSetting(userVO);
	}
	
	public ReservationSettingVO getReservationSettingCheck(UserVO userVO)throws Exception{
		return serviceMapper.getReservationSettingCheck(userVO);
	}
	
	public UserVO sellerInterceptor(UserVO userVO)throws Exception{
		return serviceMapper.sellerInterceptor(userVO);
	}
	
	public int setDelete(ServiceVO serviceVO)throws Exception{
		ServiceFileVO serviceFileVO= serviceMapper.getFileDetail(serviceVO);
		int result = serviceMapper.setDelete(serviceVO);
		
		boolean fileResult= fileManager.remove(serviceFileVO.getFileName(), "resources/upload/service/");
		
		return result;
	}
	
	public ServiceVO getService(ServiceVO serviceVO)throws Exception{
		return serviceMapper.getService(serviceVO);
	}
	
	public ServiceVO getDetail(ServiceVO serviceVO) throws Exception{
		return serviceMapper.getDetail(serviceVO);
	}
	
	public ReservationSettingVO getAllReservationSetting(ServiceVO serviceVO)throws Exception{
		return serviceMapper.getAllReservationSetting(serviceVO);
	}
	
	//reservation 세팅 등록 
	public int setReservationSetting(ReservationSettingVO reservationSettingVO)throws Exception{
		return serviceMapper.setReservationSetting(reservationSettingVO);
	}
	
	//운영시간 등록 
	public int setReservationTime(ReservationTimeVO reservationTimeVO)throws Exception{
		return serviceMapper.setReservationTime(reservationTimeVO);
	}
	
	
	
	//service update 
	public int setUpdate(ServiceVO serviceVO,MultipartFile file)throws Exception{
		int result= serviceMapper.setUpdate(serviceVO);
		System.out.println("file?:"+file.isEmpty());
		System.out.println("file:"+file);
		if(!file.isEmpty()) {
			
			String fileName = fileManager.fileSave(file, "resources/upload/service/");
			ServiceFileVO serviceFileVO = new ServiceFileVO();
			serviceFileVO.setSerNum(serviceVO.getSerNum());
			serviceFileVO.setFileName(fileName);
			serviceFileVO.setOriName(file.getOriginalFilename());
			int fileResult= serviceMapper.setUpdateFile(serviceFileVO);
			System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			System.out.println(fileResult);
		}
		return result;
	}
	
	public int setService(ServiceVO serviceVO, MultipartFile file)throws Exception{
		int result= serviceMapper.setService(serviceVO);
		
		if(!file.isEmpty()) {
			String fileName = fileManager.fileSave(file, "resources/upload/service/");
			
			ServiceFileVO serviceFileVO = new ServiceFileVO();
			serviceFileVO.setSerNum(serviceVO.getSerNum());
			serviceFileVO.setFileName(fileName);
			serviceFileVO.setOriName(file.getOriginalFilename());
			
			result = serviceMapper.setFileAdd(serviceFileVO);
		}
		
		return result;
	}
	
	//<!--판매자측 서비스 예약 리스트 --><!--방문완료체크용-->
	public List<ReservationVO> getOverdue(Pager pager)throws Exception{
		pager.makeRow();
		pager.makeNum(serviceMapper.getTotalCount(pager));
		return serviceMapper.getOverdue(pager);
	}
	
	//<!--판매자측 서비스 예약 리스트 --><!--월별 resState Count-->
	public List<ReservationVO> getResStateCount(ReservationVO reservationVO)throws Exception{
		return serviceMapper.getResStateCount(reservationVO);
	}

	
	//<!--판매자측 서비스 예약 리스트 --><!--월별-->
	public List<ReservationVO> getMonthReservationList(Pager pager)throws Exception{
		pager.makeRow();
		pager.makeNum(serviceMapper.getTotalCount(pager));
		return serviceMapper.getMonthReservationList(pager);
	}
	
	//<!--판매자측 서비스 예약 리스트 --><!--날짜별-->
	public List<ReservationVO> getDayReservationList(Pager pager)throws Exception{
		pager.makeRow();
		pager.makeNum(serviceMapper.getTotalCount(pager));
		return serviceMapper.getDayReservationList(pager);
	}
	
	//<!--판매자측 서비스 예약 리스트 --><!--최신순-->
	public List<ReservationVO> getReservationList(Pager pager)throws Exception{
		pager.makeRow();
		pager.makeNum(serviceMapper.getTotalCount(pager));
		return serviceMapper.getReservationList(pager);
	}
	//<!--판매자측 서비스 예약 리스트 --><!-- 대기중인 예약만 -->
	public List<ReservationVO> getResStateIs0(Pager pager)throws Exception{
		pager.makeRow();
		pager.makeNum(serviceMapper.getTotalCount(pager));
		return serviceMapper.getResStateIs0(pager);
	}
	
	
	public int setUpdateResState(ReservationVO reservationVO)throws Exception{
		return serviceMapper.setUpdateResState(reservationVO);
	}
//----------------------------------------------------------
	


	// 서비스 목록
	public List<ServiceVO> getListc(Pager pager) throws Exception{
		
		pager.makeRow();
		Long totalCount= serviceMapper.total(pager);
		pager.makeNum(totalCount);
		List<ServiceVO> ar=serviceMapper.getListc(pager);
//		ar=serviceMapper.getServiceKind(pager.getServiceVO());
		return ar;
	}
	
	
	// serKind 1 병원 2 미용샵
	public List<ServiceVO> getServiceKind (ServiceVO serviceVO) throws Exception{
		return serviceMapper.getServiceKind(serviceVO);
	}
	
	public ServiceVO getDetailc(ServiceVO serviceVO)throws Exception{
		return serviceMapper.getDetailc(serviceVO);
	}
}
