package com.pj.pet.board.faq;

import lombok.Data;

@Data
public class FaqCateVO {

	private String grade;
	private String cateName;
	private String gradeRef;
	
	public String getGradeRef() {
		
		if(this.gradeRef == null) {
			this.gradeRef = "100";
		}
		
		return gradeRef;
	}
	
	
}
