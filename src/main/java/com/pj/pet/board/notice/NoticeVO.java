package com.pj.pet.board.notice;

import com.pj.pet.board.BoardVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class NoticeVO extends BoardVO{

	//아이디 변수, 등급 변수(카테고리 사용)
	private String id;
	private Integer grade;
	
	//카테고리명을 담는 변수
	private NoticeCateVO noticeCateVO;
	
	//다음글 변수, 이전글 변수
	private Integer prevNum;
	private Integer nextNum;
	private String prevTitle;
	private String nextTitle;
	
	//글번호 정렬 담는 변수
	private Integer rowNum;
	
}
