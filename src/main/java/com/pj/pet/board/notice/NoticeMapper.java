package com.pj.pet.board.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pj.pet.board.faq.FaqVO;
import com.pj.pet.util.Pager;

@Mapper
public interface NoticeMapper{

	
	//titleCount 중복체크
	public int getTitleCount(NoticeVO noticeVO) throws Exception;

	
	//NOTICE
	//list
	public List<NoticeVO> getList(Pager pager) throws Exception;
	
	//total(pager에 사용)
	public Long getTotalCount(Pager pager) throws Exception;
	
	//detail
	public NoticeVO getDetail(NoticeVO noticeVO) throws Exception;
	
	//insert
	public int setAdd(NoticeVO noticeVO) throws Exception;
	
	//update
	public int setUpdate(NoticeVO noticeVO) throws Exception;
	
	//delete
	public int setDelete(NoticeVO noticeVO) throws Exception;
	
	
	
}
