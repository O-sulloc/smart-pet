<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../temp/header_css.jsp"></c:import>
<c:import url="../temp/header_script.jsp"></c:import>
<link href="../css/calendar.css" rel="stylesheet">
<link href="../css/monthPicker.css" rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet">
<link href="../css/styles.css" rel="stylesheet">
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>


</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	
	
	
	<div class="container">
	
	<!-- side bar import-->
		<c:import url="../service/sellerSidebar.jsp"></c:import>
		
	<div class="col-md-auto">
		<!--monthPicker -->
		 <div class="monthpicker">
		  <div class="years">
		    <select id="yearSelect">
		      <option value="2022" selected>2022</option>
		      <option value="2023">2023</option>
		    </select>
		  </div>
		  <table>
		    <tr>
		      <td><button data-value="0" class="monthBtn" value="01">1월</button></td>
		      <td><button data-value="1" class="monthBtn" value="02">2월</button></td>
		      <td><button data-value="2" class="monthBtn" value="03">3월</button></td>
		      <td><button data-value="3" class="monthBtn" value="04">4월</button></td>
		    </tr>
		    <tr>
		      <td><button data-value="4" class="monthBtn" value="05">5월</button></td>
		      <td><button data-value="5" class="monthBtn" value="06">6월</button></td>
		      <td><button data-value="6" class="monthBtn" value="07">7월</button></td>
		      <td><button data-value="7" class="monthBtn" value="08">8월</button></td>
		    </tr>
		    <tr>
		      <td><button data-value="8" class="monthBtn" value="09">9월</button></td>
		      <td><button data-value="9" class="monthBtn" value="10">10월</button></td>
		      <td><button data-value="10" class="monthBtn" value="11">11월</button></td>
		      <td><button data-value="11" class="monthBtn" value="12">12월</button></td>
		    </tr>
		  </table>
		  </div><!-- monthPicker 끝  -->
		  
		  <br>
		  
		  <div id="count"></div><!-- 예약 수 정보 -->
		  
		  <div id="list"></div><!-- 예약 테이블 -->
	
	</div><!-- <div class="col-md-auto">  -->
</div><!-- container -->
	<script src="../js/monthListPage.js"></script>
	<script src="../js/monthPicker.js"></script>
</body>
</html>