package com.pj.pet.carts;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class CartSchedule {
	@Autowired
	private CartService cartService;
	
	//바로결제에서 뒤로가기 누르거나 다른 링크를 갔거나 결제를 실행 하지 않았을때 스캐쥴을 걸어서 삭제.
	@Scheduled(cron = "0  0  0  *  *  *")
	public void cronSchedule()throws Exception{
		//payCheck=2가 있으면 삭제
		CartVO cartVO =new CartVO();
		List<CartVO> ar =cartService.buyCheck(cartVO);
		if(ar!=null) {
		cartService.buyDelete(cartVO);
		System.out.println("바로결제하기 에서 결제를 하지않아 취소됩니다");
		}
	}
}
