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
public class ServiceSellerInterceptor implements HandlerInterceptor{

	@Autowired
	ServiceService serviceService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		boolean check = false;
		
			//로그인 한 사용자의 role이 3이라면 
			HttpSession session= request.getSession();
			UserVO userVO=(UserVO)session.getAttribute("user");
			userVO=serviceService.sellerInterceptor(userVO);
			
			if(userVO !=null) {
				System.out.println("회원");
				if(userVO.getRole()==3) {
					check=true;
				}
			}
			
			if(!check) { //check가 false면 포워드로 보내
			//mv.addObject
			request.setAttribute("msg", "권한이 없습니다.");
			request.setAttribute("path", "../user/login");
			
			//mv.setViewName();와 같다 
			//컨트롤러 거치지 않기 때문에 경로 전체 다 써줘야됨 
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/getResult.jsp");
			view.forward(request, response);
			}
		
		return check;
	}
	
	
}
