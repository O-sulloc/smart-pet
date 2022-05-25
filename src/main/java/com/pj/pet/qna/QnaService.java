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
		
		System.out.println("parent" + parent);
		QnaVO child = new QnaVO();
		
		System.out.println(parent);
		//2. 답글의 ref는 부모의 ref값
		child.setRef(parent.getRef());
		
		//3. 답글의 step은 부모의 step+1
		child.setStep(parent.getStep()+1);
		
		//4. 답글의 depth는 부모의 depth+1
		child.setDepth(parent.getDepth()+1);
		
		//5. 답글에 id, productNum 넣어주기
		child.setId(qnaVO.getId());
		child.setProductNum(qnaVO.getProductNum());
		child.setContents(qnaVO.getContents());

		//qnaVO.ref      : 부모의 ref
		//qnaVO.step     : 부모의 step+1
		//qnaVO.depth    : 부모의 depth+1
		
		//5. step update
		int result = qnaMapper.setStepUpdate(parent);
		
		//6. 답글 insert 비밀글뺌(secret column)
		result = qnaMapper.setReply(child);
		
		return result;
	}


	//QNA
	//list
	public List<QnaVO> getList(Pager pager) throws Exception{
		
		pager.makeRow();
		pager.makeNum(qnaMapper.getTotalCount(pager));
	
		return qnaMapper.getList(pager);
	}

	//detail
	public QnaVO getDetail(QnaVO qnaVO) throws Exception{
		return qnaMapper.getDetail(qnaVO);
	}
	
	//add
	public int setAdd(QnaVO qnaVO) throws Exception{
		return qnaMapper.setAdd(qnaVO);
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
