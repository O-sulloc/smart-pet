<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Resevation Setting page</title>

<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
			href="../resources/assets/images/favicon.svg" />
<c:import url="../temp/header_css.jsp"></c:import>
<c:import url="../temp/header_script.jsp"></c:import>

<!-- datetimepicker -->
<link rel="stylesheet" type="text/css" href="../css/jquery.datetimepicker.css" >
<script src="../js/jquery.datetimepicker.full.min.js"></script>
<!-- timepiki -->
<link rel='stylesheet' type='text/css'href='../css/timepicki.css'/>
<script type='text/javascript'src='../js/timepicki.js'></script>

</head>



<body>
	<c:import url="../temp/header.jsp"></c:import>

	<div class="breadcrumbs overlay">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-8 offset-lg-2 col-md-12 col-12">
					<div class="breadcrumbs-content">
						<h1 class="page-title">Reservation Setting </h1>
					</div>
					<ul class="breadcrumb-nav">
						<li><a href="/">Home</a></li>
						<li>Reservation Setting</li>
					</ul>
				</div>
			</div>
		</div>
	</div>


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
													<h2>예약 설정</h2>
												</div>
											</div>
										</div>
							
								
							<form action="./reservationSetting" method="post" >
							
							<!-- <input id="datetimepicker" type="text" > -->
							
							
							<fieldset>
					<!-- 		<legend>STUDENT</legend> -->
           					 <label class=label>휴무일 선택 </label>
								<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
								  <input type="checkbox" class="btn-check" id="btncheck1" autocomplete="off" name="holiday" value="월">
								  <label class="btn btn-outline-success" for="btncheck1">월요일</label>
								
								  <input type="checkbox" class="btn-check" id="btncheck2" autocomplete="off" name="holiday" value="화">
								  <label class="btn btn-outline-success" for="btncheck2">화요일</label>
								
								  <input type="checkbox" class="btn-check" id="btncheck3" autocomplete="off" name="holiday" value="수">
								  <label class="btn btn-outline-success" for="btncheck3">수요일</label>
								  
								  	  <input type="checkbox" class="btn-check" id="btncheck4" autocomplete="off" name="holiday" value="목">
								  <label class="btn btn-outline-success" for="btncheck4">목요일</label>
								  
								  	  <input type="checkbox" class="btn-check" id="btncheck5" autocomplete="off" name="holiday" value="금">
								  <label class="btn btn-outline-success" for="btncheck5">금요일</label>
								  
								  	  <input type="checkbox" class="btn-check" id="btncheck6" autocomplete="off" name="holiday" value="토">
								  <label class="btn btn-outline-success" for="btncheck6">토요일</label>
								  
								  	  <input type="checkbox" class="btn-check" id="btncheck7" autocomplete="off"  name="holiday"  value="일" checked>
								  <label class="btn btn-outline-success" for="btncheck7" >일요일</label>
								</div>
								</fieldset>
								<hr>
								
							<fieldset>
           					 <label class=label>예약 시간 단위 </label>
								<select class="form-select" id="termSelbox" aria-label="Default select example" name="term">
								  <option selected>예약 시간 단위</option>
								  <option value="60">1시간</option>
								  <option value="30">30분</option>
								  <option value="15">15분</option>
								  <!-- <option value="direct">직접입력(분단위로 숫자를 입력해주세요)</option><input type="number" id="selboxDirect" name="selboxDirect"/>
							 -->	</select>
							 
								<label class=label>예약 시간 당 수용인원</label>
								<select class="form-select" id="capacitySelbox" aria-label="Default select example" name="capacity">
								  <option selected>수용인원</option>
								  <option value="1">1명</option>
								  <option value="2">2명</option>
								  <option value="3">3명</option>
								  <option value="4">4명</option>
								  <option value="5">5명</option>
								 </select>
								<hr>
								</fieldset>
								
							<fieldset>
							<legend>점심시간</legend> 
           					 <label class=label>점심 시간 시작</label>
								<input id='timepicker5' type='text' name='startBreaktime'/>
							<label class=label>점심 시간 끝</label>
								<input id='timepicker6' type='text' name='endBreaktime'/>
								<hr>
								</fieldset>
								
							<fieldset>
							<legend>평일</legend> 
           					    <label class=label>첫 예약 시간</label>
								<input id='timepicker1' type='text'name='times'/>
								
								<label class=label>마지막 예약 시간</label>
								<input id='timepicker2' type='text'name='times'/>
								<hr>
							</fieldset>	
							
							
							
							<fieldset>
							<legend>주말</legend> 
           					    <label class=label>첫 예약 시간</label>
								<input id='timepicker3' type='text'name='times'/>
								
							   <label class=label>마지막 예약 시간</label>
								<input id='timepicker4' type='text'name='times'/>
								<hr>
							</fieldset>
							<div class="appointment-btn button">
								<button type="button" class= "btn-success btn-sm subBtn">설정 </button>
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