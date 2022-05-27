<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- split -->
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:import url="../temp/header_css.jsp"></c:import>
<link href="../css/calendar.css" rel="stylesheet">
<c:import url="../temp/header_script.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>

	<!-- 이미지 보여주기 -->
	<c:choose>
	<c:when test="${not empty serviceVO.serviceFileVO.fileName}">
		<div class="card">
			    
				<ul class="list-group list-group-flush">
				   	<li class="list-group-item">
				   		<h5>대표이미지</h5>
				   		<img alt="" src="../resources/upload/service/${serviceVO.serviceFileVO.fileName}">
				   	</li>
				</ul>
		</div>
		</c:when>
	</c:choose>

	<input type="hidden" readonly="readonly" id="serNum"
		data-sn="${seviceVO.serNum}">
	<ul class="list-group">
		<li class="list-group-item">${seviceVO.serName }</li>
		<li class="list-group-item">${seviceVO.serTel }</li>
		<li class="list-group-item">${seviceVO.serAddress }</li>
		<li class="list-group-item">${seviceVO.serTime }</li>
		<li class="list-group-item">${seviceVO.homepage }</li>
	</ul>

	<input type="hidden" id="term" value="${settingVO.term}">
	<input type="hidden" id="capacity" value="${settingVO.capacity}">
	<input type="hidden" id="holiday" value="${settingVO.holiday}">
	<input type="hidden" id="startBreaktime" value="${settingVO.startBreaktime}">
	<input type="hidden" id="endBreaktime" value="${settingVO.endBreaktime}">




<hr>
<c:forEach items="${settingVO.reservationTimeVO}" var="vo">
	<c:choose>
		<c:when test="${vo.timecase eq 0}"> <!-- 평일 -->
			<%-- <c:set var="openTime0" value="${vo.openTime}"></c:set> --%>
			<%-- <c:set var="closeTime0" value="${vo.closeTime}"></c:set> --%>
			<input type="hidden" id="openTime0" value="${vo.openTime}">
			<input type="hidden" id="closeTime0" value="${vo.closeTime}">
		</c:when>
		<c:otherwise> <!-- 주말 -->
		<input type="hidden" id="openTime1" value="${vo.openTime}">
			<%-- <c:set var="openTime1" value="${vo.openTime}"></c:set> --%>
			<%-- <c:set var="closeTime1" value="${vo.closeTime}"></c:set> --%>
			<input type="hidden" id="openTime1" value="${vo.openTime}">
			<input type="hidden" id="closeTime1" value="${vo.closeTime}">
			
		</c:otherwise>
	</c:choose>
</c:forEach>




	<div class="order">
		<button type="button" class="btn btn-outline-success dateInfo_btn">예약날짜
			확인</button>


	</div>

	<div class="container my-4">
		<div class="calendar">
			<div class="header">
				<button class="calendar_btn" onclick="prevCal();">&lt;</button>
				<div class="title">
					<span class="year"></span> <span class="month"></span>
				</div>
				<button class="calendar_btn" onclick="nextCal();">&gt;</button>
			</div>
			<div class="day">
				<div>일</div>
				<div>월</div>
				<div>화</div>
				<div>수</div>
				<div>목</div>
				<div>금</div>
				<div>토</div>
			</div>


			<div class="dates"></div>
			
		</div>
	</div>

	
	<form action="../reservation/confirm" method="post">
		<!-- js로 시간 받아옴 -->
		<div class="container my-4" id="buttons">
		</div>
	
		
	
		
		<!-- <input type="time" value="09:00" min="09:00" max="18:00"> -->
		
	
		<div class="inputArea">
					<input type="hidden" name="serNum" value="${seviceVO.serNum }">
					<label for="">예약메모</label>
					<input type="text" name="resMemo" id="resMemo">
					<input type="hidden" name="resDate" value="" id="resDate">
					<input type="hidden" name="resTime" value="" id="resTime">
					<input type="hidden" name="resState" value="0">
					<button type="submit" class="btn btn-outline-success" id="res_btn">예약진행</button>
		</div>
	</form>
				
	
	
	
	<script type="text/javascript" src="../js/detail.js"></script>
	<script type="text/javascript" src="../js/calendar.js"></script>
	<script type="text/javascript" src="../js/reservation.js"></script>



</body>
</html>