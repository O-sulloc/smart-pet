<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




		<!-- 리뷰가 없는 경우도 구현 ex) list == empty?-->
		<c:if test="${empty list}">
			<div>
				<span>리뷰가 없습니다</span>
			</div>
		</c:if>

		<!-- class="table table-dark table-striped" --><!-- 쓰려고 밖으로뺌 -->
		<!-- 보니까 뭐 지우면 작동 더 잘됨 나중 qna 확인! -->
	 	<div class="accordion accordion-flush" id="accordionFlushExample">
			<div class="accordion-item">
				<c:forEach items="${list}" var="vo">
				<input type="hidden" value="${vo.star}" class="star">
					<li style="list-style:none;">
						<div class="comment_wrap">
							<div class="reply_top">
								<span class="id_span">${vo.id}</span>
								<span class="date_span">${vo.regDate}</span>
								<c:if test="${vo.star == 1}">
									<span class="rating_span">평점 : <span class="rating_value_span"><img src="/resources/image/star_11.png">&nbsp;&nbsp;${vo.star}</span>점</span>
								</c:if>
								<c:if test="${vo.star == 2}">
									<span class="rating_span">평점 : <span class="rating_value_span"><img src="/resources/image/star_22.png">&nbsp;&nbsp;${vo.star}</span>점</span>
								</c:if>
								<c:if test="${vo.star == 3}">
									<span class="rating_span">평점 : <span class="rating_value_span"><img src="/resources/image/star_33.png">&nbsp;&nbsp;${vo.star}</span>점</span>
								</c:if>
								<c:if test="${vo.star == 4}">
									<span class="rating_span">평점 : <span class="rating_value_span"><img src="/resources/image/star_44.png">&nbsp;&nbsp;${vo.star}</span>점</span>
								</c:if>
								<c:if test="${vo.star == 5}">
									<span class="rating_span">평점 : <span class="rating_value_span"><img src="/resources/image/star_55.png">&nbsp;&nbsp;${vo.star}</span>점</span>
								</c:if>
								<!-- 옮길것 마이페이지로 -->
								<!-- <a class="update_reply_btn">수정</a><a class="delete_reply_btn">삭제</a> -->
							</div>
							<div class="reply_middle">
								물품명 조인으로
							</div>
							
							<!-- 간격 벌리는거 생각 -->
							<div class="reply_bottom">
								<div class="reply_bottom_txt">
									<c:choose>
										<c:when test="${not empty vo.contents || not empty vo.filesVOs}">							
											<h2 class="accordion-header" id="flush-headingOne">
												<button class="accordion-button collapsed numCatch" data-num="${vo.replyNum}" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${vo.replyNum}" aria-controls="flush-collapse${vo.replyNum}" aria-expanded="false" >
												<!-- <i class="bi bi-award"></i> 넣어도 이쁠듯 -->
												<div class="title"><strong>${vo.title}</strong></div>
										        </button>
										    </h2>
										    <div id="flush-collapse${vo.replyNum}" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
						      					<div class="accordion-body">${vo.contents}</div>
						      					<div>
						      					<c:forEach items="${vo.filesVOs}" var="f">
													<img alt="" width="300" height="300" src="../resources/upload/review/product/${f.fileName}" id="imgd">
												</c:forEach>
						      					</div>
						      				</div>
					      				</c:when>
					      				<c:otherwise>
					      					<h2 class="accordion-header" id="flush-headingOne"><!-- 클래스 줘서 alert창 띄울지는 고민 -->
												<button class="accordion-button collapsed numCatch" data-num="${vo.replyNum}" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${vo.replyNum}" aria-controls="flush-collapse${vo.replyNum}" aria-expanded="false" >
												<!-- <i class="bi bi-award"></i> 넣어도 이쁠듯 -->
												<div class="title"><strong>${vo.title}</strong></div>
										        </button>
										    </h2>
					      				</c:otherwise>
				      				</c:choose>
								</div>
							</div>
						</div>
					</li>
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