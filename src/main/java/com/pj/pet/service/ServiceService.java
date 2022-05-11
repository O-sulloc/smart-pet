package com.pj.pet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pj.pet.util.Pager;

@Service
@Transactional(rollbackFor = Exception.class)
public class ServiceService {

	@Autowired
	private ServiceMapper serviceMapper;
	
	public List<ServiceVO> getList(Pager pager) throws Exception{
		pager.makeRow();
		Long totalCount= serviceMapper.total(pager);
		pager.makeNum(totalCount);
		List<ServiceVO> ar = serviceMapper.getList(pager);
		return ar;
	}
	
	public ServiceVO getDetail(ServiceVO serviceVO) throws Exception{
		return serviceMapper.getDetail(serviceVO);
	}
}
