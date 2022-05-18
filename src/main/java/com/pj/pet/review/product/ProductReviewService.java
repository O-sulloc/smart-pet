package com.pj.pet.review.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pj.pet.review.ReviewService;
import com.pj.pet.review.ReviewVO;
import com.pj.pet.util.Pager;

@Service
public class ProductReviewService implements ReviewService {

	@Autowired
	private ProductReviewMapper productReviewMapper;
	
	//@Autowired
	//private 파일매니저
	
	@Override
	public List<ReviewVO> getList(Pager pager) throws Exception {
		return productReviewMapper.getList(pager);
	}

	@Override
	public ReviewVO getDetail(ReviewVO reviewVO) throws Exception {
		return productReviewMapper.getDetail(reviewVO);
	}

	@Override
	public int setAdd(ReviewVO reviewVO, MultipartFile[] files) throws Exception {
		
		int result = productReviewMapper.setAdd(reviewVO);
		
		if(files != null) {

//			for(MultipartFile f : files) {
//				
//				if(f.isEmpty()) {
//					continue;
//				}
//				
//				String fileName = fileManager.fileSave(f, "/resources/upload/review/product/");
//				
//				ProductFilesVO productFilesVO = new ProductFilesVO();
//				productFilesVO.setProductNum(productVO.getProductNum());
//				productFilesVO.setFileName(fileName);
//				productFilesVO.setOriName(f.getOriginalFilename());
//				productMapper.setFileAdd(productFilesVO);
//				
//			}

		}
		
		return result;
		
	}

	@Override
	public int setUpdate(ReviewVO reviewVO) throws Exception {
		return productReviewMapper.setUpdate(reviewVO);
	}

	@Override
	public int setDelete(ReviewVO reviewVO) throws Exception {
		return productReviewMapper.setDelete(reviewVO);
	}

}


