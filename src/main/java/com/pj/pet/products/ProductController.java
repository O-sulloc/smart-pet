package com.pj.pet.products;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import com.pj.pet.category.CategoryVO;
import com.pj.pet.qna.QnaService;
import com.pj.pet.qna.QnaVO;
import com.pj.pet.review.ReviewVO;
import com.pj.pet.review.product.ProductReviewService;
import com.pj.pet.user.UserVO;
import com.pj.pet.util.Pager;

@Controller
@RequestMapping("product/*")
public class ProductController {
	@Autowired
	private ProductService productService;
	
	//summernote
	   @GetMapping("summerFileDelete")
	   public ModelAndView setSummerFileDelete(String fileName)throws Exception{
		   ModelAndView mv =new ModelAndView();
		   System.out.println(fileName);
		   boolean result = productService.setSummerFileDelete(fileName);
		  mv.setViewName("common/result");
		  mv.addObject("result",result);
		  return mv;
		  
	   }
	   
	   @PostMapping("summerFileUpload")
	   public ModelAndView setSummerFileUpload(MultipartFile files)throws Exception{
		   ModelAndView mv =new ModelAndView();
		   String fileName= productService.setSummerFileUpload(files);
		   System.out.println(fileName);
		   mv.setViewName("common/result");
		   mv.addObject("result",fileName);
		   return mv;
	   }
	
	//구매자 리스트
	@GetMapping("list")
	public ModelAndView getList(ProductVO productVO,Pager pager,HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<ProductVO> ar =productService.getList(pager);
		Long count = productService.getpCount();
		mv.addObject("list",ar);
		mv.addObject("count",count);
		mv.addObject("pager",pager); 
		mv.setViewName("product/list");
		return mv;
	}
	//구매자 디테일
	@GetMapping("detail")
	public ModelAndView getDetail(ProductVO productVO,CategoryVO categoryVO, HttpSession session) throws Exception {
	
		ModelAndView mv = new ModelAndView();
		productVO= productService.getDetail(productVO);
		categoryVO.setCategoryNum(productVO.getCategoryNum());
		categoryVO  =productService.getCategoryDetail(categoryVO);
		mv.addObject("vo", productVO);
		mv.addObject("cvo", categoryVO);
		
		//재석추가(로그인한 사람 id 가져오기 Q&A 작성시 필요)
		if(session.getAttribute("user") != null) {//로그인 안하면 안넣기 오류처리
			UserVO userVO = (UserVO)session.getAttribute("user");
			mv.addObject("id", userVO.getId());
		}
		//재석추가 끝
		mv.setViewName("product/detail");
		return mv;
	}
	@GetMapping("add")
	 public ModelAndView setAdd(ProductVO productVO,ModelAndView mv)throws Exception{
		mv.setViewName("product/add");
	    return mv;
	}
	@PostMapping("add")
	public ModelAndView setAdd(ProductVO productVO,MultipartFile[] files,HttpSession session)throws Exception{
		ModelAndView mv =new ModelAndView();
//		if(bindingResult.hasErrors()) {
//			mv.setViewName("product/add");
//			return mv;
//		}
		UserVO userVO = (UserVO)session.getAttribute("user");
		productVO.setId(userVO.getId());
		int result=productService.setAdd(productVO,files);
		mv.setViewName("redirect:./list");
		return mv;
	}

	@GetMapping("update")
	public ModelAndView setUpdate(ProductVO productVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		productVO = productService.getDetail(productVO);
		mv.addObject("vo", productVO);
		mv.setViewName("product/update");

		return mv;
	}

	@PostMapping("update")
	public ModelAndView setUpdate(ProductVO productVO,MultipartFile[] files) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = productService.setUpdate(productVO,files);
		mv.setViewName("redirect:./list");	
		return mv;
	}

	@GetMapping("delete")
	public ModelAndView setDelete(ProductVO productVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = productService.setDelete(productVO);
		mv.setViewName("redirect:./list");
		return mv;
	}
	
	@PostMapping("fileDelete")
	public ModelAndView setFileDelete(ProductFileVO productFileVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = productService.setFileDelete(productFileVO);
		mv.addObject("result",result);	
		mv.setViewName("common/result");
		return mv;
	}
	

	//재석추가
	//리뷰
	@Autowired
	private ProductReviewService productReviewService;

	//list 리뷰 갖고와서 보여주기
	@GetMapping("reviewList")
	public ModelAndView getReviewList(Pager pager, Double starAvg) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<ReviewVO> ar = productReviewService.getList(pager);
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.addObject("starAvg", starAvg);//detail에서 값 받아옴
		Map<String, Integer> starCount = productReviewService.getStarCount(pager);//별 각각 비율
		mv.addObject("starCount", starCount);
		Long total = productReviewService.getStarTotal(pager); //별 총갯수
		mv.addObject("total", total);
		mv.setViewName("review/reviewList");
		return mv;
	}
	
	//list 리뷰 분류별로 보여주기
	@GetMapping("reviewSort")
	public ModelAndView getReviewListSort(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		//이미 값을 보낼때 pager에 productNum 보냄
		List<ReviewVO> ar = productReviewService.getList(pager);
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("review/reviewSort");
		return mv;
	}
	
	
	//QNA
	@Autowired
	private QnaService qnaService;
	
	//list 리뷰 갖고와서 보여주기
	@GetMapping("qnaList")
	public ModelAndView getQnaList(Pager pager, HttpSession session) throws Exception{
		System.out.println("진입함!!");
		ModelAndView mv = new ModelAndView();
		List<QnaVO> ar = qnaService.getList(pager);
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		if(session.getAttribute("user") != null) {//로그인 안하면 안넣기 오류처리
			UserVO userVO = (UserVO)session.getAttribute("user");
			mv.addObject("id", userVO.getId());
		}
		mv.setViewName("qna/qnaList");
		return mv;
	}
	
	//list 안에 내용만 재호출
	@GetMapping("qnaSort")
	public ModelAndView getQnaListSort(Pager pager, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		//이미 값을 보낼때 pager에 productNum 보냄
		List<QnaVO> ar = qnaService.getList(pager);
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		if(session.getAttribute("user") != null) {//여긴 아직 불필요 넣어줄지 고민
			UserVO userVO = (UserVO)session.getAttribute("user");
			mv.addObject("id", userVO.getId());
		}
		mv.setViewName("qna/qnaSort");
		return mv;
	}
	
	
	//qna 쓰기(pop 창 이동)
	@GetMapping("qnaAdd/{id}")
	public ModelAndView reviewAdd(@PathVariable("id")String id, Long productNum) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("productNum", productNum);
		mv.addObject("id", id);
		mv.setViewName("qna/qnaPop");
		return mv;
	}
	
	//qna 수정(pop 창 이동)
	@GetMapping("qnaUpdate")
	public ModelAndView reviewUpdate(QnaVO qnaVO, ModelAndView mv) throws Exception {
		
		qnaVO = qnaService.getDetail(qnaVO);
		mv.addObject("vo", qnaVO);
		mv.setViewName("qna/qnaPopUpdate");
		return mv;
		
	}
	
	
	//판매자(pop 창 이동)
	@GetMapping("qnaSellerAdd/{id}")
	public ModelAndView reviewSellerAdd(@PathVariable("id")String id, Long productNum, Long num) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("productNum", productNum);
		mv.addObject("id", id);
		mv.addObject("num", num);
		mv.setViewName("qna/sellerQnaPop");
		return mv;
	}
	
	//판매자 수정(pop 창 이동)
	@GetMapping("qnaSellerUpdate")
	public ModelAndView reviewSellerUpdate(QnaVO qnaVO, ModelAndView mv) throws Exception {
		qnaVO = qnaService.getDetail(qnaVO);
		mv.addObject("vo", qnaVO);
		mv.setViewName("qna/sellerQnaPopUpdate");
		return mv;
		
	}
	
	//판매자(pop 수정 창 이동 reply form)
	

	
	
	
	//재석추가 끝
	
	
	
	
	
	
	
	
	
}
