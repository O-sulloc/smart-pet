<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




		

		<!-- 리뷰가 없는 경우도 구현 ex) list == empty?-->
		
		<c:if test="${empty list}">
			<div>
				<span>Q&A가 없습니다</span>
			</div>
		</c:if>
		
	 	<div class="accordion accordion-flush">
			<div>
				<c:forEach items="${list}" var="vo">
					<input hidden="num" value="${vo.num}" id="num">
					<br>
					<li style="list-style:none;" class="box_top">
						<c:choose>
							<c:when test="${vo.secret == '1'}">
								<!-- true일 경우 조건을 더 넣어줄것! -->
								<!-- textOver flow 처리 해줄것? -->
								<!-- 여기에 안보이게 하는 css넣어줘야함 -->
								<!-- 일단 작성자자만 보이게 나중 판매자일경우 보게 가능해야함 -->
								<c:choose>
									<c:when test="${vo.id != id}">
										<c:choose>
											<c:when test="${vo.replyCheck == '1'}">
												<div class="box_top_in secret" style="text-align: center">미답변</div>
											</c:when>
											<c:otherwise>
												<div class="box_top_in secret" style="text-align: center">답변완료</div>
											</c:otherwise>
										</c:choose>
										<div class="box_top_in contents secret" style="width: 800px; text-align: left">
											<button class="accordion-button collapsed" type="button" data-bs-toggle="#" data-bs-target="#" aria-controls="#" aria-expanded="false" style="background-color: #ececec">
												비밀글입니다.
											</button>
										</div>
										<div class="box_top_in secret" style="text-align: center">${vo.id}</div>
										<div class="box_top_in secret" style="text-align: center">${vo.regDate}</div>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${vo.replyCheck == '1'}">
												<div class="box_top_in" style="text-align: center">미답변</div>
											</c:when>
											<c:otherwise>
												<div class="box_top_in" style="text-align: center">답변완료</div>
											</c:otherwise>
										</c:choose>
										<div class="box_top_in contents" style="width: 800px; text-align: left">
											<button class="accordion-button collapsed numCatch" data-num="${vo.num}" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${vo.num}" aria-controls="flush-collapse${vo.num}" aria-expanded="false" >
												${vo.contents}
											</button>
										</div>
										<div class="box_top_in" style="text-align: center">${vo.id}</div>
										<div class="box_top_in" style="text-align: center">${vo.regDate}</div>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<!-- textOver flow 처리 해줄것? -->
								<c:choose>
									<c:when test="${vo.replyCheck == '1'}">
										<div class="box_top_in" style="text-align: center">미답변</div>
									</c:when>
									<c:otherwise>
										<div class="box_top_in" style="text-align: center">답변완료</div>
									</c:otherwise>
								</c:choose>
								<div class="box_top_in contents" style="width: 800px; text-align: left">
									<button class="accordion-button collapsed numCatch" data-num="${vo.num}" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${vo.num}" aria-controls="flush-collapse${vo.num}" aria-expanded="false" >
										${vo.contents}
									</button>
								</div>
								<div class="box_top_in" style="text-align: center">${vo.id}</div>
								<div class="box_top_in" style="text-align: center">${vo.regDate}</div>
							</c:otherwise>
						</c:choose>
					</li>
					<li style="list-style:none; padding-left: 166px" class="box_top">
						<div id="flush-collapse${vo.num}" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
							<div class="accordion-body">
								<pre>${vo.contents}</pre>
								<c:if test="${id == vo.id}">
									<button class="update_qna_btn">수정</button><!-- 여기! -->
									<button class="delete_qna_btn">삭제</button>
								</c:if>
								<!-- 판매자, 관리자 role 들어올때만 보이게 하자 -->
								<br><br>
								<div>판매자 글 추가</div>
								<div class="seller_add_reply_wrap">
									<button>답글 쓰기</button>
								</div>
								<c:catch var="message">
									<c:forEach begin="1" end="${vo.depth}">--<pre>{vo.contents}</pre></c:forEach>
								</c:catch>
								<!-- 버튼 글추가 하고 글추가 되면 바로 삽입 되어야 하는데 어케하까-->
							</div>
						</div>
					</li>
					<br>
				</c:forEach>
			</div>
		</div>
		
		<br><br>
		<div class="row my-4 position-relative">
			<div class="position-absolute top-0 start-50 translate-middle">
				<nav aria-label="Page navigation example">
				  <ul class="pagination">
				  
			    	<li class="page-item">
			    		<a class="page-link pager" aria-label="Previous" data-pn="${pager.pre?pager.startNum-1:0}" data-num="${pager.dataNum}" href="#">
					 		<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				   
				    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
				    	<li class="page-item"><a class="page-link pager" data-pn="${i}" data-num="${pager.dataNum}" href="#">${i}</a></li>
				    </c:forEach>
	
			    	<li class="page-item">
			    		<a class="page-link pager" href="#" data-pn="${pager.next?pager.lastNum+1:0}" data-num="${pager.dataNum}">
			    			<span aria-hidden="true">&raquo;</span>
			    		</a>
			    	</li>
				   
				  </ul>
				</nav>
			</div>
		</div>