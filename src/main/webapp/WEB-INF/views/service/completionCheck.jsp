<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../temp/header_css.jsp"></c:import>
<c:import url="../temp/header_script.jsp"></c:import>

<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet">
<link href="../css/styles.css" rel="stylesheet">
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
		<div class="container">
	
			<!-- side bar import-->
		<c:import url="../service/sellerSidebar.jsp"></c:import>

		<div id="list" class="card-body col-md-auto">
			<h5>방문완료 체크하는 페이지 </h5>
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
									name="resState" id="flexRadioDefault1" value="3" checked> <label
									class="form-check-label" for="flexRadioDefault1"> 방문 완료  </label>
							</div>
							<div class="form-check">
								<input class="form-check-input radio" type="radio"
									name="resState" id="flexRadioDefault2" value="4"  > <label
									class="form-check-label" for="flexRadioDefault2"> 미방문 </label>
							</div>
		
							
		
			</div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary modalClose" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary modalSubmit">Save changes</button>
		      </div>
		    </div>
		  </div>
		</div>
	</div>

<!-- Modal 끝 -->
		
		</div>

<script src="../js/completionCheck.js"></script>
</body>
</html>