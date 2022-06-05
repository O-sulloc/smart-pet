package com.pj.pet.products;

import java.sql.Date;
import java.util.List;

import com.pj.pet.carts.CartVO;
import com.pj.pet.category.CategoryVO;
import com.pj.pet.order.OrderVO;
import com.pj.pet.review.ReviewVO;

import lombok.Data;

@Data
public class ProductVO {
	private Long productNum;
	private Long categoryNum;
	private Long pcategoryNum;
	private String productName;
	private Long productPrice;
	private String productDetail;
	private Long productCount;
	private Long rate;
	private Long sales;
	private Date regDate;
	private String id;
	private List<ProductFileVO> productFileVOs;
	public Long totalPrice;
	private CategoryVO categoryVO;
	private CartVO cartVO;
	private OrderVO orderVO;
	
	//재석추가(별점 평균)
	private Double starAvg;
	
	public Long getTotalPrice() {		
		return Math.round(this.productPrice * (1-(this.rate*0.01)));
	}
}
