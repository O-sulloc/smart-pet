<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>Admin Page - MediGrids</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="shortcut icon" type="image/x-icon"
	href="../resources/assets/images/favicon.svg" />
<!-- Place favicon.ico in the root directory -->

<c:import url="../temp/header_css.jsp"></c:import>
</head>
<body>

	<!-- Start Of SideBar -->
	<div class="col-lg-3 col-md-12 col-12">
		<div class="service-sidebar">
			<div class="single-widget service-category">
				<h3>Admin Page</h3>
				<ul>
					<li><a href="/user/adminPage"> Admin Page <i
							class="lni lni-user"></i>
					</a></li>
					<li><a href="/user/admin/userUpdate"> 회원 등급 관리 <i
							class="lni lni-lock-alt"></i>
					</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- End Of SideBar -->
</body>
</html>