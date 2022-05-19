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



 	<!-- class="table table-dark table-striped" -->
	<table width="700" class="reviewTable">
		<c:forEach items="${list}" var="vo">
			<tr>
				<td rowspan="4" width="100">작성자사진</td>
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
			<tr>
				<td height="100" colspan="2">${vo.contents}</td>
			</tr>
		</c:forEach>
		
	</table>

	
	
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
	