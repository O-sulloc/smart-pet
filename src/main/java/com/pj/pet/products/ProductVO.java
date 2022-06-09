package com.pj.pet.products;

import java.sql.Date;
import java.util.List;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.pj.pet.carts.CartVO;
import com.pj.pet.category.CategoryVO;
import com.pj.pet.order.OrderVO;

import lombok.Data;

@Data
public class ProductVO {
	private Long productNum;
	private Long categoryNum;
	@NotNull(message = "필수 항목 입니다")
	private Long pcategoryNum;
	@Size(min = 10, max = 40, message = "상품 이름은 10자 이상 40자 이하로 기입해주세요.")
	private String productName;
	@Min(value = 1000, message = "가격은 1000원 이상으로 기입해주세요.")
	private Long productPrice;
	private String productDetail;
	@Min(value = 1, message = "상품 재고는 1개 이상으로 기입해주세요.")
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
	@NotNull(message = "필수 항목 입니다")
	private String productInfo;

	public Long getTotalPrice() {
		return Math.round(this.productPrice * (1 - (this.rate * 0.01)));
	}
	
	public Long getSales() {
		if(this.sales == null || this.sales <= 0) {
			this.sales = 0L;
		}
		return this.sales;
	}
}
