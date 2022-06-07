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
						<h1 class="page-title">Change Password</h1>
					</div>
					<ul class="breadcrumb-nav">
						<li><a href="/">Home</a></li>
						<li>Change Password</li>
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
						<section class="login">
							<div class="container">
								<div class="row">
									<div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
										<div class="form-head">
										<h4 class="title">Enter Your Password</h4>
											<form action="pwUpdate" method="post" id="frm">
												<div class="form-group">
													<input type="text" name="id" value="${vo.id}" hidden="">
												</div>
												<div class="form-group">
													<input type="password" id="pw" name="pw" class="form-control" placeholder="Password">
													<div id="pwResult"></div>
												</div>
												<div class="button">
													<button type="button" class="btn" id="btn">update</button>
												</div>
											</form>
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