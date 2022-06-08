<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Completion Check Page</title>
 <meta charset="utf-8">
		 <meta http-equiv="x-ua-compatible" content="ie=edge" />
		  <meta name="viewport" content="width=device-width, initial-scale=1">
		  <link rel="shortcut icon" type="image/x-icon"
			href="../resources/assets/images/favicon.svg" />
			<c:import url="../temp/header_css.jsp"></c:import>


<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet">
<link href="../css/styles.css" rel="stylesheet">
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>

</head>



<body>
	<c:import url="../temp/header.jsp"></c:import>
	
	  <div class="breadcrumbs overlay">
      <div class="container">
         <div class="row align-items-center">
            <div class="col-lg-8 offset-lg-2 col-md-12 col-12">
               <div class="breadcrumbs-content">
                  <h1 class="page-title">방문 완료 체크 페이지</h1>
               </div>
               <ul class="breadcrumb-nav">
                  <li><a href="/">Home</a></li>
                  <li>방문 완료 체크 페이지 </li>
               </ul>
            </div>
         </div>
      </div>
   </div>
   
   
   
   
   <div class="service-details">
		<div class="container">
			<div class="content">
				<div class="row">
					<!-- Start Of SideBar -->
					<c:import url="../service/sellerSidebar.jsp"></c:import>
					<!-- End Of SideBar -->
				
					<div class="col-lg-8 col-md-12 col-12">
						<section class="appointment page">
							<div class="container">
								<!-- 예약 테이블 -->
								<div id="list"></div>
							</div>
						</section>
					</div>
				</div>
		</div>
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
<c:import url="../temp/header_script.jsp"></c:import>
<script src="../js/completionCheck.js"></script>
</body>
</html>