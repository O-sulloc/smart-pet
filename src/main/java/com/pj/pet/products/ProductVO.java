package com.pj.pet.products;

import java.sql.Date;
import java.util.List;

import com.pj.pet.category.CategoryVO;

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
	private String writer;
	private List<ProductFileVO> productFileVOs;
	public Long totalPrice;
	private CategoryVO categoryVO;
	
	public Long getTotalPrice() {		
		return Math.round(this.productPrice * (1-(this.rate*0.01)));
	}
}
