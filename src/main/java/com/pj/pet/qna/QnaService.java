package com.pj.pet.qna;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.pj.pet.util.Pager;

@Service
@Transactional(rollbackFor = Exception.class)
public class QnaService {
	
	@Autowired
	private QnaMapper qnaMapper;
	
	//reply
	public int setReply(QnaVO qnaVO) throws Exception{

		//1. 부모의 정보를 조회(ref, step, depth)
		System.out.println("reply sevice 진입!" + qnaVO);
		
		QnaVO parent = qnaMapper.getDetail(qnaVO);
		
		System.out.println(parent);
		//2. 답글의 ref는 부모의 ref값
		qnaVO.setRef(parent.getRef());
		
		//3. 답글의 step은 부모의 step+1
		qnaVO.setStep(parent.getStep()+1);
		
		//4. 답글의 depth는 부모의 depth+1
		qnaVO.setDepth(parent.getDepth()+1);
		
		//5. 답글에 id, productNum 넣어주기//child 없애버림
//		qnaVO.setId(qnaVO.getId());
//		qnaVO.setProductNum(qnaVO.getProductNum());
//		qnaVO.setContents(qnaVO.getContents());

		//qnaVO.ref      : 부모의 ref
		//qnaVO.step     : 부모의 step+1
		//qnaVO.depth    : 부모의 depth+1
		
		//5. step update
		int result = qnaMapper.setStepUpdate(parent);
		
		//6. setCheckUpdate
		result = qnaMapper.setCheckUpdate(parent);
		
		//6. 답글 insert 비밀글뺌(secret column)
		result = qnaMapper.setReply(qnaVO);
		
		return result;
	}

	//list(판매자)
	public List<QnaVO> getSellerList() throws Exception{
		return qnaMapper.getSellerList();
	}
	
	

	//QNA
	//list
	public List<QnaVO> getList(Pager pager) throws Exception{
		
		pager.makeRow();
		pager.makeNum(qnaMapper.getTotalCount(pager));
	
		//반목문으로 QNAVO하나를 꺼내서 거기에 해당하는 NUM을꺼냄
		//그 NUM으로 REPLYLIST각각 호출
		//이거를 한번에 보내야함
		
		
		return qnaMapper.getList(pager);
	}

	//detail
	public QnaVO getDetail(QnaVO qnaVO) throws Exception{
		return qnaMapper.getDetail(qnaVO);
	}
	
	//add
	public int setAdd(QnaVO qnaVO) throws Exception{
		int result = qnaMapper.setAdd(qnaVO);
		result = qnaMapper.setRefUpdate(qnaVO);
		return result;
	}
	
	//update
	public int setUpdate(QnaVO qnaVO) throws Exception{
		return qnaMapper.setUpdate(qnaVO);
	}
	
	//delete
	public int setDelete(QnaVO qnaVO) throws Exception{
		return qnaMapper.setDelete(qnaVO);
	}
	
}
