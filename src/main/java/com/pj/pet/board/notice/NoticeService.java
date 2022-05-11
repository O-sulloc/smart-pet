package com.pj.pet.board.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pj.pet.util.Pager;

@Service
@Transactional(rollbackFor = Exception.class)
public class NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;
	
	//notice
	//list
	public List<NoticeVO> getList(Pager pager) throws Exception{
		
		pager.makeRow();
		pager.makeNum(noticeMapper.getTotalCount(pager));
	
		return noticeMapper.getList(pager);
	}
	
	//detail
	public NoticeVO getDetail(NoticeVO noticeVO) throws Exception{
		return noticeMapper.getDetail(noticeVO);
	}
	
	//add
	public int setAdd(NoticeVO noticeVO) throws Exception{
		return noticeMapper.setAdd(noticeVO);
	}
	
	//update
	public int setUpdate(NoticeVO noticeVO) throws Exception{
		return noticeMapper.setUpdate(noticeVO);
	}
	
	//delete
	public int setDelete(NoticeVO noticeVO) throws Exception{
		return noticeMapper.setDelete(noticeVO);
	}
	
	
	
	
	
}
