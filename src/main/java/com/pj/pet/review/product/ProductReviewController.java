package com.pj.pet.review.product;

import org.springframework.beans.factory.annotation.Autowired;
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
	public int setAdd(ReviewVO reviewVO, MultipartFile [] files) throws Exception{
		
		int result = productReviewService.setAdd(reviewVO, files);
		//상품에 별점평균 변경해주는것
		productReviewService.setRating(reviewVO.getProductNum());
		
		return result;
	}
	
	//update DB
	@PostMapping("update")//파일도 있으면 넣어야함
	public int setUpdate(ReviewVO reviewVO, MultipartFile [] files) throws Exception{
		
		int result = productReviewService.setUpdate(reviewVO, files);
		//상품에 별점평균 변경해주는것
		productReviewService.setRating(reviewVO.getProductNum());
		
		return result;
	}
	
	//Delete DB
	@GetMapping("delete")//파일도 있으면 넣어야함
	public int setDelete(ReviewVO reviewVO) throws Exception{
		System.out.println("들어옴");
		int result = productReviewService.setDelete(reviewVO);
		//상품에 별점평균 변경해주는것
		productReviewService.setRating(reviewVO.getProductNum());
		
		return result;
	}
	
	//fileDelete(ajax)
	@PostMapping("fileDelete")
	public ModelAndView setFileDelete(ProductReviewFilesVO productReviewFilesVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		//System.out.println(productFilesVO.getFileNum());
		
		int result = productReviewService.setFileDelete(productReviewFilesVO);
		
		mv.addObject("result", result);
		mv.setViewName("common/result");
		
		return mv;
	}
	
	
	
	
	
	
	
	
}










