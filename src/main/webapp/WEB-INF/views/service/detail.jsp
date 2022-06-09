<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- split -->
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

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
                  <h1 class="page-title">Information</h1>
               </div>
               <ul class="breadcrumb-nav">
                  <li><a href="/">Home</a></li>
                  <li>Service</li>
                  <li>Information</li>
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
				   	<li class="list-group-item">
						<input type="hidden" readonly="readonly" id="serNum" data-sn="${seviceVO.serNum}">
				   		<!-- <h5>대표이미지</h5> -->
				   		
				   		<img alt="대표이미지" width="500px" height="550px" src="../resources/upload/service/${file}">
				   	</li>
				</ul>
		</div>
	</c:when>
	</c:choose> 

	<%-- <ul class="list-group">
		
		<li class="list-group-item"><i class="lni lni-home"></i>&nbsp;&nbsp;${seviceVO.serName }</li>
		<li class="list-group-item"><i class="lni lni-phone"></i>&nbsp;&nbsp;${seviceVO.serTel }</li>
		<li class="list-group-item"><i class="lni lni-map-marker"></i>&nbsp;&nbsp;${seviceVO.serAddress }</li>
		<li class="list-group-item"><i class="lni lni-timer"></i>&nbsp;&nbsp;${seviceVO.serTime }</li>
		<c:choose>
			<c:when test="${not empty seviceVO.hospitalField}"> 
				<li class="list-group-item"><i class="lni lni-sthethoscope"></i>&nbsp;&nbsp;${seviceVO.hospitalField}</li>
			</c:when>
		</c:choose> 
		<li><a class="link-success text-decoration-none list-group-item" id="homepage" target="_blank" href="https://${seviceVO.homepage}"><i class="lni lni-website"></i>&nbsp;&nbsp; ${seviceVO.homepage }</a></li>
	</ul>
 --%>

	<input type="hidden" id="term" value="${settingVO.term}">
	<input type="hidden" id="capacity" value="${settingVO.capacity}">
	<input type="hidden" id="holiday" value="${settingVO.holiday}">
	<input type="hidden" id="startBreaktime" value="${settingVO.startBreaktime}">
	<input type="hidden" id="endBreaktime" value="${settingVO.endBreaktime}">





<hr>
<c:forEach items="${settingVO.reservationTimeVO}" var="vo">
	<c:choose>
		<c:when test="${vo.timecase eq 0}"> <!-- 평일 -->
			<%-- <c:set var="openTime0" value="${vo.openTime}"></c:set> --%>
			<%-- <c:set var="closeTime0" value="${vo.closeTime}"></c:set> --%>
			<input type="hidden" id="openTime0" value="${vo.openTime}">
			<input type="hidden" id="closeTime0" value="${vo.closeTime}">
		</c:when>
		<c:otherwise> <!-- 주말 -->
		<input type="hidden" id="openTime1" value="${vo.openTime}">
			<%-- <c:set var="openTime1" value="${vo.openTime}"></c:set> --%>
			<%-- <c:set var="closeTime1" value="${vo.closeTime}"></c:set> --%>
			<input type="hidden" id="openTime1" value="${vo.openTime}">
			<input type="hidden" id="closeTime1" value="${vo.closeTime}">
			
		</c:otherwise>
	</c:choose>
</c:forEach>




	</div>
<!-- 
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
	</div> -->

	
	<!-- <form action="../reservation/confirm" method="post" id="frm">
		js로 시간 받아옴
		
			평일 
		<div class="container my-4" id="buttons"></div>
		
			주말 
		<div class="container my-4" id="buttons2"> </div>
	
		 -->
	
		
		<!-- <input type="time" value="09:00" min="09:00" max="18:00"> -->
		
	
		<%-- <div class="inputArea">
					<input type="hidden" name="serNum" value="${seviceVO.serNum }">
					<label for="">예약메모</label>
					<input type="hidden" name="resDate" value="" id="resDate">
					<input type="hidden" name="resTime" value="" id="resTime">
					<input type="hidden" name="resState" value="0">
					 --%>
		<section class="appointment page section">
         <div class="container">
            <div class="row">
               <div class="col-lg-8 offset-lg-2 col-md-12 col-12">

                  <div class="appointment-form">
                     <div class="row">
                        <div class="col-12">
                           <div class="appointment-title">
                           	<h2>Information&</h2>
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
                              <label for="serName"><i class="lni lni-home"></i></label> <input
                                 type="text" name="serName" id="serName" readonly="readonly" value="${seviceVO.serName }">
                           </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-12 p-0">
                           <div class="appointment-input">
                              <label for="serTel"><i class="lni lni-phone"></i></label> <input
                                 type="text" name="serTel" id="email" readonly="readonly" value="${seviceVO.serTel }">
                           </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-12 p-0">
                           <div class="appointment-input">
                              <label for="serAddress"><i class="lni lni-map-marker"></i></label>
                              <input type="text" name="serAddress" id="serAddress"
                                value="${seviceVO.serAddress }" readonly="readonly">
                           </div>
                        </div>
                         <div class="col-lg-6 col-md-6 col-12 p-0">
                           <div class="appointment-input">
                              <label for="serTime"><i class="lni lni-timer"></i></label>
                              <input type="text" name="serTime" id="serTime"
                                value="${seviceVO.serTime }" readonly="readonly">
                           </div>
                        </div>
                        <c:choose>
						<c:when test="${not empty seviceVO.hospitalField}"> 
                         <div class="col-lg-6 col-md-6 col-12 p-0">
                           <div class="appointment-input">
                              <label for="serTime"><i class="lni lni-sthethoscope"></i></label>
                              <input type="text" name="hospitalField" id="hospitalField"
                                value="${seviceVO.hospitalField }" readonly="readonly">
                           </div>
                        </div>
                        </c:when>
                        </c:choose>
                         <div class="col-lg-6 col-md-6 col-12 p-0">
                           <div class="appointment-input">
                              <label for="homepage"><i class="lni lni-world"></i></label>
                              <input type="button" value="${seviceVO.homepage }" onClick="window.open('https://${seviceVO.homepage}')">
                           </div>
                        </div>
                 <div class="order">
		<button type="button" class="btn btn-outline-success dateInfo_btn">예약날짜 확인</button>


	</div>
	<div class="resInfo" style="display:none;">
	<div class="container my-4 ">
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
		<div class="container my-4" id="buttons2"> </div>
	
			<div class="inputArea">
					<input type="hidden" name="serNum" value="${seviceVO.serNum }">
					<input type="hidden" name="resDate" value="" id="resDate">
					<input type="hidden" name="resTime" value="" id="resTime">
					<input type="hidden" name="resState" value="0">
					<section class="appointment page section">

                        <div class="col-12 p-0">
						<label for="resMemo" class="resMemo">예약메모</label>
                           <div class="appointment-input">
                              <textarea name="resMemo" id="resMemo" placeholder="Write Your Message Here....."></textarea>
                           </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-12 p-0">
                           <div class="appointment-btn button">
                             <button type="button" class="btn" id="res_btn">예약진행</button>
                           </div>
                        </div>
                     </div>
                  </div>
                  </div>

               </div>
            </div>
         </div>
      </section>
				<!-- 	<input type="text" name="resMemo" id="resMemo">
					<button type="button" class="btn" id="res_btn">예약진행</button>
		</div> -->
	</form>
				
	
	

<!-- 	<script type="text/javascript" src="../js/detail.js"></script> -->
	<script type="text/javascript" src="../js/calendar.js"></script>
	<script type="text/javascript" src="../js/reservation.js"></script>

   <!-- jquery -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   
   <c:import url="../temp/header_script.jsp"></c:import>
   <c:import url="../temp/footer.jsp"></c:import>

</body>
</html>