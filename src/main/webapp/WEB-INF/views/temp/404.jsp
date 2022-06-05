<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>404 Error - MediGrids Medical & Hospital HTML Template.</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="shortcut icon" type="image/x-icon"
	href="../resources/assets/images/favicon.svg" />
<!-- Place favicon.ico in the root directory -->
<link
	href="https://fonts.googleapis.com/css2?family=Rubik:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">

</head>
<body>

	<div class="preloader">
		<div class="preloader-inner">
			<div class="preloader-icon">
				<span></span> <span></span>
			</div>
		</div>
	</div>


	<div class="error-area overlay">
		<div class="d-table">
			<div class="d-table-cell">
				<div class="container">
					<div class="error-content">
						<h1>404</h1>
						<h2>Oops! Page Not Found!</h2>
						<p>The page you are looking for does not exist. It might have
							been moved or deleted.</p>
						<div class="button">
							<a href="/" class="btn">Back to Home</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<c:import url="../temp/header_script.jsp"></c:import>
	<script>
		window.onload = function() {
			window.setTimeout(fadeout, 500);
		}

		function fadeout() {
			document.querySelector('.preloader').style.opacity = '0';
			document.querySelector('.preloader').style.display = 'none';
		}
	</script>
</body>
</html>