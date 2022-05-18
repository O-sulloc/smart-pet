package com.pj.pet.products;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pj.pet.category.CategoryVO;
import com.pj.pet.util.FileManager;
import com.pj.pet.util.Pager;


@Service
public class ProductService {
	@Autowired
	private ProductMapper productMapper;
	@Autowired
	private FileManager fileManager;
	
	//상품
	public List<ProductVO> getList(Pager pager)throws Exception{
		pager.makeRow();
		pager.makeNum(productMapper.getTotalCount(pager));
		return productMapper.getList(pager);
	}
	public ProductVO getDetail(ProductVO productVO)throws Exception{
		return productMapper.getDetail(productVO);
	}
	public int setAdd(ProductVO productVO,MultipartFile[] files)throws Exception{
		int result = productMapper.setAdd(productVO);
		if (files != null) {
			for (MultipartFile mf : files) {
				if (mf.isEmpty()) {
					continue;
				}
				// 1.HDD에 저장
				String fileName = fileManager.fileSave(mf, "resources/upload/product/");
				// 2. DB에 저장
				ProductFileVO productFileVO = new ProductFileVO();
				productFileVO.setProductNum(productVO.getProductNum());
				productFileVO.setFileName(fileName);
				productFileVO.setOriName(mf.getOriginalFilename());
				
				productMapper.setFileAdd(productFileVO);
			}
		}
		return result;
	}
	public int setUpdate(ProductVO productVO,MultipartFile[] files)throws Exception{
		int result = productMapper.setUpdate(productVO);
		if(files != null) {
			for(MultipartFile multipartFile: files) {
				if(multipartFile.isEmpty()) {
					continue;
				}
				ProductFileVO productFileVO = new ProductFileVO();					
				String fileName =fileManager.fileSave(multipartFile, "/resources/upload/product/");
				productFileVO.setFileName(fileName);
				productFileVO.setOriName(multipartFile.getOriginalFilename());
				productFileVO.setProductNum(productVO.getProductNum());
				result = productMapper.setFileAdd(productFileVO);
			}	
		}	
		return result;
	}
	
	public int setDelete(ProductVO productVO)throws Exception{
		List<ProductFileVO> ar=productMapper.getFileList(productVO);
		int result= productMapper.setDelete(productVO);
		for(ProductFileVO f: ar) {
			boolean check = fileManager.remove("/resources/upload/product/",f.getFileName());
		}
		return result;
	}
	
	public int setFileDelete(ProductFileVO productFileVO)throws Exception{
		productFileVO=productMapper.getFileDetail(productFileVO);
	      int check=productMapper.setFileDelete(productFileVO);
	      if(check==1) {
	         boolean result = fileManager.remove("/resources/upload/product/",productFileVO.getFileName());
	      }	      
	      return check;
	   }
	//카테고리 정렬
	public CategoryVO getCategoryDetail(CategoryVO categoryVO) throws Exception{
		return productMapper.getCategoryDetail(categoryVO);
	}
	
	public Long getpCount()throws Exception{
		return productMapper.getpCount();
	}
	
	public List<ProductVO> highPriceList(Pager pager) throws Exception{
		pager.makeRow();
		pager.makeNum(productMapper.getTotalCount(pager));
		return productMapper.highPriceList(pager);
	}
	
	public List<ProductVO> lowPriceList(Pager pager) throws Exception{
		pager.makeRow();
		pager.makeNum(productMapper.getTotalCount(pager));
		return productMapper.lowPriceList(pager);
	}
	
	public List<ProductVO> regDateList(Pager pager) throws Exception{
		pager.makeRow();
		pager.makeNum(productMapper.getTotalCount(pager));
		return productMapper.regDateList(pager);
	}
}

