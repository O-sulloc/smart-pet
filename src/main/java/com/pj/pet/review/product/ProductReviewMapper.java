package com.pj.pet.review.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.pj.pet.review.ReviewVO;
import com.pj.pet.util.Pager;

@Mapper
public interface ProductReviewMapper {
	
	//list
	public List<ReviewVO> getList(Pager pager) throws Exception;
	
	//total(pager에 사용)
	//public Long getTotalCount(Pager pager) throws Exception;
	
	//detail
	public ReviewVO getDetail(ReviewVO reviewVO) throws Exception;
	
	//add
	public int setAdd(ReviewVO reviewVO) throws Exception;
	
	//update
	public int setUpdate(ReviewVO reviewVO) throws Exception;
	
	//delete
	public int setDelete(ReviewVO reviewVO) throws Exception;
	
}
