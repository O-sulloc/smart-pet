<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../temp/header_css.jsp"></c:import>
<c:import url="../temp/header_script.jsp"></c:import>
<!-- timepiki -->
<link rel='stylesheet' type='text/css'href='../css/timepicki.css'/>
<script type='text/javascript'src='../js/timepicki.js'></script>
<title>Insert title here</title>
</head>
<body>


<!--영업시간 변수 저장  -->
<c:forEach items="${time}" var="vo">
	<c:choose>
		<c:when test="${vo.timecase eq 0}"> <!-- 평일  -->
			<c:set var="opentime1" value="${vo.openTime}"/>
			<c:set var="closetime1" value="${vo.closeTime}"/>
		</c:when>
		<c:when test="${vo.timecase eq 1}"> <!-- 주말  -->
			<c:set var="opentime2" value="${vo.openTime}"/> 
			<c:set var="closetime2" value="${vo.closeTime}"/>
		</c:when>
	</c:choose>
</c:forEach>

	<div class="container">
	<h1> 예약시간/날짜 수정 페이지 </h1>
	<!-- side bar -->
	<c:import url="../service/sellerSidebar.jsp"></c:import>
	
	<div class="row col-md-auto" >
	
	<form action="./updateReservationSetting" method="post">
	
	<h5> 휴무일 </h5>
	<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
	  <input type="checkbox" class="btn-check" id="btncheck1" autocomplete="off" name="holiday" value="월" <c:if test="${fn:contains(setting.holiday, '월')}">checked</c:if>>
	  <label class="btn btn-outline-primary" for="btncheck1">월요일</label>
	
	  <input type="checkbox" class="btn-check" id="btncheck2" autocomplete="off" name="holiday" value="화" <c:if test="${fn:contains(setting.holiday, '화')}">checked</c:if>>
	  <label class="btn btn-outline-primary" for="btncheck2">화요일</label>
	
	  <input type="checkbox" class="btn-check" id="btncheck3" autocomplete="off" name="holiday" value="수" <c:if test="${fn:contains(setting.holiday, '수')}">checked</c:if>>
	  <label class="btn btn-outline-primary" for="btncheck3">수요일</label>
	  
	  	  <input type="checkbox" class="btn-check" id="btncheck4" autocomplete="off" name="holiday" value="목"<c:if test="${fn:contains(setting.holiday, '목')}">checked</c:if>>
	  <label class="btn btn-outline-primary" for="btncheck4">목요일</label>
	  
	  	  <input type="checkbox" class="btn-check" id="btncheck5" autocomplete="off" name="holiday" value="금"<c:if test="${fn:contains(setting.holiday, '금')}">checked</c:if>>
	  <label class="btn btn-outline-primary" for="btncheck5">금요일</label>
	  
	  	  <input type="checkbox" class="btn-check" id="btncheck6" autocomplete="off" name="holiday" value="토"<c:if test="${fn:contains(setting.holiday, '토')}">checked</c:if>>
	  <label class="btn btn-outline-primary" for="btncheck6">토요일</label>
	  
	  	  <input type="checkbox" class="btn-check" id="btncheck7" autocomplete="off"  name="holiday"  value="일"<c:if test="${fn:contains(setting.holiday, '일')}">checked</c:if> >
	  <label class="btn btn-outline-primary" for="btncheck7" >일요일</label>           
      

	</div>
	
	<h5> 예약시간 단위</h5>

	<select class="form-select" id="selbox" aria-label="Default select example" name="term">
	  <option selected>예약 시간 단위</option>
	  
		  <option value="60"<c:if test="${setting.term eq 60}">selected</c:if>  >1시간</option>
		  <option value="30"<c:if test="${setting.term eq 30}">selected</c:if> >30분</option>
		  <option value="15" <c:if test="${setting.term eq 15}">selected</c:if>>15분</option>
		  <%-- <option value="direct"<c:if test="${setting.term not eq 60&&setting.term not eq 30&&setting.term not eq 15}">selected</c:if>>직접입력(분단위로 숫자를 입력해주세요)</option><input type="number" id="selboxDirect" name="selboxDirect" <c:if  test="${setting.term not eq 60||30||15}">value="${setting.term}"</c:if> />
 --%>	
	</select>


	<h5> 예약 시간 당 수용인원</h5>
	<select class="form-select" id="selbox" aria-label="Default select example" name="capacity">
	  <option selected>수용인원</option>
	  <option value="1"<c:if test="${setting.capacity eq 1}">selected</c:if>>1명</option>
	  <option value="2"<c:if test="${setting.capacity eq 2}">selected</c:if>>2명</option>
	  <option value="3"<c:if test="${setting.capacity eq 3}">selected</c:if>>3명</option>
	  <option value="4"<c:if test="${setting.capacity eq 4}">selected</c:if>>4명</option>
	  <option value="5"<c:if test="${setting.capacity eq 5}">selected</c:if>>5명</option>
	 </select>
	<hr>
	
	
	<h4> 점심시간</h4>
	<h5> 점심시간 시작 </h5>
	<input id='timepicker5' type='text'name='startBreaktime' value="${setting.startBreaktime.substring(0,5)}"/>
	<h5> 점심시간 끝  </h5>
	<input id='timepicker6' type='text'name='endBreaktime' value="${setting.endBreaktime.substring(0,5)}"/>
	<hr>
	<h4> 평일</h4>
	<h5> 오픈시간 </h5>
	<input id='timepicker1' type='text'name='times' value="${opentime1.substring(0,5)}">
	
	<h5> 마감시간</h5>
	<input id='timepicker2' type='text'name='times' value="${closetime1.substring(0,5)}"/>
	<hr>
	
	<h4> 주말</h4>
	<h5> 오픈시간</h5>
	<input id='timepicker3' type='text'name='times'value="${opentime2.substring(0,5)}"/>
	
	<h5> 마감시간</h5>
	<input id='timepicker4' type='text'name='times' value="${closetime2.substring(0,5)}"/>

<br>
	
	<button type="submit" class="btn-primary btn-sm">수정 </button>
</form>
	
	</div>
	</div>

<script type="text/javascript" src="../js/reservationSetting.js"></script>
</body>
</html>