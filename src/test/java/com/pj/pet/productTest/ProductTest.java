package com.pj.pet.productTest;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.pj.pet.products.ProductMapper;
import com.pj.pet.products.ProductVO;



@SpringBootTest
public class ProductTest {

	@Autowired
	private ProductMapper productMapper;

//	@Test
//	void getListTest() throws Exception{
//	
//		List<ProductVO> ar =productMapper.getList();
//		
//		assertNotNull(ar);
//	}
	
//	@Test
//	void addTest() throws Exception {
//		
//			ProductVO productVO =new ProductVO();
//			productVO.setCategoryNum(0L);
//			productVO.setProductName("개 사료");
//			productVO.setProductPrice(1000L);
//			productVO.setProductDetail("맛있어요");
//			productVO.setProductCount(1L);
//			productVO.setRate(10L);
//			productVO.setSales(100L);
//			productVO.setWriter("seller1");
//			int result = productMapper.setAdd(productVO);
//			assertEquals(1, result);
//	
//	}

//	// @Test
//	void UpdateTest() throws Exception {
//
//		BoardVO boardVO = new BoardVO();
//		boardVO.setNum(4L);
//		boardVO.setContents("contents update!!");
//		int result = boardMapper.setUpdate(boardVO);
//		assertEquals(1, result);
//	}
//
//	// @Test
//	void DeleteTest() throws Exception {
//		BoardVO boardVO = new BoardVO();
//		boardVO.setNum(4L);
//
//		int result = boardMapper.setDelete(boardVO);
//		assertEquals(1, result);
//	}
//
//	// @Test
//	void setFileAddTest() throws Exception {
//		BoardFilesVO boardFilesVO = new BoardFilesVO();
//		boardFilesVO.setFileName("filename");
//		boardFilesVO.setOriName("oriname");
//		boardFilesVO.setNum(3L);
//		int result = boardMapper.setFileAdd(boardFilesVO);
//		assertEquals(1, result);
//	}

}
