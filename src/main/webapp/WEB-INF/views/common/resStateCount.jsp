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

			<c:set var="total" value="0" />	
			<!--총 예약 수 -->
			<c:forEach items="${list}" var="vo">
				<c:set var="total" value="${total+vo.count}" />	
				<c:choose>
					<c:when test="${vo.resState eq 0}">
						<c:set var="state0" value="${vo.count}" />	
					</c:when>
					<c:when test="${vo.resState eq 1}">
						<c:set var="state1" value="${vo.count}" />	
					</c:when>
					<c:when test="${vo.resState eq 2}">
						<c:set var="state2" value="${vo.count}" />	
					</c:when>					
				</c:choose>
				
			</c:forEach>

	<table id="datatablesSimple" class="dataTable-table">
		<thead>
			<tr>
				<th>총 예약 수</th>
				<th>대기중인 예약 수</th>
				<th>승인한 예약 수 </th>
				<th>거부한 예약 수</th>
				<th>예약 취소 수</th>
			</tr>
		</thead>
			
		<tbody>
			<tr>
				<td>
					<c:if test="${total eq null}">0</c:if>
					${total}
				</td>
				<td>
					<c:if test="${state0 eq null}">0</c:if>
					${state0}
				</td>
				<td>
					<c:if test="${state1 eq null}">0</c:if>
					${state1}
				</td>
				<td>
					<c:if test="${state2 eq null}">0</c:if>
					${state2}
				</td>
				<td>나중에 생각하자</td>
			</tr>
			
		</tbody>
	</table>




</body> 
</html>