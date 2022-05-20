<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<h3 class="reviewTable">상품리뷰</h3>
	<hr>
	<table class="reviewTable">
	  <tr>
	    <th>사용자 총평점</th>
	    <th>전체리뷰수</th>
	    <th>평점비율</th>
	  </tr>
	  <tr>
	    <td>밑에 별 평점에따라 색이 없어짐(이미지)</td>
	    <td>이미지</td>
	    <td>이미지(제일많은거 강조)</td>
	  </tr>
	  <tr>
	    <td>점수</td>
	    <td>리뷰갯수코드</td>
	    <td>5점,4점,3점,2점,1점</td>
	  </tr>
	</table>
	<hr>
	<table class="reviewTable">
	  <tr>
	    <th>리뷰 ~~건 코드</th>
	    <th>최신순(오른쪽붙어있음)</th>
	    <th>평점 높은순</th>
	    <th>평점 낮은순</th>
	  </tr>
	</table>
	<br>

	<!-- 리뷰가 없는 경우도 구현 ex) list == empty?-->

 	<!-- class="table table-dark table-striped" --><!-- 쓰려고 밖으로뺌 -->
 	<div class="accordion accordion-flush" id="accordionFlushExample">
		<div class="accordion-item">
			<c:forEach items="${list}" var="vo">
				<li>
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
								<span class="rating_span">평점 : <span class="rating_value_span"><img src="/resources/image/star_44.png">&nbsp;&nbsp;${vo.star}</span>점</span>
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
								<c:choose><!-- 내용이나 사진 있으면 열리게 -->
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
		<%-- <table width="700" class="reviewTable">
			<tr>
				<td rowspan="3" width="100">작성자사진</td>
				<c:if test="${vo.star == 1}">
					<td><img src="/resources/image/star_11.png">&nbsp;${vo.star}</td>
				</c:if>
				<c:if test="${vo.star == 2}">
					<td><img src="/resources/image/star_22.png">&nbsp;${vo.star}</td>
				</c:if>
				<c:if test="${vo.star == 3}">
					<td><img src="/resources/image/star_33.png">&nbsp;${vo.star}</td>
				</c:if>
				<c:if test="${vo.star == 4}">
					<td><img src="/resources/image/star_44.png">&nbsp;${vo.star}</td>
				</c:if>
				<c:if test="${vo.star == 5}">
					<td><img src="/resources/image/star_55.png">&nbsp;${vo.star}</td>
				</c:if>
			</tr>
			<tr>
				<td width="550" height="20">
					<font size="5" border="border">작성자코드**표시</font>&nbsp;&nbsp;&nbsp;&nbsp;
					<font size="1">${vo.regDate}</font>
				</td>
			</tr>
			<tr>
				<td>물품명 조인으로</td>
			</tr>
			
		</table> --%>
		
		<%-- <div>
			<h2 class="accordion-header" id="flush-headingOne">
		      <button class="accordion-button collapsed numCatch" data-num="${vo.replyNum}" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${vo.replyNum}" aria-controls="flush-collapse${vo.replyNum}" aria-expanded="false" >
				<!-- <i class="bi bi-award"></i> -->
				<strong>''</strong>
				<div class="title">${vo.title}</div>
		      </button>
		    </h2>
		</div> --%>
		<%-- <tr>
				<td>${vo.title}</td>
			</tr>
			<tr>
				<td height="100" colspan="1">${vo.contents}
					<c:forEach items="${vo.filesVOs}" var="f">
						<img alt="" width="175" height="250" src="../resources/upload/review/product/${f.fileName}" id="imgd">
					</c:forEach>
				</td>
			</tr> --%>
<%-- 	</c:forEach> --%>

	
	
	<div class="row my-4 position-relative">
		<div class="position-absolute top-0 start-50 translate-middle">
			<nav aria-label="Page navigation example">
			  <ul class="pagination">
			  
		    	<li class="page-item">
		    		<a class="page-link pager" aria-label="Previous" data-pn="${pager.pre?pager.startNum-1:0}" href="#">
				 		<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
			   
			    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			    	<li class="page-item"><a class="page-link pager" data-pn="${i}" href="#">${i}</a></li>
			    </c:forEach>

		    	<li class="page-item">
		    		<a class="page-link pager" href="#" data-pn="${pager.next?pager.lastNum+1:0}">
		    			<span aria-hidden="true">&raquo;</span>
		    		</a>
		    	</li>
			   
			  </ul>
			</nav>
		</div>
	</div>
	