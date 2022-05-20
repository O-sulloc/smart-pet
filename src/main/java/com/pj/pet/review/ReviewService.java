package com.pj.pet.review;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.pj.pet.review.product.ProductReviewFilesVO;
import com.pj.pet.util.Pager;

public interface ReviewService {

	//list
	public List<ReviewVO> getList(Pager pager) throws Exception;
	
	//detail
	public ReviewVO getDetail(ReviewVO reviewVO) throws Exception;
	
	//add
	public int setAdd(ReviewVO reviewVO, MultipartFile [] files) throws Exception;
	
	//update
	public int setUpdate(ReviewVO reviewVO, MultipartFile [] files) throws Exception;
	
	//delete
	public int setDelete(ReviewVO reviewVO) throws Exception;
	
	//detailFile(아직 파일 안만듬)
	//public ReviewFileVO getDetailFile(ReviewFileVO reviewFileVO) throws Exception;
	
	//fileDelete
	public int setFileDelete(ProductReviewFilesVO productReviewFilesVO) throws Exception;
	
	
}
