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
<!-- Place favicon.ico in the root directory -->

<c:import url="../temp/header_css.jsp"></c:import>
</head>
<body>
<div class="col-lg-3 col-md-4 col-4">
		<div class="service-sidebar">
			<div class="single-widget service-category">
				<h3>Seller Page</h3>
				<ul>
					<li><a  href="/user/sellerList"> Product List 
					</a></li>
					<li><a  href="/product/add"> Product Add 
					</a></li>
					<li><a href="/user/sellerOrder"> Order List 
					</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>