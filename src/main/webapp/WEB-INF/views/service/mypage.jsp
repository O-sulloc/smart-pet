<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<title>Service Mypage</title>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="shortcut icon" type="image/x-icon"
	href="../resources/assets/images/favicon.svg" />
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
  
<c:import url="../temp/header_css.jsp"></c:import>

</head>
<body>

<c:import url="../temp/header.jsp"></c:import>

   <div class="breadcrumbs overlay">
      <div class="container">
         <div class="row align-items-center">
            <div class="col-lg-8 offset-lg-2 col-md-12 col-12">
               <div class="breadcrumbs-content">
                  <h1 class="page-title">My Service Page</h1>
               </div>
               <ul class="breadcrumb-nav">
                  <li><a href="/">Home</a></li>
                  <li>My Service Page</li>
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
													<h2>My Service Profile</h2>
												</div>
											</div>
										</div>
										
										
										
										<div class="row">
										
											<div class="col-lg-6 col-md-6 col-12 p-0">
												<div class="appointment-input">
													<img alt="" src="../resources/upload/service/${vo.serviceFileVO.fileName}">
												</div>
											</div>
											<hr>
										
											<div class="col-lg-6 col-md-6 col-12 p-0">
												<div class="appointment-input">
													<label for="serName"><i class="lni lni-home"></i></label> <input
														type="text" name="serName" value="${vo.serName}" id="serName" readonly>
												</div>
											</div>
											<div class="col-lg-6 col-md-6 col-12 p-0">
												<div class="appointment-input">
													<label for="homepage"><i class="lni lni-home"></i></label> <input
														type="text" name="homepage" value="${vo.homepage}" id="homepage" readonly>
												</div>
											</div>
									
											<div class="col-lg-6 col-md-6 col-12 p-0">
												<div class="appointment-input">
													<label for="serTel"><i class="lni lni-phone-set"></i></label>
													<input type="text" name="serTel" id="sersTel" value="${vo.serTel}" readonly>
												</div>
											</div>
											<div class="col-lg-6 col-md-6 col-12 p-0">
												<div class="appointment-input">
													<label for="serAddress"><i class="lni lni-map-marker"></i></label>
													<input type="text" name="serAddress" value="${vo.serAddress}" id="serAddress" readonly>
												</div>
											</div>
											<div class="mb-3 p-0">
												<div class="appointment-input">
													<label for="serTime"><i class="lni lni-map-marker"></i></label>
													<input type="text" name="serTime" value="${vo.serTime}" id="serTime" readonly>
												</div>
											</div>
											
										<c:choose>
											<c:when test="${vo.serKind==1}">
											<div class="col-lg-6 col-md-6 col-12 p-0">
												<div class="appointment-input">
													<label for="hospitalField"><i class="lni lni-sthethoscope"></i></label>
													<input type="text" name="hospitalField" value="${vo.hospitalField}" id="hospitalField" readonly>
												</div>
											</div>
											</c:when>
										</c:choose>
							
							
									<hr>
											<div class="col-lg-6 col-md-6 col-12 p-0">
												<div class="appointment-btn button">
													<button class="btn" onclick="location.href='/service/update'">Update</button>
													<button class="btn" onclick="location.href='/service/delete'">Delete Service</button>
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



<!-- <img alt="" src="../resources/upload/service/$"> -->
<!-- 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
 -->
 <!-- jquery -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   
   <c:import url="../temp/header_script.jsp"></c:import>
   <c:import url="../temp/footer.jsp"></c:import>
 <script type="text/javascript" src="../js/mypage.js"></script>
</body>
</html>