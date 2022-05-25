package com.pj.pet.qna;

import java.sql.Date;

import lombok.Data;

@Data
public class QnaVO {

	private Long num;
	private Long productNum;
	private String id;
	private String contents;
	private Date regDate;
	private Long ref;
	private Long step;
	private Long depth;
	
	private Long secret;     // 비밀글 여부 1비밀글, 2비밀글해제
	private Long replyCheck; // 판매자 응답 여부 1미답변, 2답변완료
	
}
