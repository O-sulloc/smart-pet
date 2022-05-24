package com.pj.pet.board.notice;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pj.pet.board.faq.FaqVO;
import com.pj.pet.products.ProductVO;
import com.pj.pet.review.ReviewVO;
import com.pj.pet.review.product.ProductReviewService;
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
	

	//제목 중복체크
	@PostMapping("titleCheck")
	public ModelAndView titleCheck(NoticeVO noticeVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		System.out.println(noticeVO.getTitle());
		int result = noticeService.getTitleCount(noticeVO);
		
		//공백체크 자바(공백일때 1 리턴)
		if(!StringUtils.hasText(noticeVO.getTitle())) {
			result = 1;
		}
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	
	
	//전체 리스트
	@GetMapping("list")
	public ModelAndView getList(Pager pager, String grade) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		System.out.println(grade);
		
		if(grade != null) {
			pager.setGrade(grade);
		}
		
		//리스트 가지고 오는 코드
		List<NoticeVO> ar = noticeService.getList(pager);
		mv.addObject("list", ar);
		
		//전체, 각 카테고리별 분류 위해서 넣은 코드
		mv.addObject("checkGrade", grade);
		mv.setViewName("notice/list");
		
		return mv;
	}
	
	//세부 페이지
	@GetMapping("detail")
	public ModelAndView getDetail(NoticeVO noticeVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		//System.out.println(noticeVO.getGrade());
		//System.out.println(noticeVO.getNum());
		
		//전체, 각 카테고리별 분류 위해서 넣은 코드(nextNum, nextTitle 등)
		mv.addObject("checkGrade", noticeVO.getGrade());
		
		noticeVO = noticeService.getDetail(noticeVO);
		//System.out.println(noticeVO.getNextNum());
		//System.out.println(noticeVO.getNextTitle());
		
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
