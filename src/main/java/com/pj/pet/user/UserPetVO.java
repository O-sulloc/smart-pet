package com.pj.pet.user;

import lombok.Data;

@Data
public class UserPetVO {

	private Long petNum;
	private String id;
	private Long petKind;
	private String petName;
	private String petBirth;
	private Long petSex;
}
