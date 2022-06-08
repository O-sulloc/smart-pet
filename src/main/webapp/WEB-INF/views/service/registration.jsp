<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="../resources/assets/images/favicon.svg" />
<c:import url="../temp/header_css.jsp"></c:import>
<c:import url="../temp/header_script.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>

	<div class="breadcrumbs overlay">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-8 offset-lg-2 col-md-12 col-12">
					<div class="breadcrumbs-content">
						<h1 class="page-title">서비스 등록</h1>
					</div>
					<ul class="breadcrumb-nav">
						<li><a href="/">Home</a></li>
						<li>서비스 등록</li>
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
						<section class="appointment page">
							<div class="container">

								<div class="row">
									<div class="appointment-form">
										<div class="row">
											<div class="col-12">
												<div class="appointment-title">
													<h2>서비스 등록 </h2>
												</div>
											</div>
										</div>




<form action="./registration" method="post" enctype="multipart/form-data">

    <input type="hidden"  name="id" value="${user.id}">
 

  <div class="form-check">
  <input class="form-check-input" type="radio" name="serKind" id="flexRadioDefault1" value="1" checked>
  <label class="form-check-label" for="flexRadioDefault1">
    병원 서비스 
  </label>
</div>
<div class="form-check">
  <input class="form-check-input" type="radio" name="serKind" id="flexRadioDefault2" value="2" >
  <label class="form-check-label" for="flexRadioDefault2">
    미용샵 서비스 
  </label>
  
  <div class="mb-3">
    <label for="serName" class="form-label">상호명</label>
    <input type="text" class="form-control" name="serName">
    <div  class="form-text">상호명을 입력해주세요</div>
  </div>
  <div class="mb-3">
    <label for="serTel" class="form-label">업체 전화번호</label>
    <input type="text" class="form-control" name="serTel">
  </div>
  <div class="mb-3">
    <label for="serAddress" class="form-label">업체 주소</label>
    <input type="text" class="form-control" name="serAddress" >
  </div>
  <div class="mb-3">
    <label for="homepage" class="form-label">홈페이지 주소</label>
    <input type="text" class="form-control" name="homepage">
  </div>
  <div class="mb-3">
    <label for="serTime" class="form-label">영업 시간</label>
    <input type="text" class="form-control" name="serTime">
    <div  class="form-text">ex) 평일 9:00~6:00 토요일:9~2시 매주 수요일 휴무 </div>
  </div>
  <div class="mb-3" id="hospital">
    <label for="hospitalField" class="form-label">진료과목</label>
    <input type="text" name="hospitalField" class="form-control" >
    <div  class="form-text">ex)고양이전문, 노령동물 관리 </div>
  </div>
  <div class="mb-3">
    <label for="hospitalField" class="form-label">대표 이미지</label>
    <input type="file" name="file" class="form-control">
  </div>  
<div class="col-lg-6 col-md-6 col-12 p-0">
	<div class="appointment-btn button">
  <button type="submit" class="btn btn-success">등록</button>
  </div>
 </div>
</form>











									</div>
								</div>		
								</div>
							
						</section>
					</div>
				</div>
			</div>
</div>











<script type="text/javascript" src="../js/registration.js"></script>
</body>
</html>