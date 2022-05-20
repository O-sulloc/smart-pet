<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../temp/header_css.jsp"></c:import>
<c:import url="../temp/header_script.jsp"></c:import>

<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet">
<link href="../css/styles.css" rel="stylesheet">
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
<!-- 사이드바 +모달 +예약리스트ajax (common/reservationList.jsp) -->


	<div class="container">
		<h1>판매자가 보는 예약 리스트 페이지</h1>
	 <div class="row">
	<!-- side bar -->
	<div class="d-flex flex-column flex-shrink-0 p-3 bg-light col-md-auto" style="width: 280px;">
    <a href="#" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
      <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
      <span class="fs-4">판매자 Menu</span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
      <li class="nav-item">
        <a href="./mypage" class="nav-link link-dark">
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
        <a href="./reservationList" class="nav-link link-dark" >
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#home"></use></svg>
          예약리스트 
        </a>
      </li>
      <li>
        <a href="#" class="nav-link link-dark" id="resStateIs0">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#speedometer2"></use></svg>
         대기중인 예약 보기 
        </a>
      </li>
      <li>
        <a href="#" class="nav-link link-dark">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#table"></use></svg>
          날짜별 예약 현황 보기 
        </a>
      </li>
      <li>
        <a href="#" class="nav-link link-dark">
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
  <!-- ======================================================================= -->
    <!-- ======================================================================= -->
      <!-- ======================================================================= -->
  
  	<div class="card-body col-md-auto"  id="list">
		<!-- 예약list -ajax  -->
	</div>



<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		         <h4 class="modal-title" id="myModalLabel">예약 상태 변경 </h4>
		      </div>
		      <div class="modal-body">
		
							<div class="form-check">
								<input class="form-check-input radio" type="radio"
									name="resState" id="flexRadioDefault1" value="1" checked> <label
									class="form-check-label" for="flexRadioDefault1"> 예약 승인  </label>
							</div>
							<div class="form-check">
								<input class="form-check-input radio" type="radio"
									name="resState" id="flexRadioDefault2" value="2"  > <label
									class="form-check-label" for="flexRadioDefault2"> 예약 거부 </label>
							</div>
		
							
		
			</div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary modalClose" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary modalSubmit">Save changes</button>
		      </div>
		    </div>
		  </div>
		</div>
<!-- Modal 끝 -->


	<script src="../js/reservationList.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="../js/datatables-simple-demo.js"></script>
</body>
</html>