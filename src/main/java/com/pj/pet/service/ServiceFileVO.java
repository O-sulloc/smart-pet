package com.pj.pet.service;

import com.pj.pet.util.FileVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class ServiceFileVO extends FileVO{
	private Long serNum;
}
