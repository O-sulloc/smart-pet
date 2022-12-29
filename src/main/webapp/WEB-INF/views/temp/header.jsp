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
                                        <a class="page-scroll dd-menu collapsed productMenu"
                                            data-bs-toggle="collapse" data-bs-target="#submenu-1-1"
                                            aria-controls="navbarSupportedContent" aria-expanded="false"
                                            aria-label="Toggle navigation">상품</a>
                                        <ul class="sub-menu collapse" id="submenu-1-1">
                                            <li class="nav-item"><a href="../product/list?kind=pcate&search=1">강아지 용품</a></li>
                                            <li class="nav-item"><a href="../product/list?kind=pcate&search=2">고양이 용품</a></li>
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
                                            aria-label="Toggle navigation">공지사항</a>
                                        <ul class="sub-menu collapse" id="submenu-1-1">
                                            <li class="nav-item"><a href="/notice/list">공지사항</a></li>
                                            <li class="nav-item"><a href="/faq/list?gradeRef=400">FAQ</a></li>
                                        </ul>
                                    </li>
                                    
                                    <c:if test="${empty user}">
										<li class="nav-item">
	                                        <a href="/user/login" aria-label="Toggle navigation">로그인</a>
	                                    </li>
	                                    <li class="nav-item">
	                                        <a href="/user/join" aria-label="Toggle navigation">회원가입</a>
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
		                                            <li class="nav-item"><a href="/user/myPage">관리자 페이지</a></li>
		                                            <li class="nav-item"><a href="/user/admin/userUpdate">회원 등급 관리</a></li>
		                                            <li class="nav-item"><a href="/notice/add">Notice 글 작성</a></li>
		                                            <li class="nav-item"><a href="/faq/add">FAQ 글 작성</a></li>
	                                        	</c:if>
	                                        	
	                                        	<c:if test="${user.role eq 1}"> <!-- 1 상품 판매자 -->
		                                            <li class="nav-item"><a href="/user/sellerList">판매자 페이지</a></li>
		                                            <li class="nav-item"><a href="/product/add">상품 등록</a></li>
		                                            <li class="nav-item"><a href="/user/sellerOrder">판매 내역</a></li>
	                                        	</c:if>
	                                        	
	                                        	<c:if test="${user.role eq 2}"> <!-- 2 일반 회원 -->
		                                            <li class="nav-item"><a href="/user/loginCheck">내 프로필</a></li>
		                                            <li class="nav-item"><a href="/user/petList">반려동물 프로필</a></li>
		                                            <li class="nav-item"><a href="/user/appointment">예약현황</a></li>
		                                            <li class="nav-item"><a href="/cart/list">장바구니</a></li>
		                                            <li class="nav-item"><a href="user/reviewListPage">주문내역</a></li>
	                                        	</c:if>
	                                        	
	                                        	<c:if test="${user.role eq 3}"> <!-- 3 병원/미용 판매자 -->
		                                            <li class="nav-item"><a href="/service/mypage">병원/미용 seller page</a></li>
		                                            <li class="nav-item"><a href="/service/reservationList">예약 리스트</a></li>
		                                            <li class="nav-item"><a href="/service/resState0Page">대기 중인 예약 보기</a></li>
		                                            <li class="nav-item"><a href="/service/getDayReservationList">날짜별 예약 현황 보기</a></li>
		                                            <li class="nav-item"><a href="/service/monthListPage">월별 예약 현황 보기</a></li>
		                                            <li class="nav-item"><a href="user/reviewListPage">Orders</a></li>
	                                        	</c:if>
											<li class="nav-item"><a href="/user/logout">로그아웃</a></li>
	                                        </ul>
                                    	</li>
                                    </c:if>
                                    
                                </ul>
                            </div> <!-- navbar collapse -->
                            <div class="button add-list-button">
                                <a href="/user/appointment" class="btn">예약하기</a>
                            </div>
                        </nav>
                        <!-- End Navbar -->
                    </div>
                </div>
            </div> <!-- row -->
        </div> <!-- container -->
    </header>
    <!-- End Header Area -->
 
 <script type="text/javascript">
 $(".productMenu").click(function(){

	    location.href="../product/list"
});
 
</script>
