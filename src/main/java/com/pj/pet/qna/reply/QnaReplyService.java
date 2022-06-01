package com.pj.pet.qna.reply;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.pj.pet.qna.QnaMapper;
import com.pj.pet.qna.QnaVO;
import com.pj.pet.util.Pager;

@Service
@Transactional(rollbackFor = Exception.class)
public class QnaReplyService {

	@Autowired
	private QnaReplyMapper qnaReplyMapper;
	
	@Autowired
	private QnaMapper qnaMapper;
	
	//list(여기 매개변수 pager로 바꿔봄)
	public List<QnaReplyVO> getList(Pager pager) throws Exception{
		//System.out.println("qnareplysevice 진입??" + qnaReplyVO);
		return qnaReplyMapper.getList(pager);
	}

	//add
	public int setAdd(QnaReplyVO qnaReplyVO) throws Exception{
		
		int result = qnaReplyMapper.setAdd(qnaReplyVO);
				
		QnaVO qnaVO = new QnaVO();
		qnaVO.setNum(qnaReplyVO.getNum());
		qnaVO.setReplyCheck(qnaReplyVO.getReplyCheck());
		//add를 하면서 qna(num)갖고와서 update해줘야함
		
		if(result > 0) {//qnaReply 잘 등록 되고 나서 - 더 막아줄지 생각
			//result = qnaMapper.setReplyUpdate(qnaVO);
		}
		
		return result;
	}
	
	//update
	public int setUpdate(QnaReplyVO qnaReplyVO) throws Exception{
		return qnaReplyMapper.setUpdate(qnaReplyVO);
	}
	
	//delete
	public int setDelete(QnaReplyVO qnaReplyVO) throws Exception{
		return qnaReplyMapper.setDelete(qnaReplyVO);
	}
	
	
	
	
	
	
	
	
	
	
	
}
