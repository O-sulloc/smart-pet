package com.pj.pet.qna.reply;

import java.sql.Date;

import lombok.Data;

@Data
public class QnaReplyVO {
	
	private Long replyNum;
	private Long num;
	private String id;
	private String contents;
	private Date regDate;
	
	private Long replyCheck;//답변완료, 미답변 변수만 설정

}
