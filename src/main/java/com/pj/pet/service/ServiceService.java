package com.pj.pet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ServiceService {

	@Autowired
	private ServiceMapper serviceMapper;
	
	public ServiceVO getDetail(ServiceVO serviceVO)throws Exception{
		return serviceMapper.getDetail(serviceVO);
	}
	
	public int setUpdate(ServiceVO serviceVO)throws Exception{
		return serviceMapper.setUpdate(serviceVO);
	}
	
	public int setService(ServiceVO serviceVO)throws Exception{
		return serviceMapper.setService(serviceVO);
	}
}
