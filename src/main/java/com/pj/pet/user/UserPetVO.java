package com.pj.pet.user;

import java.sql.Date;

import lombok.Data;

@Data
public class UserPetVO {

	private Long petNum;
	private String id;
	private Long petKind;
	private String petName;
	private Date petBirth;
	private Long petSex;
}
