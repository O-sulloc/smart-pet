package com.pj.pet.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.pj.pet.service.ServiceService;
import com.pj.pet.service.ServiceVO;
import com.pj.pet.user.UserVO;

@Component
public class registrationInterceptor implements HandlerInterceptor{
	
	@Autowired
	ServiceService serviceService;
	
	//로그인 되어있고 판매자이고 서비스 등록을 안한 경우 통과  
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		boolean check = false;
		ServiceVO serviceVO= new ServiceVO();
		HttpSession session= request.getSession();
		UserVO userVO=(UserVO)session.getAttribute("user");
		
		try {
			serviceVO=serviceService.registrationInterceptor(userVO);
		} catch (Exception e) {
			
		}
		if(serviceVO==null) {
			check=true;
		}
		
		if(!check) {
			//mv.addObject
			request.setAttribute("msg", "이미 등록되어 있습니다. 마이페이지로 이동합니다.");
			request.setAttribute("path", "./mypage"); 
			
			//mv.setViewName();와 같다 
			//컨트롤러 거치지 않기 때문에 경로 전체 다 써줘야됨 
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/getResult.jsp");
			view.forward(request, response);
			
		}
		
	
		
		return check;
		}
}
