package com.pj.pet.notice;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.pj.pet.board.notice.NoticeMapper;
import com.pj.pet.board.notice.NoticeVO;

@SpringBootTest
class NoticeMapperTest {

	@Autowired
	private NoticeMapper noticeMapper;
	
	//insert
	//@Test
	void setAdd() throws Exception{
		
		NoticeVO noticeVO = new NoticeVO();
		noticeVO.setId("admin");
		noticeVO.setTitle("t2");
		noticeVO.setContents("c3");
		
		int result = noticeMapper.setAdd(noticeVO);
		assertEquals(1, result);
		
	}

}
