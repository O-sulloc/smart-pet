package com.pj.pet.order;

import java.sql.Date;
import java.util.List;

import com.pj.pet.carts.CartVO;
import com.pj.pet.pay.PayVO;
import com.pj.pet.products.ProductVO;

import lombok.Data;

@Data
public class OrderVO {
	private String orderNum;
	private Long payNum;
	private String id;
	private String orderName;
	private Long shipState;
	private Date orderDate;
	private Long refund;
	private PayVO payVO;
	private CartVO cartVO;

}
