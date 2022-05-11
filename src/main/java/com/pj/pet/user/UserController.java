package com.pj.pet.user;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/*")
public class UserController {

	@Autowired
	private UserService userService;
	
	@ModelAttribute("board")
	public String getBoard() {
		return "user";
	}

	@PostMapping("findPw")
	public ModelAndView getFindPw(UserVO userVO, ModelAndView mv) throws Exception{
		
		int result=userService.getFindPw(userVO);
		
		if(result == 0) {
			mv.addObject("msg", "아이디와 이메일을 확인해주세요");
			mv.setViewName("/user/findPw");
		}else if(result==1) {
			userService.setResetPw(userVO);
			mv.setViewName("/user/findPwResult");
		}
		
		return mv;
	}
	
	@GetMapping("findPw")
	public void getFindPw(@ModelAttribute UserVO userVO) throws Exception{
	}
	
	@PostMapping("findId")
	public ModelAndView getFindId(UserVO userVO, ModelAndView mv) throws Exception{
		userVO=userService.getFindId(userVO);
		mv.addObject("idResult", userVO);
		mv.setViewName("user/findIdResult");
		return mv;
	}
	
	@GetMapping("findId")
	public void getFindId(@ModelAttribute UserVO userVO) throws Exception{
	}
	
	@PostMapping("login")
	public String getLogin(UserVO userVO, HttpSession session, HttpServletResponse response) throws Exception{
		String path = "redirect:./login";
		
		userVO=userService.getLogin(userVO);
		
		if(userVO != null) {
			session.setAttribute("user", userVO);
			path = "redirect:../";
		}
		
		return path;
	}
	
	@GetMapping("login")
	public void getLogin(@ModelAttribute UserVO userVO) throws Exception{}
	
	@PostMapping("join")
	public ModelAndView setAdd(@Valid UserVO userVO,BindingResult bindingResult) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		if(userService.userError(userVO, bindingResult)) {
			mv.setViewName("user/join");
			return mv;
		}
		
		userService.setAdd(userVO);
		mv.setViewName("redirect:../");
		
		return mv;
	}
	
	@GetMapping("join")
	public void setAdd(@ModelAttribute UserVO userVO) throws Exception{
		
	}
}
