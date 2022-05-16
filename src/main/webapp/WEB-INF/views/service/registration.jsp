<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../temp/header_css.jsp"></c:import>
<c:import url="../temp/header_script.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>
<h1>서비스 등록 페이지</h1>

</div>
<form action="./registration" method="post" enctype="multipart/form-data">

    <input type="hidden"  name="id" value="${user.id}">
 

  <div class="form-check">
  <input class="form-check-input" type="radio" name="serKind" id="flexRadioDefault1" value="1" checked>
  <label class="form-check-label" for="flexRadioDefault1">
    병원 서비스 
  </label>
</div>
<div class="form-check">
  <input class="form-check-input" type="radio" name="serKind" id="flexRadioDefault2" value="2" >
  <label class="form-check-label" for="flexRadioDefault2">
    미용샵 서비스 
  </label>
  
  <div class="mb-3">
    <label for="serName" class="form-label">상호명</label>
    <input type="text" class="form-control" name="serName">
    <div  class="form-text">상호명을 입력해주세요</div>
  </div>
  <div class="mb-3">
    <label for="serTel" class="form-label">업체 전화번호</label>
    <input type="text" class="form-control" name="serTel">
  </div>
  <div class="mb-3">
    <label for="serAddress" class="form-label">업체 주소</label>
    <input type="text" class="form-control" name="serAddress" >
  </div>
  <div class="mb-3">
    <label for="homepage" class="form-label">홈페이지 주소</label>
    <input type="text" class="form-control" name="homepage">
  </div>
  <div class="mb-3">
    <label for="serTime" class="form-label">영업 시간</label>
    <input type="text" class="form-control" name="serTime">
    <div  class="form-text">ex) 평일 9:00~6:00 토요일:9~2시 매주 수요일 휴무 </div>
  </div>
  <div class="mb-3">
    <label for="hospitalField" class="form-label">진료과목</label>
    <input type="text" name="hospitalField" class="form-control">
    <div  class="form-text">ex)고양이전문, 노령동물 관리 </div>
  </div>
  <div class="mb-3">
    <label for="hospitalField" class="form-label">대표 이미지</label>
    <input type="file" name="file" class="form-control">
  </div>  

  <button type="submit" class="btn btn-primary">등록</button>
</form>

<script type="text/javascript" src="../js/registration.js"></script>
</body>
</html>