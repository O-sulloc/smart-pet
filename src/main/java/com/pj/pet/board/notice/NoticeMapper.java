package com.pj.pet.board.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeMapper{

	//notice
	public List<NoticeVO> getList() throws Exception;
	
	public int setAdd(NoticeVO noticeVO) throws Exception;
	
	
}
