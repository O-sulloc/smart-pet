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
	
	//reply DB
	@PostMapping("reply")
	public int setReply(QnaVO qnaVO) throws Exception{
		System.out.println("qna reply 진입!" + qnaVO);
		int result = qnaService.setReply(qnaVO);
		
		return result;	
		
	}

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
	
	

}
