<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	
	<div>
		<br><br><br><br><br>
		<strong>Q&A</strong>
	</div>
	
	<br>
	
	<div class="qna_button_wrap">
		<div class="add_reply_wrap">
			<button>상품 Q&A 작성하기</button>
		</div>
 		<c:if test="${not empty id}">
			<div class="my_qna_check sort" data-num="1"> <!-- 버튼들 css 는 notice_list.css에 정리 됨 -->
				<button>내 Q&A 보기</button>
			</div>
		</c:if>
		<c:if test="${empty id}">
			<div class="my_qna_check sort" data-num="2"> <!-- 버튼들 css 는 notice_list.css에 정리 됨 -->
				<button>내 Q&A 보기</button>
			</div>
		</c:if>
		<div class="total_qna_check sort"> <!-- 버튼들 css 는 notice_list.css에 정리 됨 -->
			<button>전체 Q&A 보기</button>
		</div> 
	</div>
	<hr>
	

	<div>
		<div class="box_top">
			<div class="box_top_in" style="text-align: center">답변상태</div>
			<div class="box_top_in" style="width: 800px; text-align: center">제목</div>
			<div class="box_top_in" style="text-align: center">작성자</div>
			<div class="box_top_in" style="text-align: center">작성일</div>
		</div>
		<%-- <textarea cols="50" rows="8"><c:out value="${content}" /></textarea> --%>

		<hr>
		
		<div class="listView"><!-- 여기서 덮어씌우는거로 호출해야함 -->
 			<c:import url="./qnaSort.jsp"></c:import>
 		</div> 
	</div>
	

		
	
 	
	
	
	