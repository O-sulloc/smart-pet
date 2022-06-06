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
	<c:import url="../temp/header.jsp"></c:import>

	<div class="breadcrumbs overlay">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-8 offset-lg-2 col-md-12 col-12">
					<div class="breadcrumbs-content">
						<h1 class="page-title">My Page</h1>
					</div>
					<ul class="breadcrumb-nav">
						<li><a href="/">Home</a></li>
						<li>My Page</li>
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
					<div class="col-lg-4 col-md-12 col-12">
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
									<li><a href="#"> Appointment <i
											class="lni lni-calendar"></i>
									</a></li>
									<li><a href="/user/reviewListPage"> Orders <i
											class="lni lni-delivery"></i>
									</a></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- End Of SideBar -->

					<div class="col-lg-8 col-md-12 col-12">
						<!-- section start -->
						<section class="appointment page">
							<!-- <section class="appointment page"> -->
							<div class="container">
								<div class="row">
									<div class="appointment-form">
										<div class="row">
											<div class="col-12">
												<div class="appointment-title">
													<h2>My Info</h2>
												</div>
											</div>
										</div>
										<form action="update" method="post" id="frm">
											<div class="row">
												<div class="col-lg-6 col-md-6 col-12 p-0">
													<div class="appointment-input">
														<label for="name"><i class="lni lni-user"></i></label> <input
															type="text" name="name" value="${vo.name}" id="name"
															readonly>
													</div>
												</div>
												<div class="col-lg-6 col-md-6 col-12 p-0">
													<div class="appointment-input">
														<label for="id"><i class="lni lni-star-filled"></i></label>
														<input type="text" name="id" value="${vo.id}" id="id"
															readonly>
													</div>
												</div>
												<div class="col-lg-6 col-md-6 col-12 p-0">
													<div class="appointment-input">
														<label for="email"><i class="lni lni-envelope"></i></label>
														<input type="email" name="email" id="email"
															value="${vo.email}" >
													</div>
												</div>
												<div class="col-lg-6 col-md-6 col-12 p-0">
													<div class="appointment-input">
														<label for="phone"><i class="lni lni-phone-set"></i></label>
														<input type="text" name="phone" id="phone"
															value="${vo.phone}" >
													</div>
												</div>
												<div class="col-lg-6 col-md-6 col-12 p-0">
													<div class="appointment-input">
														<label for="address"><i class="lni lni-map-marker"></i></label>
														<input type="text" name="address" value="${vo.address}"
															id="address" >
													</div>
												</div>
												<div class="col-lg-6 col-md-6 col-12 p-0">
													<div class="appointment-input">
														<label for="point"><i class="lni lni-coin"></i></label> <input
															type="text" name="point" value="${vo.point}" id="point"
															readonly>
													</div>
												</div>
												<div class="col-lg-6 col-md-6 col-12 p-0">
													<div class="appointment-btn button">
														<button class="btn" type="submit" id="btn">Confirm</button>
													</div>
												</div>
											</div>
										</form>
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
	
	
	<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
	document.getElementById("address").addEventListener("click", function(){
		new daum.Postcode({
			oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
				// 예제를 참고하여 다양한 활용법을 확인해 보세요.
				document.getElementById("address").value=data.address;
			}
		}).open();
	})
	</script>
		
	<c:import url="../temp/header_script.jsp"></c:import>
	<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>