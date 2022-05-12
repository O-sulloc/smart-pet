<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	<input type="hidden" readonly="readonly" id="serNum"
		value="${vo.serNum}">
	<ul class="list-group">
		<li class="list-group-item">${vo.serName }</li>
		<li class="list-group-item">${vo.serTel }</li>
		<li class="list-group-item">${vo.serAddress }</li>
		<li class="list-group-item">${vo.serTime }</li>
		<li class="list-group-item">${vo.homepage }</li>
	</ul>



	<div class="order">
		<button type="button" class="btn btn-outline-success orderInfo_btn">예약</button>
				
				<!-- $(선택자).동작함수 -->
				<script>
					$(".orderInfo_btn").click(function () {
						$(".calendar").slideToggle();
					
					});
				</script>
			</div>

	<div class="calendar">
		<div class="header">
			<button class="calendar_btn" onclick="prevCal();">&lt;</button>
			<div class="title">
				<span class="year"></span><span class="month"></span>
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


	<script type="text/javascript" src="../js/calendar.js"></script>


</body>
</html>