package com.pj.pet.service;

import static org.junit.jupiter.api.Assertions.*;


import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.pj.pet.reservation.ReservationVO;
import com.pj.pet.util.Pager;

@SpringBootTest
class ServiceMapperTest {

	@Autowired
	private ServiceMapper serviceMapper;
	

	
	
	
	@Test
	void getMailData()throws Exception{
		ReservationVO reservationVO=new ReservationVO();
		reservationVO.setResNum((long)1);
		
		reservationVO=serviceMapper.getMailData(reservationVO);
		
		assertEquals(reservationVO.getSerName(),"병원1");
		
	}
	
	//@Test
	void getCount() throws Exception{
		ReservationVO reservationVO=new ReservationVO();
		reservationVO.setId("id1");
		reservationVO.setResDate("2022-05");
		List<ReservationVO> ar= serviceMapper.getResStateCount(reservationVO);
		
		assertEquals(0, ar.size());
	}
	
	
	
	//@Test
	void getListc() throws Exception {
		Pager pager = new Pager();
		pager.makeRow();
		List<ServiceVO> ar = serviceMapper.getListc(pager);
		System.out.println(ar);
		assertEquals(3, ar.size());
	}
	
	//@Test
	void getDetailc() throws Exception{
		ServiceVO serviceVO = new ServiceVO();
		serviceVO.setSerNum(3L);
		serviceVO=serviceMapper.getDetailc(serviceVO);
		System.out.println(serviceVO.toString());
		assertNotNull(serviceVO);
		

	}
	

}
