<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Vet - MediGrids</title>
	<meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="../resources/assets/images/favicon.svg" />
    <!-- <script src="http://code.jquery.com/jquery-latest.js"></script> -->
    <c:import url="../temp/header_css.jsp"></c:import>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
    
    <div class="breadcrumbs overlay">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-8 offset-lg-2 col-md-12 col-12">
					<div class="breadcrumbs-content">
						<h1 class="page-title">Veterinary</h1>
					</div>
					<ul class="breadcrumb-nav">
						<li><a href="/">Home</a></li>
						<li>Find Veterinary</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container my-4">
		<div class="row">
			<c:forEach var="vet" items="${data.response.body.items.item}">
			    <div class="col-lg-4 col-md-4 col-4 my-2">
				    <div class="portfolio-sidebar">    
					    <div class="single-widget">
							<h3>${vet.bsn_nm}</h3>
							<ul class="list-info">
								<li>
									<i class="lni lni-map-marker"></i>
									<span>Location : </span> ${vet.road_nm_addr}
								</li>
								<li>
									<i class="lni lni-phone-set"></i>
									<span>Telephone : </span> ${vet.tel_no}
								</li>
							</ul>
						</div>
				    </div>
				</div>
			</c:forEach>
		</div>
	</div>
    
    <!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=47939e2d795f0bb2624cac7f17282a26&libraries=services"></script>
	<script src="../resources/js/test.js"></script> -->
	<c:import url="../temp/header_script.jsp"></c:import>
	<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>