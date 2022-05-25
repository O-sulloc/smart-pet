package com.pj.pet.qna;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.pj.pet.util.Pager;

@Mapper
public interface QnaMapper {
	
	// 응답 객체만들기(qnaDTO로 받는 이유는 boardDTO에 답글관련 자료 안넣었기때문)
	public int setReply(QnaVO qnaVO) throws Exception;
	
	//부모의 step 업데이트하는것
	public int setStepUpdate(QnaVO qnaVO) throws Exception;
	
	//list
	public List<QnaVO> getList(Pager pager) throws Exception;
	
	//total(pager에 사용)
	public Long getTotalCount(Pager pager) throws Exception;
	
	//detail
	public QnaVO getDetail(QnaVO qnaVO) throws Exception;
	
	//add
	public int setAdd(QnaVO qnaVO) throws Exception;
	
	//update
	public int setUpdate(QnaVO qnaVO) throws Exception;
	
	//delete
	public int setDelete(QnaVO qnaVO) throws Exception;

}
