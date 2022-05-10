package com.pj.pet.board.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@ModelAttribute("board")
	public String getBoard() {
		return "notice";
	}
	
	@GetMapping("list")
	public ModelAndView getList() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<NoticeVO> ar = noticeService.getList();
		
		mv.addObject("vo", ar);
		mv.setViewName("notice/list");
		
		return mv;
	}
	
	
	
	
	
	
	
	
}
