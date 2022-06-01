<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>회원관리</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>


<div class="container-fluid mt-3">
    <div class="row">

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">회원관리</h1>
            </div>
            <div class="table-responsive">
                <table class="table table-striped table-sm">
                    <thead>
                    <tr>
                        <th scope="col">UserID</th>
                        <th scope="col">UserName</th>
                        <th scope="col">UserPhone</th>
                        <th scope="col">UserEmail</th>
                        <th scope="col">UserAddress</th>
                        <th scope="col">JoinDate</th>
                        <th scope="col">UpdateRole</th>
                        <th scope="col">UserPoint</th>
                        <th scope="col">Update</th>
                    </tr>
                    </thead>
                    <tbody>
	                    <c:forEach items="${list}" var="user">
	                    <div>
	                    	<p>${user.id}</p>
	                    </div>
		                <tr>
                 				
	                            <td>${user.id}</td>
	                            <td>${user.name}</td>
	                            <td>${user.phone}</td>
	                            <td>${user.email}</td>
	                            <td>${user.address}</td>
	                            <td>${user.joinDate}</td>
	                            <td>
	                                <select name="role">
	                                    <option value="ROLE_SELLER">ROLE_SELLER</option>
	                                    <option value="ROLE_USER">ROLE_USER</option>
	                                </select>
	                            </td>
	                            <td>${user.point}</td>
	                            <td>
	                                <button class="btn btn-outline-dark flex-shrink-0" type="submit">
	                                    업데이트
	                                </button>
	                            </td>
                  			
		                </tr>
	                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
</div>
</body>
</html>