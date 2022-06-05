<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <!-- Preloader -->
    <div class="preloader">
        <div class="preloader-inner">
            <div class="preloader-icon">
                <span></span>
                <span></span>
            </div>
        </div>
    </div>
    <!-- /End Preloader -->
    
    <!-- Start Header Area -->
    <header class="header navbar-area">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-12">
                    <div class="nav-inner">
                        <!-- Start Navbar -->
                        <nav class="navbar navbar-expand-lg">
                            <a class="navbar-brand" href="/">
                                <img src="/resources/assets/images/logo/logo.svg" alt="Logo">
                            </a>
                            <button class="navbar-toggler mobile-menu-btn" type="button" data-bs-toggle="collapse"
                                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                                <span class="toggler-icon"></span>
                                <span class="toggler-icon"></span>
                                <span class="toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse sub-menu-bar" id="navbarSupportedContent">
                                <ul id="nav" class="navbar-nav ms-auto">
                                    <li class="nav-item">
                                        <a class="page-scroll dd-menu collapsed" href="javascript:void(0)"
                                            data-bs-toggle="collapse" data-bs-target="#submenu-1-1"
                                            aria-controls="navbarSupportedContent" aria-expanded="false"
                                            aria-label="Toggle navigation">상품</a>
                                        <ul class="sub-menu collapse" id="submenu-1-1">
                                            <li class="nav-item"><a href="#">강아지 물품</a></li>
                                            <li class="nav-item"><a href="#">고양이 물품</a></li>
                                        </ul>
                                    </li>
                                    <li class="nav-item">
                                        <a class="page-scroll dd-menu collapsed" href="javascript:void(0)"
                                            data-bs-toggle="collapse" data-bs-target="#submenu-1-2"
                                            aria-controls="navbarSupportedContent" aria-expanded="false"
                                            aria-label="Toggle navigation">병원</a>
                                        <ul class="sub-menu collapse" id="submenu-1-2">
                                            <li class="nav-item"><a href="about-us.jsp">About Us</a></li>
                                        </ul>
                                    </li>
                                    <li class="nav-item">
                                        <a href="javascript:void(0)" aria-label="Toggle navigation">미용샵</a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="javascript:void(0)" aria-label="Toggle navigation">관리자페이지</a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../notice/list" aria-label="Toggle navigation">고객센터</a>
                                    </li>
                                    <c:if test="${empty user}">
										<li class="nav-item">
	                                        <a href="/user/login" aria-label="Toggle navigation">login</a>
	                                    </li>
	                                    <li class="nav-item">
	                                        <a href="/user/join" aria-label="Toggle navigation">join</a>
	                                    </li>
                                    </c:if>
                                    <c:if test="${not empty user}">
                                    	<li class="nav-item">
	                                        <a class="page-scroll dd-menu collapsed" href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#submenu-1-2" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	                                        	<img src="/resources/assets/images/logo/user.svg">
	                                        </a>
	                                        <ul class="sub-menu collapse" id="submenu-1-2">
	                                            <li class="nav-item"><a href="/user/loginCheck">내 정보</a></li>
	                                            <li class="nav-item"><a href="/user/petList">내 펫 관리</a></li>
	                                            <li class="nav-item"><a href="#">장바구니</a></li>
	                                            <li class="nav-item"><a href="/reservation/confirmList">예약</a></li>
	                                            <li class="nav-item"><a href="/user/logout">로그아웃</a></li>
	                                        </ul>
                                    	</li>
                                    </c:if>
                                </ul>
                            </div> <!-- navbar collapse -->
                            <div class="button add-list-button">
                                <a href="javascript:void(0)" class="btn">Book Appointment</a>
                            </div>
                        </nav>
                        <!-- End Navbar -->
                    </div>
                </div>
            </div> <!-- row -->
        </div> <!-- container -->
    </header>
    <!-- End Header Area -->
 