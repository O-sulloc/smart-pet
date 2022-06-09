package com.pj.pet.products;

import java.util.List;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.pj.pet.category.CategoryVO;
import com.pj.pet.user.UserVO;
import com.pj.pet.util.Pager;

@Controller
@RequestMapping("product/*")
public class ProductController {
	@Autowired
	private ProductService productService;

	// summernote
	@GetMapping("summerFileDelete")
	public ModelAndView setSummerFileDelete(String fileName) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println(fileName);
		boolean result = productService.setSummerFileDelete(fileName);
		mv.setViewName("common/result");
		mv.addObject("result", result);
		return mv;

	}

	@PostMapping("summerFileUpload")
	public ModelAndView setSummerFileUpload(MultipartFile files) throws Exception {
		ModelAndView mv = new ModelAndView();
		String fileName = productService.setSummerFileUpload(files);
		System.out.println(fileName);
		mv.setViewName("common/result");
		mv.addObject("result", fileName);
		return mv;
	}

	// 구매자 리스트
	@GetMapping("list")
	public ModelAndView getList(ProductVO productVO, Pager pager, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<ProductVO> best = productService.bestList();
		List<ProductVO> ar = productService.getList(pager);
		Long count = productService.getpCount(pager);
		mv.addObject("list", ar);
		mv.addObject("best", best);
		mv.addObject("count", count);
		mv.addObject("pager", pager);
		mv.setViewName("product/list");
		return mv;
	}

	// 구매자 디테일
	@GetMapping("detail")
	public ModelAndView getDetail(ProductVO productVO, CategoryVO categoryVO, HttpSession session) throws Exception {

		ModelAndView mv = new ModelAndView();
		productVO = productService.getDetail(productVO);
		categoryVO.setCategoryNum(productVO.getCategoryNum());
		categoryVO = productService.getCategoryDetail(categoryVO);
		mv.addObject("vo", productVO);
		mv.addObject("cvo", categoryVO);
		mv.setViewName("product/detail");
		return mv;
	}

	@GetMapping("add")
	public ModelAndView setAdd(@ModelAttribute ProductVO productVO, ModelAndView mv) throws Exception {
		mv.setViewName("product/add");
		return mv;
	}

	@PostMapping("add")
	public ModelAndView setAdd(@Valid ProductVO productVO, BindingResult bindingResult, MultipartFile[] files,
			HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		if (bindingResult.hasErrors()) {
			mv.setViewName("product/add");
			return mv;
		}
		UserVO userVO = (UserVO) session.getAttribute("user");
		productVO.setId(userVO.getId());
		int result = productService.setAdd(productVO, files);
		mv.setViewName("redirect:./list");
		return mv;
	}

	@GetMapping("update")
	public ModelAndView setUpdate(@ModelAttribute ProductVO productVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		productVO = productService.getDetail(productVO);
		mv.addObject("vo", productVO);
		mv.setViewName("product/update");

		return mv;
	}

	@PostMapping("update")
	public ModelAndView setUpdate(@Valid ProductVO productVO,BindingResult bindingResult, MultipartFile[] files) throws Exception {
		ModelAndView mv = new ModelAndView();
		if (bindingResult.hasErrors()) {
			mv.setViewName("product/update");
			return mv;
		}
		int result = productService.setUpdate(productVO, files);
		mv.setViewName("redirect:../user/sellerList");
		return mv;
	}

	@GetMapping("delete")
	public ModelAndView setDelete(ProductVO productVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = productService.setDelete(productVO);
		mv.setViewName("redirect:../user/sellerList");
		return mv;
	}

	@PostMapping("fileDelete")
	public ModelAndView setFileDelete(ProductFileVO productFileVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = productService.setFileDelete(productFileVO);
		mv.addObject("result", result);
		mv.setViewName("common/result");
		return mv;
	}

}
