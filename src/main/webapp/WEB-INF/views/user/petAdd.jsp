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
						<h1 class="page-title">펫 프로</h1>
					</div>
					<ul class="breadcrumb-nav">
						<li><a href="/">홈</a></li>
						<li>펫 프로필</li>
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

					<div class="col-lg-8 col-md-12 col-12">
						<!-- section start -->
						<section class="appointment page">
							<!-- <section class="appointment page section"> -->
							<div class="container">
								<div class="row">
								
								<form action="petAdd" method="post">
									<div class="appointment-form">
										<div class="row">
											<div class="col-12">
												<div class="appointment-title">
													<h2>펫 등록</h2>
												</div>
											</div>
										</div>
										
										<div class="row">
											<div class="col-lg-6 col-md-6 col-12 p-0">
												<div class="appointment-input">
													<label for=petName><i class="lni lni-user"></i></label> <input
														type="text" name="petName" id="petName" placeholder="이름">
												</div>
											</div>
											<div class="col-lg-6 col-md-6 col-12 p-0">
												<div class="appointment-input">
													<label for="petKind"><i class="lni lni-notepad"></i></label>
													<select name="petKind" id="petKind">
														<option value="none" selected disabled>강아지 / 고양이</option>
														<option value="0" id="petKind">강아지</option>
														<option value="1" id="petKind">고양이</option>
													</select>
												</div>
											</div>
											<div class="col-lg-6 col-md-6 col-12 p-0">
												<div class="appointment-input">
													<label for="petBirth"><i class="lni lni-calendar"></i></label>
													<input type="date" name="petBirth" id="petBirth" min="2000-01-01" max="">
												</div>
											</div>
											<div class="col-lg-6 col-md-6 col-12 p-0">
												<div class="appointment-input">
													<label for="petSex"><i class="lni lni-magnifier"></i></label>
													<select name="petSex" id="petSex">
														<option value="none" selected disabled>여 / 남</option>
														<option value="0" id="petSex">여</option>
														<option value="1" id="petSex">남</option>
													</select>
												</div>
											</div>
											<div class="col-lg-6 col-md-6 col-12 p-0">
												<div class="appointment-btn button">
													<button class="btn" type="submit">등록</button>
												</div>
											</div>
										</div>
									</div>
								</form>

								</div>
							</div>
						</section>
						<!-- section end -->
					</div>
				</div>
			</div>
		</div>
	</div>

	
	<script type="text/javascript">
		let now_utc = Date.now()	//현재 날짜를 밀리초로 반환
		let timeOff = new Date().getTimezoneOffset()*60000; 	//분 단위를 밀리초로 변환
		let today = new Date(now_utc-timeOff).toISOString().split("T")[0];
		// new Date(now_utc-timeOff).toISOString()으로 '2022-05-12T14:09:38.134Z'를 반환받음
		// 거기서 T를 기준으로 split하고 T 앞부분인 날짜를 today에 저장한다
		
		document.getElementById("petBirth").setAttribute("max", today);
		//날짜 지정 max에 today를 넣음으로써 오늘 이후의 날짜는 선택하지 못하게 한다.
	</script>
	<c:import url="../temp/header_script.jsp"></c:import>
	<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>