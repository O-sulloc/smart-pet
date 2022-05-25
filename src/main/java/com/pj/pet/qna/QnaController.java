package com.pj.pet.qna;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


@RestController
@RequestMapping("/qna/*")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;

	//add DB
	@PostMapping("add")
	public int setAdd(QnaVO qnaVO) throws Exception{
		//System.out.println("qna add 진입!" + qnaVO.getSecret());
		int result = qnaService.setAdd(qnaVO);
		
		return result;	
		
	}
	
	//update DB
	@PostMapping("update")
	public int setUpdate(QnaVO qnaVO) throws Exception{
		//System.out.println("qna update 진입!" + qnaVO.getSecret());
		
		int result = qnaService.setUpdate(qnaVO);
		
		return result;
	}
	
	//Delete DB
	@GetMapping("delete")//파일도 있으면 넣어야함
	public int setDelete(QnaVO qnaVO) throws Exception{
		
		int result = qnaService.setDelete(qnaVO);
		
		return result;
	}
	
	//판매자(reply 삭제시 삭제하고 부모글의 reply 삭제시도 같이 호출해야함) - 이건 qna controller?
	//판매자(reply add DB)
	@PostMapping("reply")
	public int setReply(QnaVO qnaVO) throws Exception{
		
		System.out.println("qna reply 진입!");
		System.out.println(qnaVO);
		int result = qnaService.setReply(qnaVO);
		
		return result;
	}
	
	//판매자(reply add update)
//	@PostMapping("reply")
//	public ModelAndView setReply(QnaVO qnaVO) throws Exception{
//		ModelAndView mv = new ModelAndView();
//		int result = qnaService.setReply(qnaVO);
//		mv.setViewName("redirect:./list");
//		return mv;
//	}
	

}
