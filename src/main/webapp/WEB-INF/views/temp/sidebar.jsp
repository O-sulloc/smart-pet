<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="shortcut icon" type="image/x-icon"
	href="../resources/assets/images/favicon.svg" />
	
	<link href="../css/ServiceSellerSidebar.css" rel="stylesheet">
<!-- Place favicon.ico in the root directory -->

<c:import url="../temp/header_css.jsp"></c:import>
</head>
<body>

	<!-- Start Of SideBar -->
	<div class="col-lg-3 col-md-12 col-12">

		<div class="service-sidebar">
			<div class="single-widget service-category">
				<h3>마이페이지</h3>
				<ul>
					<li><a href="/user/myPage"> ${user.role ==0?'Admin Page':'내 프로필'} <i
							class="lni lni-user"></i>
					</a></li>
					
					<c:if test="${user.role eq 0 }"> <!-- 0 관리자만 볼 수 있ㄴ 사이드바 -->
						<li><a href="/user/admin/userUpdate"> Update User Role <i
							class="lni lni-cog"></i>
						</a></li>
						<li><a href="/notice/add"> Notice 글 작성 <i
							class="lni lni-cog"></i>
						</a></li>
						<li><a href="/faq/add">FAQ 글 작성<i
							class="lni lni-cog"></i>
						</a></li>
					</c:if>
					
					<li><a href="/user/pwUpdate"> 비밀번호 변경 <i
							class="lni lni-lock-alt"></i>
					</a></li>
					
					<c:if test="${user.role eq 2 }"> <!-- 2 user만 볼 수 있ㄴ 사이드바 -->
						<li><a href="/user/petList"> 펫 프로필 <i
								class="lni lni-github"></i>
						</a></li>
						<li><a href="/user/appointment"> 예약 현황 <i
							 class="lni lni-calendar"></i>
						</a></li>
						<li><a href="/cart/list"> 장바구니 <i
								class="lni lni-cart-full"></i>
						</a></li>
						<li><a href="/user/orderList"> 주문내역 <i
								class="lni lni-delivery"></i>
						</a></li>
					</c:if>

				</ul>
			</div>
		</div>
	</div>
	<!-- End Of SideBar -->
			
</body>
</html>