package com.pj.pet.board.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pj.pet.util.Pager;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@ModelAttribute("board")
	public String getBoard() {
		return "notice";
	}
	
	//전체 리스트
	@GetMapping("list")
	public ModelAndView getList(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<NoticeVO> ar = noticeService.getList(pager);
		
		mv.addObject("list", ar);
		mv.setViewName("notice/list");
		
		return mv;
	}
	
	//세부 페이지
	@GetMapping("detail")
	public ModelAndView getDetail(NoticeVO noticeVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		noticeVO = noticeService.getDetail(noticeVO);
		
		mv.addObject("vo", noticeVO);
		mv.setViewName("notice/detail");
		
		return mv;
	}
	
	//add form 이동
	@GetMapping("add")
	public void setAdd() throws Exception{}
	
	//add DB 적용
	@PostMapping("add")
	public ModelAndView setAdd(NoticeVO noticeVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = noticeService.setAdd(noticeVO);
		
		mv.setViewName("redirect:./list");
		
		return mv;
	}
	
	//update form 이동
	@GetMapping("update")
	public ModelAndView setUpdate(NoticeVO noticeVO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		noticeVO = noticeService.getDetail(noticeVO);
		mv.addObject("vo", noticeVO);
		mv.setViewName("notice/update");
		
		return mv;
	}
	
	//update DB 적용
	@PostMapping("update")
	public ModelAndView setUpdate(NoticeVO noticeVO, ModelAndView mv) throws Exception{
		
		int result = noticeService.setUpdate(noticeVO);
		
		mv.setViewName("redirect:./detail?num="+noticeVO.getNum());
		
		return mv;
	}
	
	//delete DB 적용
	@GetMapping("delete")
	public ModelAndView setDelete(NoticeVO noticeVO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		int result = noticeService.setDelete(noticeVO);
		
		mv.setViewName("redirect:./list");
		
		return mv;
	}
	
	
	
	
	
}
