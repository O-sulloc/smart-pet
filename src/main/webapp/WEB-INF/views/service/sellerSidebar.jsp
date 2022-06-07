<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 사이드바 -->
	
<div class="row">
	<div class="d-flex flex-column flex-shrink-0 p-3 bg-light col-md-auto" style="width: 280px;">
    <a href="#" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
      <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
      <span class="fs-4">판매자 Menu</span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
      <li class="nav-item">
        <a href="./mypage" class="nav-link link-dark" >
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#home"></use></svg>
         마이 서비스
        </a>
      </li>
      <li>
        <a href="#" class="nav-link link-dark">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#speedometer2"></use></svg>
         어쩌고 
        </a>
      </li>
      
    <li class="border-top my-3"></li>
      <li class="nav-item">
        <a href="./reservationList" class="nav-link link-dark" id="reservationLIst">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#home"></use></svg>
          예약리스트 
        </a>
      </li>
      <li>
        <a href="./resState0Page" class="nav-link link-dark" id="resStateIs0">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#speedometer2"></use></svg>
         대기중인 예약 보기 
        </a>
      </li>
      <li>
        <a href="./getDayReservationList" class="nav-link link-dark">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#table"></use></svg>
          날짜별 예약 현황 보기 
        </a>
      </li>
      <li>
        <a href="./monthListPage" class="nav-link link-dark">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#grid"></use></svg>
          월별 예약 현황 보기 
        </a>
      </li>
      <li>
        <a href="./completionCheck" class="nav-link link-dark">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#grid"></use></svg>
          	방문 완료 체크하기 
        </a>
      </li>
      
      <li class="border-top my-3"></li>
      <li>
        <a href="./reservationSetting" class="nav-link link-dark">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#people-circle"></use></svg>
         	예약 시간 설정하기 
        </a>
      </li>
      <li>
        <a href="./updateReservationSetting" class="nav-link link-dark">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#grid"></use></svg>
          	예약 시간 변경하기
        </a>
      </li>
  	<li class="border-top my-3"></li>
       <li class="nav-item">
        <a href="#" class="nav-link link-dark" id="reservationLIst">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#home"></use></svg>
          	how to use 
        </a>
      </li>
      
      
      
    </ul>
    <hr>
    <div class="dropdown">
      <a href="#" class="d-flex align-items-center link-dark text-decoration-none dropdown-toggle" id="dropdownUser2" data-bs-toggle="dropdown" aria-expanded="false">
        <img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2">
        <strong>mdo</strong>
      </a>
      <ul class="dropdown-menu text-small shadow" aria-labelledby="dropdownUser2">
        <li><a class="dropdown-item" href="#">New project...</a></li>
        <li><a class="dropdown-item" href="#">Settings</a></li>
        <li><a class="dropdown-item" href="#">Profile</a></li>
        <li><hr class="dropdown-divider"></li>
        <li><a class="dropdown-item" href="#">Sign out</a></li>
      </ul>
    </div>
  </div>
  

</body>
</html>

---------------------------------------- --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>My Page - MediGrids</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="shortcut icon" type="image/x-icon"
	href="../resources/assets/images/favicon.svg" />
<!-- Place favicon.ico in the root directory -->

<c:import url="../temp/header_css.jsp"></c:import>
</head>
<body>

	<!-- Start Of SideBar -->
	<div class="col-lg-4 col-md-12 col-12">
		<div class="service-sidebar">
			<div class="single-widget service-category">
				<h3>My Service Page</h3>
				<ul>
					<li><a href="/service/mypage"> My Service <i
							class="lni lni-user"></i>
					</a></li>
					    <br>
					<li><a href="/service/reservationList"> 예약 현황 <i
							class="lni lni-calendar"></i>
					</a></li>
					<li><a href="/service/getDayReservationList"> 일별 예약 현황<i
							class="lni lni-calendar"></i>
					</a></li>					
					<li><a href="/service/monthListPage"> 월별 예약 현황<i
							class="lni lni-calendar"></i>
					</a></li>
					<li><a href="/service/resState0Page"> 대기중인 예약
						<i class="lni lni-checkbox"></i>
					</a></li>
					<li><a href="/service/completionCheck"> 방문 완료 체크 
						<i class="lni lni-checkbox"></i>
							
							
					</a></li>	
					    <br>									
					<li><a href="/service/reservationSetting"> 예약 설정하기 <i
							class="lni lni-cog"></i>
					</a></li>
					<li><a href="/service/updateReservationSetting"> 예약 설정 변경하기 <i
							class="lni lni-cog"></i>
					</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- End Of SideBar -->
</body>
</html>