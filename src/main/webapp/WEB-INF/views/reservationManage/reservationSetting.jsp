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
<form action="">

<input id="datetimepicker" type="text" >

	<h5> 휴무일 </h5>
	<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
	  <input type="checkbox" class="btn-check" id="btncheck1" autocomplete="off">
	  <label class="btn btn-outline-primary" for="btncheck1">월요일</label>
	
	  <input type="checkbox" class="btn-check" id="btncheck2" autocomplete="off">
	  <label class="btn btn-outline-primary" for="btncheck2">화요일</label>
	
	  <input type="checkbox" class="btn-check" id="btncheck3" autocomplete="off">
	  <label class="btn btn-outline-primary" for="btncheck3">수요일</label>
	  
	  	  <input type="checkbox" class="btn-check" id="btncheck4" autocomplete="off">
	  <label class="btn btn-outline-primary" for="btncheck4">목요일</label>
	  
	  	  <input type="checkbox" class="btn-check" id="btncheck5" autocomplete="off">
	  <label class="btn btn-outline-primary" for="btncheck5">금요일</label>
	  
	  	  <input type="checkbox" class="btn-check" id="btncheck6" autocomplete="off">
	  <label class="btn btn-outline-primary" for="btncheck6">토요일</label>
	  
	  	  <input type="checkbox" class="btn-check" id="btncheck7" autocomplete="off" checked>
	  <label class="btn btn-outline-primary" for="btncheck7" >일요일</label>
	</div>
	
	<h5> 예약시간 단위</h5>
	<select class="form-select" id="selbox" aria-label="Default select example">
	  <option selected>예약 시간 단위</option>
	  <option value="60">1시간</option>
	  <option value="30">30분</option>
	  <option value="15">15분</option>
	  <option value="direct">직접입력(분단위로 숫자를 입력해주세요)</option><input type="number" id="selboxDirect" name="selboxDirect"/>
	</select>
	
	
	<h5> 첫 예약 시간 </h5>
	<input id='timepicker1' type='text'name='timepicker'/>
	
	<h5> 마지막 예약 시간 </h5>
	<input id='timepicker2' type='text'name='timepicker1'/>
	
	<h5> 점심시간 시작 </h5>
	<input id='timepicker3' type='text'name='timepicker2'/>
	
	<h5> 점심시간 끝  </h5>
	<input id='timepicker4' type='text'name='timepicker3'/>
	
</form>

<script type="text/javascript" src="../js/reservationSetting.js"></script>
</body>
</html>