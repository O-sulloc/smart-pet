<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<c:import url="../temp/header_css.jsp"></c:import>
<c:import url="../temp/header_script.jsp"></c:import>
<link href="../css/calendar.css" rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet">
<link href="../css/styles.css" rel="stylesheet">
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	<div class="container">
			<h1>날짜별 </h1>
		<!-- side bar import-->
		<c:import url="../service/sellerSidebar.jsp"></c:import>
 
 <div class="col-md-auto">
 <!--달력 -->
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
		</div><!-- 달력 끝 -->
 		
 		<div id="list"></div>
 
	</div><!-- 컨테이너 끝 -->
	
	</div><!-- col-md-auto -->
		<script type="text/javascript" src="../js/dayReservationList.js"></script>
</body>
</html>