package com.pj.pet.board;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardDAO {

	private Long num;
	private String title;
	private String contents;
	private Date regDate;
	
}
