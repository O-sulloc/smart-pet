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
	
	<ul class="list-group">
		<li class="list-group-item">${vo.serName }</li>
		<li class="list-group-item">${vo.serTel }</li>
		<li class="list-group-item">${vo.serAddress }</li>
		<li class="list-group-item">${vo.serTime }</li>
		<li class="list-group-item">${vo.homepage }</li>
	</ul>



	<div class="order">
		<button type="button" class="btn btn-outline-success dateInfo_btn">예약날짜
			확인</button>

		<!-- $(선택자).동작함수 -->
		<script>
			$(".dateInfo_btn").click(function() {
				$(".calendar").slideToggle();

			});
		</script>
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
	<!-- <input type="time" value="09:00" min="09:00" max="18:00"> -->
	<div class="container my-4">
		<input type="button" name="resTime" class="btn btn-outline-primary" value="09:00">09:00</input>
		<button type="button" name="resTime" class="btn btn-outline-primary">09:30</button>
		<button type="button" name="resTime" class="btn btn-outline-primary">10:00</button>
		<button type="button" class="btn btn-outline-primary">10:30</button>
		<button type="button" class="btn btn-outline-primary">11:00</button>
		<button type="button" class="btn btn-outline-primary">11:30</button>
		<div>
			<button type="button" class="btn btn-outline-primary">13:00</button>
			<button type="button" class="btn btn-outline-primary">13:30</button>
			<button type="button" class="btn btn-outline-primary">14:00</button>
			<button type="button" class="btn btn-outline-primary">14:30</button>
			<button type="button" class="btn btn-outline-primary">15:00</button>
			<button type="button" class="btn btn-outline-primary">15:30</button>
		</div>
		<div class="input-group">
  	<input type="text" aria-label="First name" class="form-control" name="resTime" value="9:00" readonly="readonly"> 
 	<input type="text" aria-label="Last name" class="form-control">
</div>
	</div>
	<div class="inputArea">
		<form action="../reservation/confirm" method="post">
				<input type="hidden" name="serNum" value="${vo.serNum }">
				<label for="">배송메모</label>
				<input type="text" name="resMemo" id="resMemo">
				<input type="hidden" name="resDate" value="" id="resDate">
				<input type="hidden" name="resTime" value="9:00" id="resTime">
				<input type="hidden" name="resState" value="0">
				<button type="submit" class="btn btn-outline-success res_btn">예약진행</button>
		</form>
	</div>
				
	
	<script>
		 $(".res_btn").click(function(){
			
			let confirm_val=confirm("예약하시겠습니까?");
			
	
			
		}) 
	</script>
	
	<script type="text/javascript" src="../js/calendar.js"></script>
	<script type="text/javascript" src="../js/reservation.js"></script>


</body>
</html>