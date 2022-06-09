

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
					<li><a href="/service/registration"> My Service 등록 <i
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