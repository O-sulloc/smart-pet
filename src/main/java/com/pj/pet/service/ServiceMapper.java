package com.pj.pet.service;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ServiceMapper {

	public ServiceVO getDetail(ServiceVO serviceVO)throws Exception;
	
	public int setUpdate(ServiceVO serviceVO)throws Exception;
	
	public int setService(ServiceVO serviceVO)throws Exception;
}
