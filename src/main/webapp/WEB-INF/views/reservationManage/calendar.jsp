<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/calendar.css">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="calendar">
	<div class="header">
		<button class="calendar_btn" onclick="prevCal();">&lt;</button>
		<div class="title"><span class="year"></span><span class="month"></span></div>
		<button class="calendar_btn" onclick="nextCal();">&gt;</button>
	</div>
	<div class="day">
		<div>S</div>
		<div>M</div>
		<div>T</div>
		<div>W</div>
		<div>T</div>
		<div>F</div>
		<div>S</div>
	</div>
	<div class="dates"></div>
</div>
<!-- <input type="text" id="period_1"> ~ <input type="text" id="period_2"> -->

<script type="text/javascript" src="../js/calendar.js"></script>

</body>
</html>