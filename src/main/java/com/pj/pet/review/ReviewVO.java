package com.pj.pet.review;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewVO {

	private Long replyNum;
	private String id;
	private String contents;
	private Date regDate;
	private Integer star;
	//product 리뷰(넣은 이유는 값을 다 담을때 통합테이블로 쓰려고)
	private Long productNum;
	//reserve 리뷰
	private Long resNum;
	
}
