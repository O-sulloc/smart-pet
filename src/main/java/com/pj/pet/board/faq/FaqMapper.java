package com.pj.pet.board.faq;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pj.pet.util.Pager;

@Mapper
public interface FaqMapper{
	
	
	//titleCount 중복체크
	public int getTitleCount(FaqVO faqVO) throws Exception;

	
	//FAQCATE
	//cate list 출력시 필요
	public List<FaqCateVO> getCateList(String gradeRef) throws Exception;
	
	
	//FAQ
	//list
	public List<FaqVO> getList(Pager pager) throws Exception;
	
	//total(pager에 사용)
	public Long getTotalCount(Pager pager) throws Exception;
	
	//detail
	public FaqVO getDetail(FaqVO faqVO) throws Exception;
	
	//insert
	public int setAdd(FaqVO faqVO) throws Exception;
	
	//update
	public int setUpdate(FaqVO faqVO) throws Exception;
	
	//delete
	public int setDelete(FaqVO faqVO) throws Exception;
	
	
	
}
