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



</body>
</html>