<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>My Service Update Page</title>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="../resources/assets/images/favicon.svg" />

<c:import url="../temp/header_css.jsp"></c:import>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>

	<div class="breadcrumbs overlay">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-8 offset-lg-2 col-md-12 col-12">
					<div class="breadcrumbs-content">
						<h1 class="page-title">My Service Update Page</h1>
					</div>
					<ul class="breadcrumb-nav">
						<li><a href="/">Home</a></li>
						<li>My Service Update Page</li>
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
					<c:import url="../service/sellerSidebar.jsp"></c:import>
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
													<h2>My Service Profile Update</h2>
												</div>
											</div>
										</div>





										<form action="./update" method="post"
											enctype="multipart/form-data">

											<input type="hidden" name="id" value="${user.id}"> <input
												type="hidden" name="serNum" value="${vo.serNum}"> <img
												alt=""
												src="../resources/upload/service/${vo.serviceFileVO.fileName}">

											<div class="row mb-3">
												<label for="files" class=" col-form-label">대표 사진</label>
												<div class="col-sm-10">
													<input type="file" name="file" class="form-control">
												</div>
											</div>
											<div class="row">


												<div class="col-lg-6 col-md-6 col-12 p-0">
													<div class="appointment-input">
														<label for="serName"><i class="lni lni-home"></i></label>
														<input type="text" name="serName" value="${vo.serName}"
															id="serName" readonly>
													</div>
												</div>

												<div class="col-lg-6 col-md-6 col-12 p-0">
													<div class="appointment-input">
														<label for="homepage"><i class="lni lni-home"></i></label>
														<input type="text" name="homepage" value="${vo.homepage}"
															id="homepage">
													</div>
												</div>
												<div class="col-lg-6 col-md-6 col-12 p-0">
													<div class="appointment-input">
														<label for="serTel"><i class="lni lni-phone-set"></i></label>
														<input type="text" name="serTel" id="sersTel"
															value="${vo.serTel}">
													</div>
												</div>
												<div class="col-lg-6 col-md-6 col-12 p-0">
													<div class="appointment-input">
														<label for="serAddress"><i
															class="lni lni-map-marker"></i></label> <input type="text"
															name="serAddress" value="${vo.serAddress}"
															id="serAddress">
													</div>
												</div>
												<div class="mb-3 p-0">
													<div class="appointment-input">
														<label for="serTime"><i class="lni lni-alarm-clock"></i></label>
														<input type="text" name="serTime" value="${vo.serTime}"
															id="serTime">
													</div>
												</div>

												<c:if test="${vo.serKind==1}">
													<div class="row mb-3">
														<label for="hospitalField" class="col-form-label">진료과목
														</label>
														<div class="col-lg-6 col-md-6 col-12 p-0">
															<div class="appointment-input">
																<label for="hospitalField"><i
																	class="lni lni-sthethoscope"></i></label> <input type="text"
																	name="hospitalField" value="${vo.hospitalField}"
																	id="hospitalField">
															</div>
														</div>
													</div>
												</c:if>




												<hr>

												<div class="col-lg-6 col-md-6 col-12 p-0">
													<div class="appointment-btn button">
														<button type="submit" class="btn">Update</button>
													</div>
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








	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<c:import url="../temp/header_script.jsp"></c:import>
	<c:import url="../temp/footer.jsp"></c:import>
	<script type="text/javascript" src="../js/mypage.js"></script>




</body>
</html>