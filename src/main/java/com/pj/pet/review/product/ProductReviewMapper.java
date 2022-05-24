package com.pj.pet.review.product;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.pj.pet.products.ProductVO;
import com.pj.pet.review.ReviewVO;
import com.pj.pet.util.Pager;

@Mapper
public interface ProductReviewMapper {
	
	
	//replyNum 조회 만들기
	public ReviewVO getReplyNum(ReviewVO reviewVO) throws Exception;
	
	
	//list
	public List<ReviewVO> getList(Pager pager) throws Exception;
	
	//total(pager에 사용)
	public Long getTotalCount(Pager pager) throws Exception;
	
	//detail
	public ReviewVO getDetail(ReviewVO reviewVO) throws Exception;
	
	//add
	public int setAdd(ReviewVO reviewVO) throws Exception;
	
	//update
	public int setUpdate(ReviewVO reviewVO) throws Exception;
	
	//delete
	public int setDelete(ReviewVO reviewVO) throws Exception;
	
	//평점 평균 구하기
	public Double getStarAvg(Long productNum);
	
	//평점 평균 넣기
	public int setUpdateAvg(ProductReviewAvgVO dto);
	
	//productReviewFile
	
	//fileDelete
	public int setFileDelete(ProductReviewFilesVO productReviewFilesVO) throws Exception;
	
	//insert : file
	public int setFileAdd(ProductReviewFilesVO productReviewFilesVO) throws Exception;
	
	//fileList(지우려고) - 전체 지우는 용도
	public List<ProductReviewFilesVO> getFileList(ReviewVO reviewVO) throws Exception;
	
	//fileDetail(지우려고) - HDD에서 하나 지우는 용도(sevice 호출용)
	public ProductReviewFilesVO getFileDetail(ProductReviewFilesVO productReviewFilesVO) throws Exception;
	
	//별갯수확인(각각)
	public Map<String, Integer> getStarCount(Pager pager) throws Exception;
	
	//별갯수확인(총)
	public Long getStarTotal(Pager pager) throws Exception;
	
}




