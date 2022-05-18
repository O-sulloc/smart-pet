package com.pj.pet.review;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.pj.pet.review.product.ProductReviewMapper;
import com.pj.pet.review.product.ProductReviewVO;

@SpringBootTest
class ProductReviewMapperTest {

	@Autowired
	private ProductReviewMapper productReviewMapper;
	
	//@Test
	void setAdd() throws Exception{
		
		ProductReviewVO productReviewVO = new ProductReviewVO();
		productReviewVO.setProductNum(1L);
		productReviewVO.setId("admin");
		productReviewVO.setStar(1);
		productReviewVO.setContents("테스트");
		
		int result = productReviewMapper.setAdd(productReviewVO);
		assertEquals(1, result);
		
	}

}
