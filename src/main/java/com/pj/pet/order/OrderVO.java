package com.pj.pet.order;

import lombok.Data;

@Data
public class OrderVO {
	private Long orderNum;
	private String id;
	private Long orderPrice;
	private Long orderAmount;
	private Long payCheck;
}
