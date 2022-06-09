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
                                            aria-label="Toggle navigation">product</a>
                                        <ul class="sub-menu collapse" id="submenu-1-1">
                                            <li class="nav-item"><a href="#">dog</a></li>
                                            <li class="nav-item"><a href="#">cat</a></li>
                                        </ul>
                                    </li>
                                    <li class="nav-item">
                                        <a href="/service/hospitalList" aria-label="Toggle navigation">병원</a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="/service/shopList" aria-label="Toggle navigation">미용샵</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="page-scroll dd-menu collapsed" href="javascript:void(0)"
                                            data-bs-toggle="collapse" data-bs-target="#submenu-1-1"
                                            aria-controls="navbarSupportedContent" aria-expanded="false"
                                            aria-label="Toggle navigation">Notice</a>
                                        <ul class="sub-menu collapse" id="submenu-1-1">
                                            <li class="nav-item"><a href="/notice/list">Notice</a></li>
                                            <li class="nav-item"><a href="/faq/list?gradeRef=400">FAQ</a></li>
                                        </ul>
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
	                                        <a href="/cart/list" aria-label="Toggle navigation"> 
	                                        	<img src="/resources/assets/images/logo/cart_opsz24.svg">
	                                        </a>
	                                    </li>
                                    	<li class="nav-item">
	                                        <a class="page-scroll dd-menu collapsed" href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#submenu-1-2" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	                                        	<img src="/resources/assets/images/logo/user.svg">
	                                        </a>
	                                        <ul class="sub-menu collapse" id="submenu-1-2">
	                                        	<c:if test="${user.role eq 0}"> <!-- 0 관리자 -->
		                                            <li class="nav-item"><a href="/user/myPage">Admin Page</a></li>
		                                            <li class="nav-item"><a href="/user/admin/userUpdate">회원 등급 관리</a></li>
	                                        	</c:if>
	                                        	
	                                        	<c:if test="${user.role eq 1}"> <!-- 1 상품 판매자 -->
		                                            <li class="nav-item"><a href="/user/sellerList">Seller Page</a></li>
		                                            <li class="nav-item"><a href="/user/sellerDetail">판매자 디테일</a></li>
		                                            <li class="nav-item"><a href="/product/add">상품 등록</a></li>
		                                            <li class="nav-item"><a href="/user/sellerOrder">판매 내역</a></li>
	                                        	</c:if>
	                                        	
	                                        	<c:if test="${user.role eq 2}"> <!-- 2 일반 회원 -->
		                                            <li class="nav-item"><a href="/user/loginCheck">My Profile</a></li>
		                                            <li class="nav-item"><a href="/user/petList">Pet Profile</a></li>
		                                            <li class="nav-item"><a href="/user/appointment">Appointment</a></li>
		                                            <li class="nav-item"><a href="/cart/list">Cart</a></li>
		                                            <li class="nav-item"><a href="user/reviewListPage">Orders</a></li>
	                                        	</c:if>
	                                        	
	                                        	<c:if test="${user.role eq 3}"> <!-- 3 병원/미용 판매자 -->
		                                            <li class="nav-item"><a href="/service/mypage">병원/미용 seller page</a></li>
		                                            <li class="nav-item"><a href="/service/reservationList">예약 리스트</a></li>
		                                            <li class="nav-item"><a href="/service/resState0Page">대기 중인 예약 보기</a></li>
		                                            <li class="nav-item"><a href="/service/getDayReservationList">날짜별 예약 현황 보기</a></li>
		                                            <li class="nav-item"><a href="/service/monthListPage">월별 예약 현황 보기</a></li>
		                                            <li class="nav-item"><a href="user/reviewListPage">Orders</a></li>
	                                        	</c:if>
											<li class="nav-item"><a href="/user/logout">Logout</a></li>
	                                        </ul>
                                    	</li>
                                    </c:if>
                                    
                                </ul>
                            </div> <!-- navbar collapse -->
                            <div class="button add-list-button">
                                <a href="/user/appointment" class="btn">Book Appointment</a>
                            </div>
                        </nav>
                        <!-- End Navbar -->
                    </div>
                </div>
            </div> <!-- row -->
        </div> <!-- container -->
    </header>
    <!-- End Header Area -->
 