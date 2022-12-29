<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>My Page</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="shortcut icon" type="image/x-icon"
	href="../resources/assets/images/favicon.svg" />
<!-- Place favicon.ico in the root directory -->

<c:import url="../temp/header_css.jsp"></c:import>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>

	<div class="breadcrumbs overlay">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-8 offset-lg-2 col-md-12 col-12">
					<div class="breadcrumbs-content">
							<h1 class="page-title">마이페이지</h1>
					</div>
					<ul class="breadcrumb-nav">
						<li><a href="/">홈</a></li>
						<li>마이페이지</li>
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
					<c:import url="../temp/sidebar.jsp"></c:import>
					<!-- End Of SideBar -->

					<div class="col-lg-9 col-md-12 col-12">
						<!-- section start -->
						<section class="appointment page">
							<!-- <section class="appointment page"> -->
							<div class="container">
								<div class="row">
									<div class="appointment-form">
										<div class="row">
											<div class="col-12">
												<div class="appointment-title">
													<h2>내 프로필</h2>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 col-md-6 col-12 p-0">
												<div class="appointment-input">
													<label for="name"><i class="lni lni-user"></i></label> <input
														type="text" name="name" value="${vo.name}" id="name" readonly>
												</div>
											</div>
											<div class="col-lg-6 col-md-6 col-12 p-0">
												<div class="appointment-input">
													<label for="id"><i class="lni lni-star-filled"></i></label> <input
														type="text" name="id" value="${vo.id}" id="id" readonly>
												</div>
											</div>
											<div class="col-lg-6 col-md-6 col-12 p-0">
												<div class="appointment-input">
													<label for="email"><i class="lni lni-envelope"></i></label>
													<input type="email" name="email" id="email" value="${vo.email}" readonly>
												</div>
											</div>
											<div class="col-lg-6 col-md-6 col-12 p-0">
												<div class="appointment-input">
													<label for="phone"><i class="lni lni-phone-set"></i></label>
													<input type="text" name="phone" id="phone" value="${vo.phone}" readonly>
												</div>
											</div>
											<div class="col-lg-6 col-md-6 col-12 p-0">
												<div class="appointment-input">
													<label for="address"><i class="lni lni-map-marker"></i></label>
													<input type="text" name="address" value="${vo.address}" id="address" readonly>
												</div>
											</div>
											<div class="col-lg-6 col-md-6 col-12 p-0">
												<div class="appointment-input">
													<label for="point"><i class="lni lni-coin"></i></label>
													<input type="text" name="point" value="${vo.point}" id="point" readonly>
												</div>
											</div>
											<div class="col-lg-6 col-md-6 col-12 p-0">
												<div class="appointment-btn button">
													<button class="btn" onclick="location.href='/user/update'">정보 수정</button>
													<button class="btn" onclick="location.href='/user/delete'">탈퇴하기</button>
												</div>
											</div>
										</div>
									</div>


								</div>
							</div>
						</section>
						<!-- section end -->
					</div>
				</div>
			</div>
		</div>
	</div>

	<c:import url="../temp/header_script.jsp"></c:import>
	<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>