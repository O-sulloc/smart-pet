<%@ page language="java" contentType="text/html; charset=UTF-8"
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