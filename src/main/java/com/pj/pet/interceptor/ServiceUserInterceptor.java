package com.pj.pet.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.pj.pet.reservation.ReservationService;
import com.pj.pet.user.UserVO;

@Component
public class ServiceUserInterceptor implements HandlerInterceptor {
//user Role 2 일반 회원
	
	@Autowired
	private ReservationService reservationService;
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		System.out.println("Reservation Service Interceptor");
		
		//로그인 한 사용자의 role이 2 (일반 회원)이라면 통과 그렇지 않다면 거절
		HttpSession session = request.getSession();
		UserVO userVO =(UserVO)request.getSession().getAttribute("user");
		userVO=reservationService.serviceUserInterceptor(userVO);
		
		boolean check =false;
		if(userVO!=null) {
			System.out.println("로그인 한 상태 회원");
			if(userVO.getRole()==2) {
				check=true;
			}else {
				System.out.println("일반회원이 아닌 다른 role로 로그인 할 때");
				request.setAttribute("msg", "일반회원으로 로그인 해주세요.");
				request.setAttribute("path", "../");
				
				RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/getResult.jsp");
				view.forward(request, response);
			}
			return check;
		}
		
		// check-> true 면 통과
		// check-> false면 거절 : Servlet 코드 사용
		if(!check) {
			System.out.println("서비스 유저 Interceptor 실행");
			request.setAttribute("msg", "먼저 로그인을 해주세요.");
			request.setAttribute("path", "../");
			// controller를 거치지 않기 때문에 경로 전체 다 써줌
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/getResult.jsp");
			view.forward(request, response);
		}
		
		return check;
	}
}
