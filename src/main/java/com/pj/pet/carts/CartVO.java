package com.pj.pet.carts;

import java.util.List;

import com.pj.pet.products.ProductVO;


import lombok.Data;

@Data
public class CartVO {
	private Long cartNum;
	private String id;
	private Long productNum;
	private Long productAmount;
	private int payCheck;
	private ProductVO productVO;
}
