package com.pj.pet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pj.pet.util.Pager;

@Controller
@RequestMapping("/service/*")
public class ServiceController {
	
	@Autowired
	private ServiceService serviceService;

	@ModelAttribute("service")
	public String getService() {
		return "service";
	}
	@GetMapping("list")
	public ModelAndView getList(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<ServiceVO> ar = serviceService.getList(pager);
		mv.addObject("list",ar);
		mv.setViewName("service/list");
		
		return mv;
	
	}
	@GetMapping("detail")
	public ModelAndView getDetail(ServiceVO serviceVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		serviceVO=serviceService.getDetail(serviceVO);
		mv.addObject("detail",serviceVO);
		mv.setViewName("service/detail");
		return mv;
	}
}
