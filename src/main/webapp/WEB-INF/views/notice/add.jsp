<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>Notice - MediGrids</title>
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
						<h1 class="page-title" style="text-transform: capitalize;">${board} Write</h1>
					</div>
					<ul class="breadcrumb-nav">
						<li><a href="/">Home</a></li>
						<li style="text-transform: capitalize;">${board} Write</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<section id="contact-us" class="contact-us section appointment">
		<div class="container">
			<div class="contact-head wow fadeInUp" data-wow-delay=".4s">
				<div class="row">
					<div class="col-lg-12 col-12">
						<div class="form-main">
							<form action="./add" method="post" enctype="multipart/form-data" class="form">
							
								<!-- 카테고리 선택 -->
								<div class="appointment-form" id="grade" style="padding: 10px 0;">
									<div class="appointment-input" style="padding: 0px">
										<label for="grade"><i class="lni lni-notepad"></i></label>
										<select name="grade" id="grade">
											<option value="none" selected disabled>Category</option>
											<option value="0" id="grade">General</option>
											<option value="1" id="grade">Shop</option>
											<option value="1" id="grade">Event</option>
										</select>
									</div>
								</div>
								
								<div class="row">
									<div class="col-lg-6 col-12">
										<div class="form-group">
											<input name="title" type="text" id="title" name="title" required="required" placeholder="Title">
										</div>
									</div>
									<div class="col-lg-6 col-12">
										<div class="form-group">
											<input name="id" type="text" required="required" id="id" name="id" value="${user.id}" readonly>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group message">
											<textarea name="contents" id="contents" name="contents" rows="20" placeholder="Contents"></textarea>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group button">
											<button type="submit" class="btn">WRITE</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<c:import url="../temp/header_script.jsp"></c:import>
	<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>