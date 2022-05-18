<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../temp/header_css.jsp"></c:import>
<c:import url="../temp/header_script.jsp"></c:import>
<!-- datetimepicker -->
<link rel="stylesheet" type="text/css" href="../css/jquery.datetimepicker.css" >
<script src="../js/jquery.datetimepicker.full.min.js"></script>
<!-- timepiki -->
<link rel='stylesheet' type='text/css'href='../css/timepicki.css'/>
<script type='text/javascript'src='../js/timepicki.js'></script>


<title>Insert title here</title>
</head>
<body>
<h1> 예약시간/날짜 설정 페이지 </h1>
<form action="./reservationSetting" method="post">

<input id="datetimepicker" type="text" >

	<h5> 휴무일 </h5>
	<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
	  <input type="checkbox" class="btn-check" id="btncheck1" autocomplete="off" name="holiday" value="월">
	  <label class="btn btn-outline-primary" for="btncheck1">월요일</label>
	
	  <input type="checkbox" class="btn-check" id="btncheck2" autocomplete="off" name="holiday" value="화">
	  <label class="btn btn-outline-primary" for="btncheck2">화요일</label>
	
	  <input type="checkbox" class="btn-check" id="btncheck3" autocomplete="off" name="holiday" value="수">
	  <label class="btn btn-outline-primary" for="btncheck3">수요일</label>
	  
	  	  <input type="checkbox" class="btn-check" id="btncheck4" autocomplete="off" name="holiday" value="목">
	  <label class="btn btn-outline-primary" for="btncheck4">목요일</label>
	  
	  	  <input type="checkbox" class="btn-check" id="btncheck5" autocomplete="off" name="holiday" value="금">
	  <label class="btn btn-outline-primary" for="btncheck5">금요일</label>
	  
	  	  <input type="checkbox" class="btn-check" id="btncheck6" autocomplete="off" name="holiday" value="토">
	  <label class="btn btn-outline-primary" for="btncheck6">토요일</label>
	  
	  	  <input type="checkbox" class="btn-check" id="btncheck7" autocomplete="off"  name="holiday"  value="일" checked>
	  <label class="btn btn-outline-primary" for="btncheck7" >일요일</label>
	</div>
	
	<h5> 예약시간 단위</h5>
	<select class="form-select" id="selbox" aria-label="Default select example" name="term">
	  <option selected>예약 시간 단위</option>
	  <option value="60">1시간</option>
	  <option value="30">30분</option>
	  <option value="15">15분</option>
	  <option value="direct">직접입력(분단위로 숫자를 입력해주세요)</option><input type="number" id="selboxDirect" name="selboxDirect"/>
	</select>
	
	<h5> 예약 시간 당 수용인원</h5>
	<select class="form-select" id="selbox" aria-label="Default select example" name="capacity">
	  <option selected>수용인원</option>
	  <option value="1">1명</option>
	  <option value="2">2명</option>
	  <option value="3">3명</option>
	  <option value="4">4명</option>
	  <option value="5">5명</option>
	 </select>
	<hr>
	
	
	<h4> 점심시간</h4>
	<h5> 점심시간 시작 </h5>
	<input id='timepicker5' type='text'name='startBreaktime'/>
	<h5> 점심시간 끝  </h5>
	<input id='timepicker6' type='text'name='endBreaktime'/>
	<hr>
	<h4> 평일</h4>
	<h5> 오픈시간 </h5>
	<input id='timepicker1' type='text'name='times'/>
	
	<h5> 마감시간</h5>
	<input id='timepicker2' type='text'name='times'/>
	<hr>
	
	<h4> 주말</h4>
	<h5> 오픈시간</h5>
	<input id='timepicker3' type='text'name='times'/>
	
	<h5> 마감시간</h5>
	<input id='timepicker4' type='text'name='times'/>
	<hr>
	
	<button type="submit">설정 </button>
</form>

<script type="text/javascript" src="../js/reservationSetting.js"></script>
</body>
</html>