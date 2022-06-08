<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

  
<!--표 -->

		<div
			class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
			<div class="dataTable-top">
				<div class="dataTable-dropdown">
					<label><select class="dataTable-selector perPage">
							<option class="option" value="5" selected="">5</option>
							<option class="option" value="10">10</option>
							<option class="option" value="15">15</option>
							<option class="option" value="20">20</option>
							<option class="option" value="25">25</option></select> entries per page</label>
				</div>
<!-- 				<div class="dataTable-search">
					<input class="dataTable-input" placeholder="Search..." type="text">
				</div> -->
			</div>
			<div class="dataTable-container">
				<table id="datatablesSimple" class="dataTable-table">
					<thead>
						<tr>
							<th data-sortable="" style="width: 18.1946%;"><a href=""
								class="dataTable">예약자명</a></th>
							<th data-sortable="" style="width: 15.1275%;"><a href="#"
								class="dataTable">예약일</a></th>
							<th data-sortable="" style="width: 11.8389%;"><a href="#"
								class="dataTable">예약시간</a></th>
							<th data-sortable="" style="width: 13.85906%;"><a href="#"
								class="dataTable">예약상태</a></th>
							<th data-sortable="" style="width: 15.0336%;"><a href="#"
								class="dataTable">전화번호</a></th>
							<th data-sortable="" style="width: 11.9463%;"><a href="#"
								class="dataTable">이메일</a></th>
						</tr>
					</thead>



					<tbody>
						<c:forEach items="${list}" var="vo">


							<tr>
								<td>${vo.name}</td>
								<td>${vo.reservationVO.resDate}</td>
								<td>${vo.reservationVO.resTime.substring(0,5)}</td>
								<td><c:choose>
										<c:when test="${vo.reservationVO.resState==0}">
											대기 <button type="button" class="btn btn-primary btn-sm modalBtn" data-toggle="modal" data-target="#myModal" data="${vo.reservationVO.resNum}">변경</button>
										</c:when>
										<c:when test="${vo.reservationVO.resState==1}">
								 			승인 
										</c:when>
										<c:when test="${vo.reservationVO.resState==2}">
											거부 
										</c:when>
										<c:when test="${vo.reservationVO.resState==3}">
											완료 
										</c:when>
										<c:when test="${vo.reservationVO.resState==4}">
											에약 후 미방문
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
				<nav class="dataTable-pagination">
				<ul class="pagination">
						<li class="page-item"><a data-pn="${pager.pre?pager.startNum-1:0}" class="page-link pager"
							href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
			
						<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
							<li class="page-item"><a data-pn="${i}" class="page-link pager"
								href="#">${i}</a></li>
						</c:forEach>
			
						<li class="page-item"><a data-pn="${pager.next?pager.lastNum+1:0}" class="page-link pager"
							href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</div>
		</div>



</body>
</html>