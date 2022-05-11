<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:import url="../temp/header_css.jsp"></c:import>
<c:import url="../temp/header_script.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>

	<input type="hidden" readonly="readonly" id="serNum"
		value="${vo.serNum}">
	<ul class="list-group">
		<li class="list-group-item">${vo.serName }</li>
		<li class="list-group-item">${vo.serTel }</li>
		<li class="list-group-item">${vo.serAddress }</li>
		<li class="list-group-item">${vo.serTime }</li>
		<li class="list-group-item">${vo.homepage }</li>
	</ul>



	<div class="book">
		<button type="button" class="btn btn-outline-success book_btn">예약</button>
		<script>
			$(".book_btn").click(function() {
				$(".calendar").slideUp();
				$(".book_btn").slideDown();
			});
		</script>
	</div>

	<div class="calendar">
		<h6>calendar</h6>
	</div>

	</div>

</body>
</html>