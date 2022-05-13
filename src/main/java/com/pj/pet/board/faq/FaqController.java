package com.pj.pet.board.faq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.pj.pet.util.Pager;

@Controller
@RequestMapping("/faq/*")
public class FaqController {

	@Autowired
	private FaqService faqService;
	
	@ModelAttribute("board")
	public String getBoard() {
		return "faq";
	}
	
	//전체 리스트
	@GetMapping("list")
	public ModelAndView getList(Pager pager, String grade, String gradeRef) throws Exception{
		ModelAndView mv = new ModelAndView();

		if(gradeRef != null) {
			pager.setGradeRef(gradeRef);
		}
		
		if(grade != null) {
			pager.setGrade(grade);
		}
		
		List<FaqVO> ar = faqService.getList(pager);
		
		List<FaqCateVO> ar1 = faqService.getCateList(gradeRef);
		
		mv.addObject("list", ar);
		mv.addObject("cate", ar1);
		//그냥 보내버림
		System.out.println(gradeRef);
		
		if(gradeRef != null) {
			mv.addObject("total", gradeRef);
		}
		mv.setViewName("faq/list");
		
		return mv;
	}
	
	//세부 페이지
	@GetMapping("detail")
	public ModelAndView getDetail(FaqVO faqVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		faqVO = faqService.getDetail(faqVO);
		
		
		mv.addObject("vo", faqVO);
		mv.setViewName("faq/detail");
		
		return mv;
	}
	
	//add form 이동
	@GetMapping("add")
	public ModelAndView setAdd(String gradeRef) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		List<FaqCateVO> list = faqService.getCateList(gradeRef);
		
		System.out.println(list);
		
		ObjectMapper objm = new ObjectMapper();
		String cateList = objm.writeValueAsString(list);
		
		System.out.println(cateList);
		mv.addObject("cateList", cateList);
		mv.setViewName("faq/add");
		return mv;
		
	}
	
	//add DB 적용
	@PostMapping("add")
	public ModelAndView setAdd(FaqVO faqVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = faqService.setAdd(faqVO);
		mv.setViewName("redirect:./list");
		return mv;
	}
	
	//update form 이동
	@GetMapping("update")
	public ModelAndView setUpdate(FaqVO faqVO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		faqVO = faqService.getDetail(faqVO);
		mv.addObject("vo", faqVO);
		mv.setViewName("faq/update");
		
		return mv;
	}
	
	//update DB 적용
	@PostMapping("update")
	public ModelAndView setUpdate(FaqVO faqVO, ModelAndView mv) throws Exception{
		
		int result = faqService.setUpdate(faqVO);
		
		mv.setViewName("redirect:./detail?num="+faqVO.getNum());
		
		return mv;
	}
	
	//delete DB 적용
	@GetMapping("delete")
	public ModelAndView setDelete(FaqVO faqVO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		int result = faqService.setDelete(faqVO);
		
		mv.setViewName("redirect:./list");
		
		return mv;
	}
	
	
	
	
	
}
