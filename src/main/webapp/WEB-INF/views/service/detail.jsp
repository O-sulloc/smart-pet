<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- split -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:import url="../temp/header_css.jsp"></c:import>
<link href="../css/calendar.css" rel="stylesheet">
<link href="../resources/css/serviceDetail.css" rel="stylesheet">
<c:import url="../temp/header_script.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	<div class="breadcrumbs overlay">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-8 offset-lg-2 col-md-12 col-12">
					<div class="breadcrumbs-content">
						<h1 class="page-title">Reservation</h1>
					</div>
					<ul class="breadcrumb-nav">
						<li><a href="/">Home</a></li>
						<li>Reservation</li>
					</ul>
				</div>
			</div>
		</div>
	</div>


	<!-- 이미지 보여주기 -->
	<c:choose>
		<c:when test="${not empty file}">
			<div class="card">

				<ul class="list-group list-group-flush">
					<li class="list-group-item"><input type="hidden"
						readonly="readonly" id="serNum" data-sn="${seviceVO.serNum}">
						<!-- <h5>대표이미지</h5> --> <img alt="대표이미지" width="500px"
						height="550px" src="../resources/upload/service/${file}"></li>
				</ul>
			</div>
		</c:when>
	</c:choose>

	<ul class="list-group">
		<li class="list-group-item">${seviceVO.serName }</li>
		<li class="list-group-item">${seviceVO.serTel }</li>
		<li class="list-group-item">${seviceVO.serAddress }</li>
		<li class="list-group-item"><i class="lni lni-timer"></i>${seviceVO.serTime }</li>
		<c:choose>
			<c:when test="${not empty seviceVO.hospitalField}">
				<li class="list-group-item">${seviceVO.hospitalField}</li>
			</c:when>
		</c:choose>
		<li><a class="link-success text-decoration-none list-group-item"
			id="homepage" target="_blank" href="https://${seviceVO.homepage}">${seviceVO.homepage }</a></li>
	</ul>


	<input type="hidden" id="term" value="${settingVO.term}">
	<input type="hidden" id="capacity" value="${settingVO.capacity}">
	<input type="hidden" id="holiday" value="${settingVO.holiday}">
	<input type="hidden" id="startBreaktime"
		value="${settingVO.startBreaktime}">
	<input type="hidden" id="endBreaktime"
		value="${settingVO.endBreaktime}">





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


	<form action="../reservation/confirm" method="post" id="frm">
		<!-- js로 시간 받아옴 -->

		<!-- 평일  -->
		<div class="container my-4" id="buttons"></div>

		<!-- 주말  -->
		<div class="container my-4" id="buttons2"></div>




		<!-- <input type="time" value="09:00" min="09:00" max="18:00"> -->


		<section class="appointment page section">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 offset-lg-2 col-md-12 col-12">

						<div class="appointment-form">
							<div class="row">
								<div class="col-12">
									<div class="appointment-title">
										<h2>Book An Appointment</h2>
										<p>Please feel welcome to contact our friendly reception
											staff with any general or medical enquiry. Our doctors will
											receive or return any urgent calls.</p>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-6 col-md-6 col-12 p-0">
									<div class="appointment-input">
										<label for="name"><i class="lni lni-user"></i></label> <input
											type="text" name="name" id="name" placeholder="Your Name">
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-12 p-0">
									<div class="appointment-input">
										<label for="email"><i class="lni lni-envelope"></i></label> <input
											type="email" name="email" id="email" placeholder="Your Email">
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-12 p-0">
									<div class="appointment-input">
										<label for="number"><i class="lni lni-phone-set"></i></label>
										<input type="text" name="number" id="number"
											placeholder="Phone Number">
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-12 p-0">
									<div class="appointment-input">
										<label for="department"><i class="lni lni-notepad"></i></label>
										<select name="department" id="department">
											<option value="none" selected disabled>Department</option>
											<option value="none">General Surgery</option>
											<option value="none">Gastroenterology</option>
											<option value="none">Nutrition & Dietetics</option>
											<option value="none">Cardiology</option>
											<option value="none">Neurology</option>
											<option value="none">Pediatric</option>
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-12 p-0">
									<div class="appointment-input">
										<label for="doctor"><i class="lni lni-sthethoscope"></i></label>
										<select name="doctor" id="doctor">
											<option value="none" selected disabled>Doctor</option>
											<option value="none">Dr.Felica Queen</option>
											<option value="none">Dr.Alice Williams</option>
											<option value="none">Dr.Michael Bean</option>
											<option value="none">Dr.Harry Russell</option>
											<option value="none">Dr.Mellissa Doe</option>
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-12 p-0">
									<div class="appointment-input">
										<label for="date"><i class="lni lni-user"></i></label> <input
											type="date" name="date" id="date">
									</div>
								</div>
								<div class="col-12 p-0">
									<div class="appointment-input">
										<textarea placeholder="Write Your Message Here....."></textarea>
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-12 p-0">
									<div class="appointment-btn button">
										<button class="btn">Get Appointment</button>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</section>
	</form>




	<!--    <script type="text/javascript" src="../js/detail.js"></script> -->
	<script type="text/javascript" src="../js/calendar.js"></script>
	<script type="text/javascript" src="../js/reservation.js"></script>

	<!-- jquery -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<c:import url="../temp/header_script.jsp"></c:import>
	<c:import url="../temp/footer.jsp"></c:import>

</body>
</html>