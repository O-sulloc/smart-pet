package com.pj.pet.user;

import java.sql.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class UserVO {

	@NotBlank
	private String id;
	
	@NotBlank
	@Size(max=20, min=8)
	private String pw;
	
	@NotBlank
	@Size(max=20, min=8)
	private String checkPw;
	
	@NotBlank
	private String name;
	
	@NotBlank
	private String phone;
	
	@NotBlank
	@Email
	private String email;
	
	@NotBlank
	private String address;
	
	private Date joinDate;
	private Long role;
	private Long point;
}
