package com.pj.pet.board.faq;

import com.pj.pet.board.BoardVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class FaqVO extends BoardVO{

	//아이디 변수, 등급 변수(카테고리 사용)
	private String id;
	private String grade;
	
	//카테고리명을 담는 변수
	private FaqCateVO faqCateVO;
	
	//글번호 정렬 담는 변수
	private Integer rowNum;
	
}
