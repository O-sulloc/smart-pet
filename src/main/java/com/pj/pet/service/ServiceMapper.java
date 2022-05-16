package com.pj.pet.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pj.pet.util.Pager;

@Mapper
public interface ServiceMapper {

	//list : getList
	public List<ServiceVO> getList(Pager pager) throws Exception;
	
	//detail
	public ServiceVO getDetail(ServiceVO serviceVO) throws Exception;
	
	//total
	public Long total(Pager pager) throws Exception;
}
