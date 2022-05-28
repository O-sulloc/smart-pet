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
 <!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		         <h4 class="modal-title" id="myModalLabel">예약 상태 변경 </h4>
		      </div>
		      <div class="modal-body">
		
							<div class="form-check">
								<input class="form-check-input radio" type="radio"
									name="resState" id="flexRadioDefault1" value="1" checked> <label
									class="form-check-label" for="flexRadioDefault1"> 예약 승인  </label>
							</div>
							<div class="form-check">
								<input class="form-check-input radio" type="radio"
									name="resState" id="flexRadioDefault2" value="2"  > <label
									class="form-check-label" for="flexRadioDefault2"> 예약 거부 </label>
							</div>
		
							
		
			</div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary modalClose" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary modalSubmit">Save changes</button>
		      </div>
		    </div>
		  </div>
		</div>
	</div>

<!-- Modal 끝 -->
	</div><!-- 컨테이너 끝 -->
	
	</div><!-- col-md-auto -->
	
	
		<script type="text/javascript" src="../js/dayReservationList.js"></script>
</body>
</html>