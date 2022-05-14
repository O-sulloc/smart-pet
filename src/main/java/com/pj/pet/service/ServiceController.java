package com.pj.pet.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pj.pet.util.CalendarTest;

@Controller
@RequestMapping("service/*")
public class ServiceController {

	@Autowired
	private ServiceService serviceService;
	
	//서비스 등록 폼 
	@GetMapping("registration")
	public ModelAndView setService()throws Exception{
		ModelAndView mv= new ModelAndView();
		
		mv.setViewName("service/registration");
		return mv;
	}
	
	//서비스 등록 폼 전송  
	@PostMapping("registration")
	public ModelAndView setService(ServiceVO serviceVO)throws Exception{
		ModelAndView mv= new ModelAndView();
		int result=serviceService.setService(serviceVO);
		
		mv.setViewName("service/mypage");
		return mv;
	}
	
	//수정 필요 
	@GetMapping("mypage")
	public ModelAndView getDetail(HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		//ServiceVO serviceVO=(ServiceVO)session.getAttribute("user");
		//serviceVO= serviceService.getDetail(serviceVO);
		
		//임시 
		ServiceVO serviceVO= new ServiceVO();
		serviceVO.setId("id1");
		serviceVO= serviceService.getDetail(serviceVO);
		mv.addObject("vo",serviceVO);
		mv.setViewName("service/mypage");
		return mv;
		
		
		
	}
	
	@GetMapping("update")
	public ModelAndView setUpate(HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		//ServiceVO serviceVO=(ServiceVO)session.getAttribute("user");
		//serviceVO= serviceService.getDetail(serviceVO);
		
		//임시 
		ServiceVO serviceVO= new ServiceVO();
		serviceVO.setId("id1");
		serviceVO= serviceService.getDetail(serviceVO);
		
		mv.addObject("vo",serviceVO);
		mv.setViewName("service/update");
		return mv;
	}
	
	@PostMapping("update")
	public ModelAndView setUpdate(ServiceVO serviceVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result=serviceService.setUpdate(serviceVO);
		mv.setViewName("redirect:./mypage");
		return mv;
	}
	
}
