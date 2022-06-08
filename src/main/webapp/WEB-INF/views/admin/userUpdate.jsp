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
<link rel="shortcut icon" type="image/x-icon" href="../resources/assets/images/favicon.svg" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
						<h1 class="page-title">User Role Update</h1>
					</div>
					<ul class="breadcrumb-nav">
						<li><a href="/">Home</a></li>
						<li>User Role Update</li>
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
						<section class="appointment page">
							<div class="container">
								<div class="row">
									<div class="appointment-form">
										<div class="row">
											<div class="col-12">
												<div class="appointment-title">
													<h2>Update Member Role</h2>
												</div>
												<div style="overflow: scroll;">
												<table class="table">
													<thead>
														<tr>
															<th scope="col">ID</th>
															<th scope="col">NAME</th>
															<th scope="col">PHONE</th>
															<th scope="col">EMAIL</th>
															<th scope="col">ROLE</th>
															<th scope="col">JOIN DATE</th>
															<th scope="col">UPDATE</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${list}" var="user">
														<form class="frm" action="userUpdate" method="post" id="frm">
															<input type="hidden" value="${user.id}" name="id">
															<tr>
																<th scope="row">${user.id}</th>
																<td>${user.name}</td>
																<td>${user.phone}</td>
																<td>${user.email}</td>
																<td>
																	<select name="role" id="role${user.id}">
																		<c:choose>
																			<c:when test="${user.role == 0}">
																				<option value="0" selected>Admin</option>
																				<option value="1">Product_Seller</option>
																				<option value="2">User</option>
																				<option value="3">Service_Seller</option>
																			</c:when>
																			<c:when test="${user.role == 1}">
																				<option value="0">Admin</option>
																				<option value="1" selected>Product_Seller</option>
																				<option value="2">User</option>
																				<option value="3">Service_Seller</option>
																			</c:when>
																			<c:when test="${user.role == 2}">
																				<option value="0">Admin</option>
																				<option value="1">Product_Seller</option>
																				<option value="2" selected>User</option>
																				<option value="3">Service_Seller</option>
																			</c:when>
																			<c:otherwise>
																				<option value="0">Admin</option>
																				<option value="1">Product_Seller</option>
																				<option value="2">User</option>
																				<option value="3" selected>Service_Seller</option>
																			</c:otherwise>
																		</c:choose>
																	</select>
																</td>
																<td>${user.joinDate}</td>
																<td>
																	<div class="col-lg-6 col-md-6 col-12 p-0">
																		<div class="appointment-btn button">
																			<button class="btn" type="button" id="btn" data-num="${user.id}">Update</button>
																		</div>
																	</div>
																</td>
															</tr>
															</form>
														</c:forEach>
													</tbody>
												</table>
												</div>
											</div>
										</div>
										<div class="row"></div>
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

	<script type="text/javascript">
	$(".btn").click(function(){
	   	let id = $(this).attr("data-num");
	       console.log(id);
	       
	       let role = $("#role"+id).val();
	       console.log(role);
	       
	       $.ajax({
	          
	          type:"POST",
	          url:"./userUpdate",
	          data:{
	             id:id,
	             role:role
	          },
	          success:function(data){
	              if(data.trim() == 1){
	                 alert("업데이트 성공!!");
	             }else{
	                alert("업데이트 실패!!");
	             } 
	          },
	          error:function(){
	             alret("서버 오류");
	          }
	          
	       })
	   })
	</script>
	
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<c:import url="../temp/header_script.jsp"></c:import>
	<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>