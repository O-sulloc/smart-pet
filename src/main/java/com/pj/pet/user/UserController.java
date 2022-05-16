package com.pj.pet.user;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pj.pet.util.MailService;
import com.pj.pet.util.MailUtils;
import com.pj.pet.util.TempKey;

@Controller
@RequestMapping("/user/*")
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private MailService mailService;
	
	@ModelAttribute("board")
	public String getBoard() {
		return "user";
	}
	
	@PostMapping("loginCheck")
	public String loginCheck(UserVO userVO) throws Exception {
		userVO= userService.getLogin(userVO);

		String path = "redirect:./loginCheck"; // login failed

		if (userVO != null) {
			path = "redirect:./myPage"; // login success
		}

		return path;
	}

	@GetMapping("loginCheck")
	public ModelAndView loginCheck(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		UserVO userVO = (UserVO) session.getAttribute("user");
		
		mv.addObject("vo",userVO);
		mv.setViewName("user/loginCheck");
		return mv;
	}
	
	@GetMapping("petDelete")
	public String setPetDelete(UserPetVO userPetVO) throws Exception{
		userService.setPetDelete(userPetVO);
		return "redirect:./petList";
	}
	
	@PostMapping("petUpdate")
	public String setPetUpdate(UserPetVO userPetVO) throws Exception{
		userService.setPetUpdate(userPetVO);
		return "redirect:./petList";
	}
	
	@GetMapping("petUpdate")
	public Model setPetUpdate(UserPetVO userPetVO, Model model, HttpSession session) throws Exception{
		UserVO vo=(UserVO) session.getAttribute("user");
		userPetVO.setId(vo.getId());
		userPetVO=userService.getPetDetail(userPetVO);
		model.addAttribute("pet", userPetVO);
		System.out.println(userPetVO.getPetName());
		return model;
	}
	
	@GetMapping("petList")
	public ModelAndView getPetList(UserPetVO userPetVO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		UserVO vo=(UserVO) session.getAttribute("user");
		userPetVO.setId(vo.getId());
		List<UserPetVO> ar = userService.getPetList(userPetVO);
		mv.addObject("list",ar);
		mv.setViewName("user/petList");
		
		return mv;
	}
	
	@PostMapping("petAdd")
	public ModelAndView setPetAdd(UserPetVO userPetVO, ModelAndView mv,HttpSession session) throws Exception{
		UserVO vo=(UserVO) session.getAttribute("user");
		userPetVO.setId(vo.getId());
		userService.setPetAdd(userPetVO);
		mv.setViewName("redirect:./petList");
		
		return mv;
	}
	
	@GetMapping("petAdd")
	public void setPetAdd(UserPetVO userPetVO) throws Exception{
		
	}
	
	@GetMapping("delete")
	public ModelAndView setDelete(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		UserVO userVO=(UserVO) session.getAttribute("user");
		userService.setDelete(userVO);
		
		mv.setViewName("redirect:/");
		return mv;
	}

	@PostMapping("pwUpdate")
	public ModelAndView setPwUpdate(HttpSession session,UserVO userVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		UserVO vo = (UserVO) session.getAttribute("user");
		userVO.setId(vo.getId());
		userService.setPwUpdate(userVO);
		mv.setViewName("redirect:./myPage");
		return mv;
	}
	
	@GetMapping("pwUpdate")
	public void setPwUpdate() throws Exception{}
	
	@PostMapping("update")
	public ModelAndView setUpdate(UserVO userVO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		UserVO vo = (UserVO) session.getAttribute("user");
		userVO.setId(vo.getId());
		userService.setUpdate(userVO);
		mv.setViewName("redirect:./myPage");
		return mv;
	}
	
	@GetMapping("update")
	public ModelAndView setUpdate(HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		UserVO userVO = (UserVO) session.getAttribute("user");
		userVO=userService.getDetail(userVO);
		
		mv.addObject("vo",userVO);
		mv.setViewName("user/update");
		return mv;
	}
	
	@GetMapping("myPage")
	public ModelAndView getDetail(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		UserVO userVO = (UserVO) session.getAttribute("user");
		userVO=userService.getDetail(userVO);
		
		mv.addObject("vo",userVO);
		mv.setViewName("user/myPage");
		return mv;
	}

	@PostMapping("findPw")
	public ModelAndView getFindPw(UserVO userVO, ModelAndView mv) throws Exception{
		
		int result=userService.getFindPw(userVO);
		
		if(result == 0) {
			mv.addObject("msg", "일치하는 정보가 없습니다. 아이디와 이메일을 확인해주세요");
			mv.addObject("path", "./findPw");
			mv.setViewName("common/pwResult");
		}else if(result==1) {
			String newPw = new TempKey().getKey(6, false);
			// 임시비밀번호 발급
			
			userVO.setPw(newPw);
			// db에서도 비번 수정
			
			userService.setResetPw(userVO);
			mailService.sendMail(userVO.getEmail(), "임시비밀번호: "+newPw);
			
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
	
	@GetMapping("logout")
	public String logout(HttpSession session) throws Exception{
		session.invalidate();
		return "redirect:/";
	}
	
	@PostMapping("login")
	public String getLogin(UserVO userVO,HttpSession session, HttpServletResponse response, String remember) throws Exception{
		if(remember != null && remember.equals("1")) {
			Cookie cookie = new Cookie("remember", userVO.getId());
			cookie.setMaxAge(-1);
			response.addCookie(cookie);
		}else {
			Cookie cookie = new Cookie("remember", "");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		
		String path = "redirect:./login";
		
		userVO=userService.getLogin(userVO);
		
		if(userVO != null) {
			session.setAttribute("user", userVO);
			path = "redirect:../";
		}
		
		return path;
	}
	
	@GetMapping("login")
	public void getLogin(@ModelAttribute UserVO userVO, Model model, 
			@CookieValue(value = "remember", defaultValue = "", required = false) String rememberId) throws Exception{
		model.addAttribute("remeberId",rememberId);
	}
	
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
