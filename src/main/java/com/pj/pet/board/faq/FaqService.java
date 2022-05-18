package com.pj.pet.board.faq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pj.pet.util.Pager;

@Service
@Transactional(rollbackFor = Exception.class)
public class FaqService {

	@Autowired
	private FaqMapper faqMapper;
	
	
	//FAQKEYWORD
	//key list 출력시 필요
	public List<FaqKeyVO> getKeyList() throws Exception{
		return faqMapper.getKeyList();
	}
	
	
	
	//TITLE 중복체크
	public int getTitleCount(FaqVO faqVO) throws Exception{
		return faqMapper.getTitleCount(faqVO);
	}
	
	
	//FAQCATE
	//LIST
	public List<FaqCateVO> getCateList(String gradeRef) throws Exception{
		return faqMapper.getCateList(gradeRef);
	}
	
	
	//FAQ
	//list
	public List<FaqVO> getList(Pager pager) throws Exception{
		
		pager.makeRow();
		pager.makeNum(faqMapper.getTotalCount(pager));
	
		return faqMapper.getList(pager);
	}
	
	//detail
	public FaqVO getDetail(FaqVO faqVO) throws Exception{
		return faqMapper.getDetail(faqVO);
	}
	
	//add
	public int setAdd(FaqVO faqVO) throws Exception{
		return faqMapper.setAdd(faqVO);
	}
	
	//update
	public int setUpdate(FaqVO faqVO) throws Exception{
		return faqMapper.setUpdate(faqVO);
	}
	
	//delete
	public int setDelete(FaqVO faqVO) throws Exception{
		return faqMapper.setDelete(faqVO);
	}
	
	
	
	
	
}
