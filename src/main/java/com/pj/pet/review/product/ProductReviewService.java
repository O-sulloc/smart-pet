package com.pj.pet.review.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pj.pet.review.ReviewService;
import com.pj.pet.review.ReviewVO;
import com.pj.pet.util.FileManager;
import com.pj.pet.util.Pager;

@Service
public class ProductReviewService implements ReviewService {

	@Autowired
	private ProductReviewMapper productReviewMapper;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public List<ReviewVO> getList(Pager pager) throws Exception {
		pager.makeRow();
		pager.makeNum(productReviewMapper.getTotalCount(pager));
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

			for(MultipartFile f : files) {
				
				if(f.isEmpty()) {
					continue;
				}
				
				String fileName = fileManager.fileSave(f, "/resources/upload/review/product/");
				
				ProductReviewFilesVO productReviewFilesVO = new ProductReviewFilesVO();
				productReviewFilesVO.setReplyNum(reviewVO.getReplyNum());
				productReviewFilesVO.setFileName(fileName);
				productReviewFilesVO.setOriName(f.getOriginalFilename());
				result = productReviewMapper.setFileAdd(productReviewFilesVO);
				
			}

		}
		
		return result;
		
	}

	@Override//나중에 파일
	public int setUpdate(ReviewVO reviewVO, MultipartFile[] files) throws Exception {
		
		int result = productReviewMapper.setUpdate(reviewVO);
		
		if(files != null) {

			for(MultipartFile f : files) {
				
				if(f.isEmpty()) {
					continue;
				}
				
				String fileName = fileManager.fileSave(f, "/resources/upload/review/product/");
				
				ProductReviewFilesVO productReviewFilesVO = new ProductReviewFilesVO();
				productReviewFilesVO.setReplyNum(reviewVO.getReplyNum());
				productReviewFilesVO.setFileName(fileName);
				productReviewFilesVO.setOriName(f.getOriginalFilename());
				result = productReviewMapper.setFileAdd(productReviewFilesVO);
				
			}

		}
		return result;
	}

	@Override//나중에 파일
	public int setDelete(ReviewVO reviewVO) throws Exception {
		
		List<ProductReviewFilesVO> ar = productReviewMapper.getFileList(reviewVO);
		
		int result = productReviewMapper.setDelete(reviewVO);
		
		if(result > 0) {
			for(ProductReviewFilesVO vo: ar) {
				boolean check = fileManager.remove("/resources/upload/review/product/", vo.getFileName());
			}
		}

		return result;
	}
	
	//파일 db에서 삭제
	@Override
	public int setFileDelete(ProductReviewFilesVO productReviewFilesVO) throws Exception {
		//DB에서 조회
		productReviewFilesVO = productReviewMapper.getFileDetail(productReviewFilesVO);
		
		int check = productReviewMapper.setFileDelete(productReviewFilesVO);
		if(check > 0) {
			boolean result = fileManager.remove("/resources/upload/review/product/", productReviewFilesVO.getFileName());
		}
		return check;
	}
	

	//star 평균값 구하기
	public void setRating(Long productNum) {
		
		Double starAvg = productReviewMapper.getStarAvg(productNum);
		
		if(starAvg == null) {
			starAvg = 0.0;
		}	
		//안되면 이 코드
		starAvg = (double) (Math.round(starAvg*10));
		starAvg = starAvg / 10;
		
		ProductReviewAvgVO avg = new ProductReviewAvgVO();
		avg.setProductNum(productNum);
		avg.setStarAvg(starAvg);	

		productReviewMapper.setUpdateAvg(avg);
		
	}

}


