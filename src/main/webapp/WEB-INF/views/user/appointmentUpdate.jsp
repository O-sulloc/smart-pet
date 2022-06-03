<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	<div class="container mt-4">
		<div class="row mt-4">
			<div class="alert alert-primary" role="alert">
				<h4 class="text-center" style="text-transform: uppercase;">예약변경</h4>
			</div>
		</div>

		<ul class="list-group">
			<li class="list-group-item">${vo.serviceVO.serName }</li>
			<li class="list-group-item">${vo.serviceVO.serTel }</li>
			<li class="list-group-item">${vo.serviceVO.serAddress }</li>
			<li class="list-group-item">${vo.serviceVO.serTime }</li>
		</ul>


		<input type="hidden" id="term" value="${settingVO.term}"> 
		<input type="hidden" id="capacity" value="${settingVO.capacity}"> 
		<input type="hidden" id="holiday" value="${settingVO.holiday}">
		<input type="hidden" id="startBreaktime" value="${settingVO.startBreaktime}">
		<input type="hidden" id="endBreaktime" value="${settingVO.endBreaktime}">
			



		<hr>
		<c:forEach items="${settingVO.reservationTimeVO}" var="vo">
			<c:choose>
				<c:when test="${vo.timecase eq 0}">
					<!-- 평일 -->
					<%-- <c:set var="openTime0" value="${vo.openTime}"></c:set> --%>
					<%-- <c:set var="closeTime0" value="${vo.closeTime}"></c:set> --%>
					<input type="hidden" id="openTime0" value="${vo.openTime}">
					<input type="hidden" id="closeTime0" value="${vo.closeTime}">
				</c:when>
				<c:otherwise>
					<!-- 주말 -->
					<input type="hidden" id="openTime1" value="${vo.openTime}">
					<%-- <c:set var="openTime1" value="${vo.openTime}"></c:set> --%>
					<%-- <c:set var="closeTime1" value="${vo.closeTime}"></c:set> --%>
					<input type="hidden" id="openTime1" value="${vo.openTime}">
					<input type="hidden" id="closeTime1" value="${vo.closeTime}">

				</c:otherwise>
			</c:choose>
		</c:forEach>




		<div class="order">
			<div class="row mt-4">
				<div class="alert alert-primary" role="alert">
					<h4 class="text-center" style="text-transform: uppercase;">변경
						전 예약 정보</h4>
				</div>
			</div>


			<div class="row mt-4">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>예약자</th>
							<th>예약자 연락처</th>
							<th>예약일</th>
							<th>예약시간</th>
							<th>예약상태</th>
						</tr>
					</thead>
					<tbody>

						<tr>
							<td>${sessionScope.user.name}</td>
							<td>${sessionScope.user.phone}</td>
							<td>${vo.resDate}</td>
							<td><c:set var="time" value="${vo.resTime}" />
								${fn:split(time,':')[0]}시 ${fn:split(time,':')[1]}분</td>
							<td><span> <c:choose>
										<c:when test="${vo.resState==0}">
											<span>예약진행중</span>
										</c:when>
										<c:when test="${vo.resState==1}">
											<span>예약완료</span><</c:when>
										<c:when test="${vo.resState==2}">
											<span>예약실패</span><</c:when>
										<c:when test="${vo.resState==3}">
											<span>방문완료</span> <</c:when>
									</c:choose>
							</span></td>

						</tr>
					</tbody>

				</table>

			</div>
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


		<form action="appointmentUpdate" method="post">
			<!-- js로 시간 받아옴 -->

			<!-- 평일  -->
			<div class="container my-4" id="buttons"></div>

			<!-- 주말  -->
			<div class="container my-4" id="buttons2"></div>




			<!-- <input type="time" value="09:00" min="09:00" max="18:00"> -->


			<input type="hidden" readonly="readonly" name="resNum" value="${vo.resNum}">
				<input type="hidden" readonly="readonly" name="serName" value="${vo.serviceVO.serName}">
				<input type="hidden" readonly="readonly" name="serTel" value="${vo.serviceVO.serTel}">
				<input type="hidden" readonly="readonly" name="serAddress" value="${vo.serviceVO.serAddress}">
				<input type="hidden" readonly="readonly" name="serTime" value="${vo.serviceVO.serTime}">
				<input type="hidden" readonly="readonly" name="homepage" value="${vo.serviceVO.homepage}">
		
				<input type="hidden" name="serNum" value="${seviceVO.serNum }">
				<label for="">예약메모</label> <input type="text" name="resMemo" id="resMemo" value="${vo.resMemo }">
				<input type="hidden" name="resDate" value="${vo.resDate}" id="resDate"> 
				<input type="hidden" name="resTime" value="${vo.resTime}" id="resTime"> 
				<input type="hidden" name="resState" value="0">
				<button type="submit" class="btn btn-outline-success res_update" >예약수정</button>
			</div>
		</form>
		
		<!-- 예약 삭제 버튼 -->
		<div>
			<a class="btn btn-danger res_delete"
				href="./appointmentDelete?resNum=${vo.resNum}" role="button">예약취소</a>
		</div>



		<script type="text/javascript" src="../js/detail.js"></script>
		<script type="text/javascript" src="../js/calendar.js"></script>
		<script type="text/javascript" src="../js/reservation.js"></script>




		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous"></script>
</body>
</html>