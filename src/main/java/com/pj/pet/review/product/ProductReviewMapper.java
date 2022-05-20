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
	
}




