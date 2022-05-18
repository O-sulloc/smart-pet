package com.pj.pet.notice;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.pj.pet.board.notice.NoticeMapper;
import com.pj.pet.board.notice.NoticeVO;
import com.pj.pet.util.Pager;

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
	
	//list
	//@Test
	void getListTest() throws Exception{
		
		Pager pager = new Pager();
		List<NoticeVO> ar = noticeMapper.getList(pager);

		
		System.out.println(ar);
		assertNotEquals(0, ar.size());
		
	}

}



