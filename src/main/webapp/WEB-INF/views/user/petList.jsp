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
						<h1 class="page-title">Pet Profile</h1>
					</div>
					<ul class="breadcrumb-nav">
						<li><a href="/">Home</a></li>
						<li>Pet Profile</li>
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
						<section class="pricing-table">
							<div class="container">
							
								<div class="row">
									<div class="col-lg-4 col-md-6 col-12">
										<div class="single-table wow fadeInUp" data-wow-delay=".2s">
											<div class="table-x">
												<a onclick="location.href='./petAdd'" style="cursor: pointer;">
													<i class="lni lni-circle-plus"></i>
												</a>
											</div>
											<div class="table-head">
												<h4 class="title"><i class="lni lni-heart-filled"></i></h4>
											</div>
											<ul class="table-list">
												<li>Add</li>
												<li>Your</li>
												<li>Pet</li>
											</ul>
											<div class="button">
												<a href="./petAdd" class="btn">Add</a>
											</div>
										</div>
									</div>
									
									<c:forEach items="${list}" var="pet" >
										<div class="col-lg-4 col-md-6 col-12">
											<div class="single-table wow fadeInUp" data-wow-delay=".2s">
												<div class="table-x">
													<a href="./petDelete?petNum=${pet.petNum}" style="cursor: pointer;">
														<i class="lni lni-close"></i>
													</a>
												</div>
												<div class="table-head">
													<h4 class="title">${pet.petName}</h4>
												</div>
												<ul class="table-list">
													<li>${pet.petKind==0?'강아지':'고양이'}</li>
													<li>생년월일: ${pet.petBirth}</li>
													<li>성별: ${pet.petSex==0?'여아':'남아'}</li>
												</ul>
												<div class="button">
													<a href="./petUpdate?petNum=${pet.petNum}" class="btn">Update</a>
												</div>
											</div>
										</div>
									</c:forEach>
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