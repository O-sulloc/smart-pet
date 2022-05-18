package com.pj.pet.review.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pj.pet.review.ReviewVO;

//@Controller//restcontroller를 쓸수있을지 일단 고민해보자
@RestController
@RequestMapping("/product/review/*")//마이페이지로?
public class ProductReviewController {

	@Autowired
	private ProductReviewService productReviewService;
	
	
//	@GetMapping("list")
//	public ModelAndView getList() throws Exception{
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("review/reviewPop");
//		return mv;
//	}
//	
	//add DB
	@PostMapping("add")
	public void setAdd(ReviewVO reviewVO, MultipartFile [] files) throws Exception{
		System.out.println("진입");
		System.out.println(reviewVO);
		productReviewService.setAdd(reviewVO, files);
	}
}
