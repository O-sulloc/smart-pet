package com.pj.pet.qna.reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/qnaReply/*")
public class QnaReplyController {

	@Autowired
	private QnaReplyService qnaReplyService;
	
	//add DB
	@PostMapping("add")
	public int setAdd(QnaReplyVO qnaReplyVO) throws Exception{
		
		int result = qnaReplyService.setAdd(qnaReplyVO);
		
		return result;	
	}
	
	//update DB
	@PostMapping("update")
	public int setUpdate(QnaReplyVO qnaReplyVO) throws Exception{
		
		int result = qnaReplyService.setUpdate(qnaReplyVO);
		
		return result;
	}
	
	//Delete DB
	@GetMapping("delete")
	public int setDelete(QnaReplyVO qnaReplyVO) throws Exception{
		
		int result = qnaReplyService.setDelete(qnaReplyVO);
		
		return result;
	}
	
	
}
