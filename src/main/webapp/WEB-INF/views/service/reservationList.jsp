<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> 예약 리스트 페이지</h1>

<c:forEach items="${list}" var="vo">
<h5>${vo.name}</h5>
<h5>${vo.reservationVO.resDate}</h5>
<h5>${vo.reservationVO.resTime}</h5>
=======================================

 </c:forEach>
</body>
</html>