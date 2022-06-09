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
                  <h1 class="page-title">Change Schedule</h1>
               </div>
               <ul class="breadcrumb-nav">
                  <li><a href="/">Home</a></li>
                  <li>Schedule List</li>
                  <li>Change Schedule</li>
               </ul>
            </div>
         </div>
      </div>
   </div>
  
	
	<div class="container mt-4">
	
		<%-- <ul class="list-group">
			<li class="list-group-item">${vo.serviceVO.serName }</li>
			<li class="list-group-item">${vo.serviceVO.serTel }</li>
			<li class="list-group-item">${vo.serviceVO.serAddress }</li>
			<li class="list-group-item">${vo.serviceVO.serTime }</li>
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
		<!-- design start-->
<section class="appointment page section">
         <div class="container">
            <div class="row">
               <div class="col-lg-8 offset-lg-2 col-md-12 col-12">

                  <div class="appointment-form">
                     <div class="row">
                        <div class="col-12">
                           <div class="appointment-title">
                           	<h2>Service Information</h2>
                             
                            
                           </div>
                        </div>
                     </div>
                     <div class="row">
                        <div class="col-lg-6 col-md-6 col-12 p-0">
                           <div class="appointment-input">
                              <label for="serName"><i class="lni lni-home"></i></label> <input
                                 type="text" name="serName" id="serName" readonly="readonly" value="${vo.serviceVO.serName }">
                           </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-12 p-0">
                           <div class="appointment-input">
                              <label for="serTel"><i class="lni lni-phone"></i></label> <input
                                 type="text" name="serTel" id="email" readonly="readonly" value="${vo.serviceVO.serTel }">
                           </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-12 p-0">
                           <div class="appointment-input">
                              <label for="serAddress"><i class="lni lni-map-marker"></i></label>
                              <input type="text" name="serAddress" id="serAddress"
                                value="${vo.serviceVO.serAddress }" readonly="readonly">
                           </div>
                        </div>
                         <div class="col-lg-6 col-md-6 col-12 p-0">
                           <div class="appointment-input">
                              <label for="serTime"><i class="lni lni-timer"></i></label>
                              <input type="text" name="serTime" id="serTime"
                                value="${vo.serviceVO.serTime }" readonly="readonly">
                           </div>
                        </div>
                        <c:choose>
						<c:when test="${not empty vo.serviceVO.hospitalField}"> 
                         <div class="col-lg-6 col-md-6 col-12 p-0">
                           <div class="appointment-input">
                              <label for="serTime"><i class="lni lni-sthethoscope"></i></label>
                              <input type="text" name="hospitalField" id="hospitalField"
                                value="${vo.serviceVO.hospitalField }" readonly="readonly">
                           </div>
                        </div>
                        </c:when>
                        </c:choose>
                        <!-- 변경 전 예약 정보 -->
                         <div class="appointment-form">
	                     <div class="row">
	                        <div class="col-12">
	                           <div class="appointment-title">
	                           	<h2>User Information</h2>
	                           	<p>About Schedule Before Changes</p>
	                           </div>
	                        </div>
	                     </div>
                         <div class="col-lg-6 col-md-6 col-12 p-0">
                           <div class="appointment-input">
                              <label for="userName"><i class="lni lni-consulting"></i></label>
                             <input type="text" name="name" id="name"
                                value="${sessionScope.user.name}" readonly="readonly">
                           </div>
                        </div>
                         <div class="col-lg-6 col-md-6 col-12 p-0">
                           <div class="appointment-input">
                              <label for="userPhone"><i class="lni lni-whatsapp"></i></label>
                              <input type="text" name="phone" id="phone"
                                value="${sessionScope.user.phone}" readonly="readonly">
                           </div>
                        </div>
                         <div class="col-lg-6 col-md-6 col-12 p-0">
                           <div class="appointment-input">
                              <label for="resDate"><i class="lni lni-calendar"></i></label>
                                ${vo.resDate}
                           </div>
                        </div>
                         <div class="col-lg-6 col-md-6 col-12 p-0">
                           <div class="appointment-input">
                              <label for="resTime"><i class="lni lni-timer"></i></label>
                              <c:set var="time" value="${vo.resTime}" />
                        		${fn:split(time,':')[0]}시 ${fn:split(time,':')[1]}분
                           </div>
                        </div>
                         <div class="col-lg-6 col-md-6 col-12 p-0">
                           <div class="appointment-input">
                              <label for="resState"><i class="lni lni-popup"></i></label>
                              <c:choose>
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
                           </div>
                        </div>
                        
                 <div class="order">
		<button type="button" class="btn btn-outline-success dateInfo_btn">예약날짜 확인</button>


	</div>
<form action="appointmentUpdate" method="post">
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
				<%-- <label for="">예약메모</label> <input type="text" name="resMemo" id="resMemo" value="${vo.resMemo }"> --%>
				<input type="hidden" name="resDate" value="${vo.resDate}" id="resDate"> 
				<input type="hidden" name="resTime" value="${vo.resTime}" id="resTime"> 
				<input type="hidden" name="resState" value="0">
				<section class="appointment page section">

                        <div class="col-12 p-0">
						<label for="resMemo" class="resMemo">예약메모</label>
                           <div class="appointment-input">
                              <textarea name="resMemo" id="resMemo">${vo.resMemo }</textarea>
                           </div>
                        </div>
				<button type="submit" class="btn btn-outline-success res_update" id="res_btn" >예약수정</button>
			</div>
		</form>
		
		<!-- 예약 삭제 버튼 -->
		<div>
			<a class="btn btn-danger res_delete"
				href="./appointmentDelete?resNum=${vo.resNum}" role="button">예약취소</a>
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
<!-- 	</form>-->	
<!-- design end -->

		<%-- <hr>
		<c:forEach items="${settingVO.reservationTimeVO}" var="vo">
			<c:choose>
				<c:when test="${vo.timecase eq 0}">
					<!-- 평일 -->
					<c:set var="openTime0" value="${vo.openTime}"></c:set>
					<c:set var="closeTime0" value="${vo.closeTime}"></c:set>
					<input type="hidden" id="openTime0" value="${vo.openTime}">
					<input type="hidden" id="closeTime0" value="${vo.closeTime}">
				</c:when>
				<c:otherwise>
					<!-- 주말 -->
					<input type="hidden" id="openTime1" value="${vo.openTime}">
					<c:set var="openTime1" value="${vo.openTime}"></c:set>
					<c:set var="closeTime1" value="${vo.closeTime}"></c:set>
					<input type="hidden" id="openTime1" value="${vo.openTime}">
					<input type="hidden" id="closeTime1" value="${vo.closeTime}">

				</c:otherwise>
			</c:choose>
		</c:forEach> --%>




		<%-- <div class="order">
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


 --%>

		<script type="text/javascript" src="../js/calendar.js"></script>
		<script type="text/javascript" src="../js/reservation.js"></script>



   <!-- jquery -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   
   <c:import url="../temp/header_script.jsp"></c:import>
   <c:import url="../temp/footer.jsp"></c:import>
</body>
</html>