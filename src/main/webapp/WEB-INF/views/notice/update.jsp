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
						<h1 class="page-title" style="text-transform: capitalize;">${board} Update</h1>
					</div>
					<ul class="breadcrumb-nav">
						<li><a href="/">Home</a></li>
						<li style="text-transform: capitalize;">${board} Update</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<section id="contact-us" class="contact-us section">
		<div class="container">
			<div class="contact-head wow fadeInUp" data-wow-delay=".4s">
				<div class="row">
					<div class="col-lg-12 col-12">
						<div class="form-main">
							<form action="./update" method="post" enctype="multipart/form-data" class="form">
								<input type="hidden" name="num" value="${vo.num}">
								
								<div class="form-title">
									<input type="hidden" name="grade" value="${vo.grade}">
									<h2>Category: ${vo.noticeCateVO.cateName}</h2>
								</div>
								<div class="row">
									<div class="col-lg-6 col-12">
										<div class="form-group">
											<input name="title" type="text" id="title" name="title" value="${vo.title}" required="required">
										</div>
									</div>
									<div class="col-lg-6 col-12">
										<div class="form-group">
											<input name="id" type="text" required="required" id="id" name="id" value="${vo.id}" readonly>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group message">
											<textarea name="contents" id="contents" name="contents" rows="20">${vo.contents}</textarea>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group button">
											<button type="submit" class="btn">UPDATE</button>
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