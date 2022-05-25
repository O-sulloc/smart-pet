package com.pj.pet.cartrefer;

import lombok.Data;

@Data
public class CartReferVO {
	private Long cartreferNum;
	private Long cartNum;
	private Long orderNum;
	private Long paymentKind;
}
