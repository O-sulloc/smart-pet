package com.pj.pet.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.pj.pet.interceptor.ServiceSellerInterceptor;
import com.pj.pet.interceptor.ServiceUserInterceptor;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer{
	
	@Autowired
	private ServiceSellerInterceptor serviceSellerInterceptor;
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
				.addPathPatterns("/service/registration");			//서비스 등록하기 
				
		
		
		registry.addInterceptor(serviceUserInterceptor)
				.addPathPatterns("/reservation/confirm")		//예약 확인
				.addPathPatterns("/user/appointment")			//유저 예약 목록
				.addPathPatterns("/user/appointmentUpdate");	//유저 예약 업데이트
	}

}
