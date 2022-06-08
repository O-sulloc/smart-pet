<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
		<title>Resevation List By Month</title>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
			href="../resources/assets/images/favicon.svg" />
			
<c:import url="../temp/header_css.jsp"></c:import>

<link href="../css/calendar.css" rel="stylesheet">
<link href="../css/monthPicker.css" rel="stylesheet">

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
                  <h1 class="page-title">월별 예약 현황</h1>
               </div>
               <ul class="breadcrumb-nav">
                  <li><a href="/">Home</a></li>
                  <li>월별 예약 현황</li>
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
								<!--monthPicker -->
								 <div class="monthpicker">
								  <div class="years">
								    <select id="yearSelect">
								      <option value="2022" selected>2022</option>
								      <option value="2023">2023</option>
								    </select>
								  </div>
								  <table>
								    <tr>
								      <td><button data-value="0" class="monthBtn" value="01">1월</button></td>
								      <td><button data-value="1" class="monthBtn" value="02">2월</button></td>
								      <td><button data-value="2" class="monthBtn" value="03">3월</button></td>
								      <td><button data-value="3" class="monthBtn" value="04">4월</button></td>
								    </tr>
								    <tr>
								      <td><button data-value="4" class="monthBtn" value="05">5월</button></td>
								      <td><button data-value="5" class="monthBtn" value="06">6월</button></td>
								      <td><button data-value="6" class="monthBtn" value="07">7월</button></td>
								      <td><button data-value="7" class="monthBtn" value="08">8월</button></td>
								    </tr>
								    <tr>
								      <td><button data-value="8" class="monthBtn" value="09">9월</button></td>
								      <td><button data-value="9" class="monthBtn" value="10">10월</button></td>
								      <td><button data-value="10" class="monthBtn" value="11">11월</button></td>
								      <td><button data-value="11" class="monthBtn" value="12">12월</button></td>
								    </tr>
								  </table>
								  </div><!-- monthPicker 끝  -->
		  
						</div>
						<hr>
										<div id="count"></div><!-- 예약 수 정보 -->
	 			
	 								<div id="list"></div><!-- 예약 테이블 -->
					
					</section>
			
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
	</div>

<!-- Modal 끝 -->
	
		</div><!-- 컨테이너 끝 -->
	
	</div><!-- col-md-auto -->
	
	
	

	<c:import url="../temp/header_script.jsp"></c:import>	
	<script src="../js/monthListPage.js"></script>
	<script src="../js/monthPicker.js"></script>
</body>
</html>