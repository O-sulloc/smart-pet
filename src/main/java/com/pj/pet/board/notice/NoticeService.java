package com.pj.pet.board.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;
	
	//notice
	public List<NoticeVO> getList() throws Exception{
		
		
		return noticeMapper.getList();
	}
	
}
