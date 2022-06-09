package com.pj.pet.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.pj.pet.user.UserVO;

@Component
public class SellerInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		boolean check = false;
		// 로그인 한 사용자의 ROLE이 Seller  ROLE=1이라면 통과 아니면 거절
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("user");
		if (userVO != null) {
			
			if (userVO.getRole() == 1) {
				check = true;
			}

		}
		// check가 true면 통과
		// check가 false면 거절 : servlet코드사용
		if (!check) { // check가 false라면 라는 의미
			// redirect:response.sendRedirect("url주소")
			// forward

			// mv.addObject("키",value)
			request.setAttribute("msg", "판매자 권한이 없습니다.");
			request.setAttribute("path", "../");

			// mv.setViewName();
			// WEB-INF/views 경로와 .jsp 까지 직접작성
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/getResult.jsp");
			view.forward(request, response); // 실제 보내는것 // -> check가 false 면 얘네들을 하자

		}
		return check;

	}
}
