package com.pj.pet.qna.reply;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import com.pj.pet.util.Pager;

@Mapper
public interface QnaReplyMapper {
	

	//list
	public List<QnaReplyVO> getList(Pager pager) throws Exception;

	//add
	public int setAdd(QnaReplyVO qnaReplyVO) throws Exception;
	
	//update
	public int setUpdate(QnaReplyVO qnaReplyVO) throws Exception;
	
	//delete
	public int setDelete(QnaReplyVO qnaReplyVO) throws Exception;


}
