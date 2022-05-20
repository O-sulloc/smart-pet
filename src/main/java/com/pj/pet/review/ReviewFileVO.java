package com.pj.pet.review;

import com.pj.pet.util.FileVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class ReviewFileVO extends FileVO{
	
	private Long replyNum;
	
}
