<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="../resources/assets/images/favicon.svg" />
<c:import url="../temp/header_css.jsp"></c:import>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<c:import url="../temp/header_script.jsp"></c:import>

<!-- timepiki -->
<link rel='stylesheet' type='text/css' href='../css/timepicki.css' />
<script type='text/javascript' src='../js/timepicki.js'></script>
</head>



<body>

	<c:import url="../temp/header.jsp"></c:import>

	<div class="breadcrumbs overlay">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-8 offset-lg-2 col-md-12 col-12">
					<div class="breadcrumbs-content">
						<h1 class="page-title">Update Reservation Setting</h1>
					</div>
					<ul class="breadcrumb-nav">
						<li><a href="/">Home</a></li>
						<li>Update Reservation Setting</li>
					</ul>
				</div>
			</div>
		</div>
	</div>



	<!--영업시간 변수 저장  -->
	<c:forEach items="${time}" var="vo">
		<c:choose>
			<c:when test="${vo.timecase eq 0}">
				<!-- 평일  -->
				<c:set var="opentime1" value="${vo.openTime}" />
				<c:set var="closetime1" value="${vo.closeTime}" />
			</c:when>
			<c:when test="${vo.timecase eq 1}">
				<!-- 주말  -->
				<c:set var="opentime2" value="${vo.openTime}" />
				<c:set var="closetime2" value="${vo.closeTime}" />
			</c:when>
		</c:choose>
	</c:forEach>






	<div class="service-details">
		<div class="container">
			<div class="content">
				<div class="row">
					<!-- Start Of SideBar -->
					<c:import url="../service/sellerSidebar.jsp"></c:import>
					<!-- End Of SideBar -->

					<div class="col-lg-8 col-md-12 col-12">
						<section class="appointment page">
							<div class="container">

								<div class="row">
									<div class="appointment-form">
										<div class="row">
											<div class="col-12">
												<div class="appointment-title">
													<h2>예약 설정 수정</h2>
												</div>
											</div>
										</div>



										<form action="./updateReservationSetting" method="post">

											<fieldset>
												<!-- 		<legend>STUDENT</legend> -->
												<label class=label>휴무일 선택 </label>
												<div class="btn-group" role="group"
													aria-label="Basic checkbox toggle button group">
													<input type="checkbox" class="btn-check" id="btncheck1"
														autocomplete="off" name="holiday" value="월"
														<c:if test="${fn:contains(setting.holiday, '월')}">checked</c:if>>
													<label class="btn btn-outline-success" for="btncheck1">월요일</label>

													<input type="checkbox" class="btn-check" id="btncheck2"
														autocomplete="off" name="holiday" value="화"
														<c:if test="${fn:contains(setting.holiday, '화')}">checked</c:if>>
													<label class="btn btn-outline-success" for="btncheck2">화요일</label>

													<input type="checkbox" class="btn-check" id="btncheck3"
														autocomplete="off" name="holiday" value="수"
														<c:if test="${fn:contains(setting.holiday, '수')}">checked</c:if>>
													<label class="btn btn-outline-success" for="btncheck3">수요일</label>

													<input type="checkbox" class="btn-check" id="btncheck4"
														autocomplete="off" name="holiday" value="목"
														<c:if test="${fn:contains(setting.holiday, '목')}">checked</c:if>>
													<label class="btn btn-outline-success" for="btncheck4">목요일</label>

													<input type="checkbox" class="btn-check" id="btncheck5"
														autocomplete="off" name="holiday" value="금"
														<c:if test="${fn:contains(setting.holiday, '금')}">checked</c:if>>
													<label class="btn btn-outline-success" for="btncheck5">금요일</label>

													<input type="checkbox" class="btn-check" id="btncheck6"
														autocomplete="off" name="holiday" value="토"
														<c:if test="${fn:contains(setting.holiday, '토')}">checked</c:if>>
													<label class="btn btn-outline-success" for="btncheck6">토요일</label>

													<input type="checkbox" class="btn-check" id="btncheck7"
														autocomplete="off" name="holiday" value="일"
														<c:if test="${fn:contains(setting.holiday, '일')}">checked</c:if>>
													<label class="btn btn-outline-success" for="btncheck7">일요일</label>


												</div>
											</fieldset>
											<hr>

											<fieldset>
												<label class=label>예약 시간 단위 </label> <select
													class="form-select" id="selbox"
													aria-label="Default select example" name="term">
													<option selected>예약 시간 단위</option>

													<option value="60"
														<c:if test="${setting.term eq 60}">selected</c:if>>1시간</option>
													<option value="30"
														<c:if test="${setting.term eq 30}">selected</c:if>>30분</option>
													<option value="15"
														<c:if test="${setting.term eq 15}">selected</c:if>>15분</option>
													<%-- <option value="direct"<c:if test="${setting.term not eq 60&&setting.term not eq 30&&setting.term not eq 15}">selected</c:if>>직접입력(분단위로 숫자를 입력해주세요)</option><input type="number" id="selboxDirect" name="selboxDirect" <c:if  test="${setting.term not eq 60||30||15}">value="${setting.term}"</c:if> />
				 --%>
												</select>


											<label class=label>예약 시간 당 수용인원</label>
											<select class="form-select" id="selbox"
												aria-label="Default select example" name="capacity">
												<option selected>수용인원</option>
												<option value="1"
													<c:if test="${setting.capacity eq 1}">selected</c:if>>1명</option>
												<option value="2"
													<c:if test="${setting.capacity eq 2}">selected</c:if>>2명</option>
												<option value="3"
													<c:if test="${setting.capacity eq 3}">selected</c:if>>3명</option>
												<option value="4"
													<c:if test="${setting.capacity eq 4}">selected</c:if>>4명</option>
												<option value="5"
													<c:if test="${setting.capacity eq 5}">selected</c:if>>5명</option>
											</select>
											</fieldset>
											<hr>


										<fieldset>	
										<legend>점심시간</legend> 
										<label class=label>점심 시간 시작</label>
											<input id='timepicker5' type='text' name='startBreaktime'
												value="${setting.startBreaktime.substring(0,5)}" />
										<label class=label>점심 시간 끝</label>
											<input id='timepicker6' type='text' name='endBreaktime'
												value="${setting.endBreaktime.substring(0,5)}" />
											<hr>
										</fieldset>
										
										<fieldset>
										<legend>평일</legend> 
											<label class=label>첫 예약 시간</label>
											<input id='timepicker1' type='text' name='times'
												value="${opentime1.substring(0,5)}">

											<label class=label>마지막 예약 시간</label>
											<input id='timepicker2' type='text' name='times'
												value="${closetime1.substring(0,5)}" />
											<hr>
										</fieldset>
										
										<fieldset>
											<legend>주말</legend>
											<label class=label>첫 예약 시간</label>
											<input id='timepicker3' type='text' name='times'
												value="${opentime2.substring(0,5)}" />

											<label class=label>마지막 예약 시간</label>
											<input id='timepicker4' type='text' name='times'
												value="${closetime2.substring(0,5)}" />

											<hr>
										</fieldset>
										<div class="col-lg-6 col-md-6 col-12 p-0">
										<div class="appointment-btn button">
											<button type="submit" class="btn-success btn-sm">수정</button>
										</div>
										</div>
										</form>
									</div>
								</div>
							</div>

						</section>
					</div>
				</div>
			</div>
</div>
</div>










			<script type="text/javascript" src="../js/reservationSetting.js"></script>
</body>
</html>