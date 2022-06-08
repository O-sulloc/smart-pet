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
	
	<link href="../css/ServiceSellerSidebar.css" rel="stylesheet">
<!-- Place favicon.ico in the root directory -->

<c:import url="../temp/header_css.jsp"></c:import>
</head>
<body>

	<!-- Start Of SideBar -->
	<div class="col-lg-4 col-md-12 col-12" id="ServiceSellerSidebar">
		<div class="service-sidebar">
			<div class="single-widget service-category">
				<h3>My Page</h3>
				<ul>
					<li><a href="/user/myPage"> My Profile <i
							class="lni lni-user"></i>
					</a></li>
					<li><a href="/user/pwUpdate"> Change Password <i
							class="lni lni-lock-alt"></i>
					</a></li>
					<li><a href="/user/petList"> Pet Profile <i
							class="lni lni-github"></i>
					</a></li>
					<li><a href="#"> Appointment <i class="lni lni-calendar"></i>
					</a></li>
					<li><a href="/cart/list"> Cart <i
							class="lni lni-cart-full"></i>
					</a></li>
					<li><a href="/user/reviewListPage"> Orders <i
							class="lni lni-delivery"></i>
					</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- End Of SideBar -->
			
</body>
</html>