package com.pj.pet.products;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import com.pj.pet.category.CategoryVO;
import com.pj.pet.util.Pager;

@Controller
@RequestMapping("product/*")
public class ProductController {

	@Autowired
	private ProductService productService;

	@GetMapping("list")
	public ModelAndView getList(ProductVO productVO,Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<ProductVO> ar =productService.getList(pager);
		Long count = productService.getpCount();
		mv.addObject("list",ar);
		mv.addObject("count",count);
		mv.addObject("pager",pager); 
		mv.setViewName("product/list");
		return mv;
	}
	
	@GetMapping("sellerDetail")
	public ModelAndView getManageDetail(ProductVO productVO,CategoryVO categoryVO)throws Exception{
		// 판매자가 디테일
		ModelAndView mv = new ModelAndView();
		productVO= productService.getDetail(productVO);
		categoryVO.setCategoryNum(productVO.getCategoryNum());
		categoryVO  =productService.getCategoryDetail(categoryVO);
		mv.addObject("vo", productVO);
		mv.addObject("cvo", categoryVO);
		mv.setViewName("product/sellerDetail");
		return mv;
	}
	
	@GetMapping("detail")
	public ModelAndView getDetail(ProductVO productVO,CategoryVO categoryVO) throws Exception {
		// 구매자 디테일
		ModelAndView mv = new ModelAndView();
		productVO= productService.getDetail(productVO);
		categoryVO.setCategoryNum(productVO.getCategoryNum());
		categoryVO  =productService.getCategoryDetail(categoryVO);
		mv.addObject("vo", productVO);
		mv.addObject("cvo", categoryVO);
		mv.setViewName("product/detail");
		return mv;
	}
	@GetMapping("add")
	 public ModelAndView setAdd(ProductVO productVO,ModelAndView mv)throws Exception{
//		ModelAndView mv =new ModelAndView();
		mv.setViewName("product/add");
	    return mv;
	}
	@PostMapping("add")
	public ModelAndView setAdd(ProductVO productVO,MultipartFile[] files)throws Exception{
		ModelAndView mv =new ModelAndView();
//		if(bindingResult.hasErrors()) {
//			mv.setViewName("product/add");
//			return mv;
//		}
//		MemberVO memberVO = (MemberVO)session.getAttribute("member");
//		productVO.setWriter(memberVO.getId());
		int result=productService.setAdd(productVO,files);
//		mv.setViewName("common/result");
//		mv.addObject("result",result);
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
	
	@GetMapping("highpricelist")
	public ModelAndView highPriceList(ProductVO productVO,Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<ProductVO> ar =productService.highPriceList(pager);
		Long count = productService.getpCount();
		mv.addObject("count",count);
		mv.addObject("list",ar);
		mv.addObject("pager",pager); 
		mv.setViewName("product/list");
		return mv;
	}
	
	@GetMapping("lowpricelist")
	public ModelAndView lowPriceList(ProductVO productVO,Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<ProductVO> ar =productService.lowPriceList(pager);
		Long count = productService.getpCount();
		mv.addObject("count",count);
		mv.addObject("list",ar);
		mv.addObject("pager",pager); 
		mv.setViewName("product/list");
		return mv;
	}
	
	@GetMapping("regdatelist")
	public ModelAndView regDateList(ProductVO productVO,Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<ProductVO> ar =productService.regDateList(pager);
		Long count = productService.getpCount();
		mv.addObject("count",count);
		mv.addObject("list",ar);
		mv.addObject("pager",pager); 
		mv.setViewName("product/list");
		return mv;
	}
}
