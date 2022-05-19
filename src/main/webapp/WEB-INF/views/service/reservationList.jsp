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
	

	<!-- 사이드바 -->
	<div class="container">
		<h1>관리자가 보는 예약 리스트 페이지</h1>
	 <div class="row">
	<!-- side bar -->
	<div class="d-flex flex-column flex-shrink-0 p-3 bg-light col-md-auto"" style="width: 280px;">
    <a href="#" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
      <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
      <span class="fs-4">Menu</span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
      <li class="nav-item">
        <a href="#" class="nav-link active" aria-current="page">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#home"></use></svg>
          예약리스트 
        </a>
      </li>
      <li>
        <a href="#" class="nav-link link-dark">
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
      <li>
        <a href="#" class="nav-link link-dark">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#people-circle"></use></svg>
          또 뭐있냐 
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
		<!-- ajax  -->
		
	</div>
<%-- <!--표 -->
	<div class="card-body col-md-auto">
		<div
			class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
			<div class="dataTable-top">
				<div class="dataTable-dropdown">
					<label><select class="dataTable-selector"><option
								value="5">5</option>
							<option value="10" selected="">10</option>
							<option value="15">15</option>
							<option value="20">20</option>
							<option value="25">25</option></select> entries per page</label>
				</div>
				<div class="dataTable-search">
					<input class="dataTable-input" placeholder="Search..." type="text">
				</div>
			</div>
			<div class="dataTable-container">
				<table id="datatablesSimple" class="dataTable-table">
					<thead>
						<tr>
							<th data-sortable="" style="width: 19.1946%;"><a href=""
								class="dataTable-sorter">예약자명</a></th>
							<th data-sortable="" style="width: 15.1275%;"><a href="#"
								class="dataTable-sorter">예약일</a></th>
							<th data-sortable="" style="width: 13.8389%;"><a href="#"
								class="dataTable-sorter">예약시간</a></th>
							<th data-sortable="" style="width: 10.85906%;"><a href="#"
								class="dataTable-sorter">예약상태</a></th>
							<th data-sortable="" style="width: 15.0336%;"><a href="#"
								class="dataTable-sorter">전화번호</a></th>
							<th data-sortable="" style="width: 11.9463%;"><a href="#"
								class="dataTable-sorter">이메일</a></th>
						</tr>
					</thead>



					<tbody>
						<c:forEach items="${list}" var="vo">


							<tr>
								<td>${vo.name}</td>
								<td>${vo.reservationVO.resDate}</td>
								<td>${vo.reservationVO.resTime}</td>
								<td><c:choose>
										<c:when test="${vo.reservationVO.resState==0}">
											대기 <button type="button" class="btn btn-primary btn-sm modalBtn" data-toggle="modal" data-target="#myModal" data="${vo.reservationVO.resNum}">변경</button>
										</c:when>
										<c:when test="${vo.reservationVO.resState==1}">
								 			승인 <button type="button" class="btn btn-primary btn-sm modalBtn" data-toggle="modal" data-target="#myModal" data="${vo.reservationVO.resNum}"> >변경</button>
										</c:when>
										<c:when test="${vo.reservationVO.resState==2}">
											거부 <button type="button" class="btn btn-primary btn-sm modalBtn" data-toggle="modal" data-target="#myModal" data="${vo.reservationVO.resNum}">>변경</button>
										</c:when>
										<c:when test="${vo.reservationVO.resState==3}">
											완료 <button type="button" class="btn btn-primary btn-sm modalBtn" data-toggle="modal" data-target="#myModal" data="${vo.reservationVO.resNum}">변경</button>
										</c:when>
									</c:choose></td>
								<td>${vo.phone}</td>
								<td>${vo.email}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			<div class="dataTable-bottom">
				<div class="dataTable-info">Showing 1 to 10 of 57 entries</div>
				<nav class="dataTable-pagination">
					<ul class="dataTable-pagination-list">
						<li class="active"><a href="#" data-page="1">1</a></li>
						<li class=""><a href="#" data-page="2">2</a></li>
						<li class=""><a href="#" data-page="3">3</a></li>
						<li class=""><a href="#" data-page="4">4</a></li>
						<li class=""><a href="#" data-page="5">5</a></li>
						<li class=""><a href="#" data-page="6">6</a></li>
						<li class="pager"><a href="#" data-page="2">›</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	</div><!-- row -->
	</div><!-- container -->
	 --%>


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
         <h4 class="modal-title" id="myModalLabel">예약 상태 변경 </h4>
      </div>
      <div class="modal-body">

					<div class="form-check">
						<input class="form-check-input" type="radio"
							name="resState" id="flexRadioDefault1"> <label
							class="form-check-label" for="flexRadioDefault1" value="1"> 예약 승인  </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio"
							name="resState" id="flexRadioDefault2" checked> <label
							class="form-check-label" for="flexRadioDefault2" value="2"> 예약 거부 </label>
					</div>

					

				</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary modalClose" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary modalSubmit">Save changes</button>
      </div>
    </div>
  </div>
</div>




	<script src="../js/reservationList.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="../js/datatables-simple-demo.js"></script>
</body>
</html>