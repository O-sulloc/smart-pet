package com.pj.pet.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.pj.pet.interceptor.SellerInterceptor;
import com.pj.pet.interceptor.ServiceSellerInterceptor;
import com.pj.pet.interceptor.reservationSettingInterceptor;
import com.pj.pet.interceptor.ServiceUserInterceptor;
import com.pj.pet.interceptor.registrationInterceptor;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer{
	
	@Autowired
	private ServiceSellerInterceptor serviceSellerInterceptor;
	@Autowired
	private registrationInterceptor registrationInterceptor;
	@Autowired
	private reservationSettingInterceptor reservationSettingInterceptor;
	@Autowired
	private SellerInterceptor sellerInterceptor;
	@Autowired
	private ServiceUserInterceptor serviceUserInterceptor;
	
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(serviceSellerInterceptor)
				.addPathPatterns("/service/mypage")			 		//서비스 정보보기,수정,삭제 
				.addPathPatterns("/service/reservationList") 		//예약리스트 최신순으로 보기 
				.addPathPatterns("/service/resState0Page")			//대기중인 예약 보기 
				.addPathPatterns("/service/getDayReservationList")	//일별 예약 현황 보기 
				.addPathPatterns("/service/monthListPage")			//달별 예약 현황 보기
				.addPathPatterns("/service/reservationSetting")		//예약가능한 시간 세팅하기 
				.addPathPatterns("/service/completionCheck")		//예약승인 후 예약시간 지났으면 방문여부 체크하는 페이지 
				.addPathPatterns("/service/registration")			//서비스 등록하기 
				.addPathPatterns("/service/updateReservationSetting"); //서비스 예약정보 등록 업데이트
			
		registry.addInterceptor(reservationSettingInterceptor)
				.addPathPatterns("/service/reservationSetting");
			
		registry.addInterceptor(registrationInterceptor)
				.addPathPatterns("/service/registration");
			
		
		registry.addInterceptor(serviceUserInterceptor)
				.addPathPatterns("/reservation/confirm")		//예약 확인
				.addPathPatterns("/user/appointment")			//유저 예약 목록
				.addPathPatterns("/user/appointmentUpdate");	//유저 예약 업데이트
		
		registry.addInterceptor(sellerInterceptor)
				.addPathPatterns("/seller/sellerDetail")		//판매자 상품목록 디테일
				.addPathPatterns("/seller/sellerList")			//판매자 상품목록
				.addPathPatterns("/seller/sellerOrder")			//판매자 판매목록 리스트
				.addPathPatterns("/product/add")				//판매자 상품 등록
				.addPathPatterns("/product/update")				//판매자 상품 수정
				.addPathPatterns("/product/delete");			//판매자 상품 삭제
	}
	


}
