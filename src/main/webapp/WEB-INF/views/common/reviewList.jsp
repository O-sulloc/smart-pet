<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- 
	<div class="star-ratings">
		<div class="star-ratings-fill space-x-2 text-lg" style="width: 5.5%;">이제는 11퍼가됐네?
			<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
		</div>
		<div class="star-ratings-base space-x-2 text-lg">
			<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
		</div>
	</div>

 -->
	<hr>
	<div>
		<strong>상품리뷰</strong>
	</div>
	<hr>
	
	<div class="parent" style="height: 150px; background: #fbfbfb;">
	    <div class="child">
			<strong>사용자 총 평점</strong>
			<div class="star-ratings">
				<div class="star-ratings-fill space-x-2 text-lg" style="width: calc(${starAvg}*20%);">
					<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
				</div>
				<div class="star-ratings-base space-x-2 text-lg">
					<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
				</div>
			</div>
			<div>
				<span>${starAvg} / 5</span>
			</div>
	    </div>
	    <div class="child">
			<strong>전체 리뷰수</strong>
			<div>
				<span><i class="bi bi-chat-square-text-fill"></i></span>
			</div>
			<div>
				<span>${total}</span>
			</div>
	    </div>
	    <div class="child">
			<strong>평점 비율</strong>
				<ul>
					<c:forEach items="${starCount}" var="entry">  
						<li>
							<div class="star-ratings">
								<%-- <div class="star-ratings-fill space-x-2 text-lg" style="height: calc(100%-${entry.value}%);"> --%>
								<div class="star-ratings-fill space-x-2 text-lg" style="height: calc(100% - ${entry.value}*1%);">
									<span><img alt="" width="8px" height="60px" src="/resources/image/empty.png"></span>
								</div>
								<div class="star-ratings-base space-x-2 text-lg">
									<span><img alt="" width="8px" height="60px" src="/resources/image/red.png"></span>
								</div>
							</div>
							<c:choose>
								<c:when test="${entry.key == 'A'}">
									<span>5점</span>
								</c:when>
								<c:when test="${entry.key == 'B'}">
									<span>4점</span>
								</c:when>
								<c:when test="${entry.key == 'C'}">
									<span>3점</span>
								</c:when>
								<c:when test="${entry.key == 'D'}">
									<span>2점</span>
								</c:when>
								<c:otherwise>
									<span>1점</span>
								</c:otherwise>
							</c:choose>
						</li>
					</c:forEach> 
				</ul>
	    </div>
	</div>
	
	<hr>
	

	<div class="container">
		<div class="card-group container" id="items"></div>
		<div class="container">
			<strong>리뷰 ${total}건</strong>
			<button class="btn btn-danger mt-3 sort" data-num="1">최신순</button>
			<button class="btn btn-danger mt-3 sort" data-num="2">높은순</button>
			<button class="btn btn-danger mt-3 sort" data-num="3">낮은순</button>
			<!-- <button class="btn btn-danger mt-3 sort" data-num="4">원래대로</button> 일단 뺄것 어차피 최신순정렬 -->
		</div>
		<hr>
		
	
	 	<div class="listView"><!-- 여기서 덮어씌우는거로 호출해야함 -->
	 		<c:import url="./reviewSort.jsp"></c:import>
	 	
	 	</div>
			
		
	</div>