package com.pj.pet.board.notice;

import com.pj.pet.board.BoardVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class NoticeVO extends BoardVO{

	private String id;
	private Integer grade;
	
	private NoticeCateVO noticeCateVO;
	
}
