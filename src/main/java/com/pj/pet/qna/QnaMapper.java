package com.pj.pet.qna;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.pj.pet.util.Pager;

@Mapper
public interface QnaMapper {
	
	// 응답 객체만들기
	public int setReply(QnaVO qnaVO) throws Exception;
	
	//부모의 replyCheck를 바꿔줘야함
	public int setStepUpdate(QnaVO qnaVO) throws Exception;
	
	//부모의 replyCheck를 바꿔줘야함
	public int setCheckUpdate(QnaVO qnaVO) throws Exception;
	
	//seller list
	public List<QnaVO> getSellerList() throws Exception;
	
	//list
	public List<QnaVO> getList(Pager pager) throws Exception;
	
	//total(pager에 사용)
	public Long getTotalCount(Pager pager) throws Exception;
	
	//detail
	public QnaVO getDetail(QnaVO qnaVO) throws Exception;
	
	//add
	public int setAdd(QnaVO qnaVO) throws Exception;
	
	//refUpdate
	public int setRefUpdate(QnaVO qnaVO) throws Exception;
	
	//update
	public int setUpdate(QnaVO qnaVO) throws Exception;
	
	//delete
	public int setDelete(QnaVO qnaVO) throws Exception;

}
