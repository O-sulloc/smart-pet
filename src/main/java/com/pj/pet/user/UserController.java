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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pj.pet.review.ReviewVO;
import com.pj.pet.review.product.ProductReviewService;
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
	
	
	//재석추가
	//리뷰 리스트 페이지 이동(나중 수정)
	@Autowired
	private ProductReviewService productReviewService;

	@GetMapping("reviewListPage")
	public ModelAndView reviewListPage(HttpSession session) throws Exception{
		//일단 정리
		//orderList 부분이고 orderList에는 상품이 구매완료 할 경우
		//상품내용들이 담김
		//orderList 페이지에서는 orderList 번호가 생성되어 그 번호에 해당하는 상품들이 나열됨
		//리뷰를 작성할시 필요한것은 id, productNum임
		//orderList 페이지를 처음 뿌려줄때는 각 번호에 해당하는 상품들 나열 + 리뷰작성을 두게되고
		//리뷰가 작성될시 페이지 새로고침을 하면서 페이지가 호출될때 replyNum(리뷰넘버)를 가지고 와서
		//해당하는 리뷰넘버가 있다면 리뷰작성 버튼을 리뷰수정 + X(삭제)로 만들어야함
		//이때 리뷰넘버의 조회는 where문 id, productNum을 같이 조회해서 갖고올 수 있음
		//하지만 orderList 페이지를 뿌려줄때 ex)mv.addObject("vo",orderListVO);로 뿌려줄텐데
		//jsp 페이지에서 각각의 orderList 번호에 ex)vo.replyNum이 null인지 값이 있는지를 가지고 와야함
		//이후 리뷰 수정의 경우 해당 클릭탭의 replyNum, productNum, id 등을 갖고와서 수정을 진행할것임
		//orderListVO에만 replyNum을 넣어서 임의로 값을 넘기는 식으로 해볼지
		//DB자체에도 replyNum을 넣어야 하는지 일단 고민

		ModelAndView mv = new ModelAndView();
		UserVO userVO = (UserVO)session.getAttribute("user");
		
		//replyNum 조회하려고 생성
		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setId(userVO.getId());
		reviewVO.setProductNum(1L);//일단 강제 값 부여!
		//이 조회자체가 orderList로 이루어 질것(일단 한 아이디로 같은 넘버 많이 넣어서 오류뜸 주석처리)
		//reviewVO = productReviewService.getReplyNum(reviewVO);
		//아니면 reviewVo 갖고와서 orderListVO에 replyNum 담는거 하나만 만들어서 setReplyNum으로 넣기만하자
		//mv.addObject("vo", reviewVO);
		
		mv.addObject("id",userVO.getId());//유저아이디만 보내기
		
		mv.setViewName("user/reviewListPage");//orderList page에 값들 보내야함
		return mv;
	}
	
	//리뷰 쓰기(pop 창 이동)
	@GetMapping("reviewAdd/{id}")
	public ModelAndView reviewAdd(@PathVariable("id")String id, Long productNum) {
		ModelAndView mv = new ModelAndView();
		//상품들어오면 상품 넣을것
		//BookVO book = bookService.getBookIdName(bookId);
		//넣는값도 고쳐야함
		mv.addObject("productInfo", productNum);
		mv.addObject("id", id);
		mv.setViewName("review/reviewPop");
		return mv;
	}
	
	//리뷰 수정(pop 창 이동)
	@GetMapping("reviewUpdate")
	public ModelAndView reviewUpdate(ReviewVO reviewVO, ModelAndView mv) throws Exception {
		
		//ProductVO productVO = 상품번호 가져오기(상품컨트롤러에서 작업)
		//mv.addObject("productInfo", productNum);
		mv.addObject("productInfo", 1);
		//System.out.println("reviewUpdate 진입 전" + reviewVO);
		reviewVO = productReviewService.getDetail(reviewVO);
		//System.out.println("reviewUpdate 진입 후" + reviewVO);
		mv.addObject("vo", reviewVO);
		//mv.addObject("id", reviewVO.getId());
		//mv.addObject("id", reviewVO);
		mv.setViewName("review/reviewPopUpdate");
		return mv;
	}
}




