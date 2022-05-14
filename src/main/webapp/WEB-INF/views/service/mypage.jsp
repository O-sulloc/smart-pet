<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<c:import url="../temp/header_css.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>


<h1>mypage</h1>
<h3>홈페이지:${vo.homepage}</h3>
<h3>진료과목:${vo.hospitalField}</h3>
<h3>전화번호:${vo.serTel}</h3>

<a href="./update"><button type="button" >정보 수정</button></a>
<a href="../reservationManage/manage"><button type="button" >예약 관리 페이지</button></a>
<!-- <img alt="" src="../resources/upload/service/$"> -->


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>