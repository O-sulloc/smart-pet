package com.pj.pet.products;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pj.pet.carts.CartVO;
import com.pj.pet.category.CategoryVO;
import com.pj.pet.util.Pager;

@Mapper
public interface ProductMapper {
	//상품
	public List<ProductVO> getList(Pager pager) throws Exception;

	public Long getTotalCount(Pager pager) throws Exception;

	public ProductVO getDetail(ProductVO productVO) throws Exception;

	public int setAdd(ProductVO productVO) throws Exception;

	public int setUpdate(ProductVO productVO) throws Exception;

	public int setDelete(ProductVO productVO) throws Exception;
	
	public List<ProductFileVO> getFileList(ProductVO productVO) throws Exception;

	public ProductFileVO getFileDetail(ProductFileVO productFilesVO) throws Exception;

	public int setFileAdd(ProductFileVO productFilesVO) throws Exception;

	public int setFileDelete(ProductFileVO productFilesVO) throws Exception;
	
	//카테고리 정렬
	public CategoryVO getCategoryDetail(CategoryVO categoryVO) throws Exception;
	
	public Long getpCount()throws Exception;
	
	//재고 변경
	public int countMinus(Long cartNum) throws Exception;
	
	public int countPlus(Long cartNum) throws Exception;
	
	//판매량 변경
	public int saleMinus(Long cartNum) throws Exception;
	
	public int salePlus(Long cartNum) throws Exception;

}
