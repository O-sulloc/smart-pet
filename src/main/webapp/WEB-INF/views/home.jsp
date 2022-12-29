<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<c:import url="./temp/header_script.jsp"></c:import>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Home</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="./resources/assets/images/favicon.svg" />
    <!-- Place favicon.ico in the root directory -->

    <!-- Web Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

    <link
        href="https://fonts.googleapis.com/css2?family=Merriweather:ital,wght@0,300;0,400;0,700;0,900;1,300;1,400;1,700;1,900&display=swap"
        rel="stylesheet">


    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="./resources/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="./resources/assets/css/LineIcons.2.0.css" />
    <link rel="stylesheet" href="./resources/assets/css/animate.css" />
    <link rel="stylesheet" href="./resources/assets/css/tiny-slider.css" />
    <link rel="stylesheet" href="./resources/assets/css/glightbox.min.css" />
    <link rel="stylesheet" href="./resources/assets/css/main.css" />
    <script src="https://kit.fontawesome.com/c996879092.js" crossorigin="anonymous"></script>

</head>

<body>	
	<c:import url="./temp/header.jsp"></c:import>

    <!-- Start Hero Area -->
    <section class="hero-area ">
        <div class="shapes">
            <img src="./resources/assets/images/hero/05.svg" class="shape1" alt="#">
            <img src="./resources/assets/images/hero/01.svg" class="shape2" alt="#">
        </div>
        <div class="hero-slider">
            <!-- Start Single Slider -->
            <div class="single-slider">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-12 col-12">
                            <div class="hero-text">
                                <!-- Start Hero Text -->
                                <div class="section-heading">
                                    <h2 class="wow fadeInLeft" data-wow-delay=".3s">동물병원, 미용샵 <br>예약하기
                                    </h2>
                                    <p class="wow fadeInLeft" data-wow-delay=".5s">자주 방문하는 동물병원과 미용샵. 이제 집에서 간편하게 예약하세요!</p>
                                    <div class="button wow fadeInLeft" data-wow-delay=".7s">
                                        <a href="appointment.html" class="btn">바로 예약</a>
                                        <a href="./stores/test?rowNum=12&pageNo=1" class="btn">동물병원 찾기</a>
                                    </div>
                                </div>
                                <!-- End Hero Text -->
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-12 col-12">
                            <div class="hero-image wow fadeInRight" data-wow-delay=".5s">
                                <img src="./resources/assets/images/hero/bg.png" alt="#">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Single Slider -->
            <!-- Start Single Slider -->
            <div class="single-slider">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-12 col-12">
                            <div class="hero-text wow fadeInLeft" data-wow-delay=".3s">
                                <!-- Start Hero Text -->
                                <div class="section-heading">
                                    <h2>SNS를 휩쓴 검증된 애견용품<br> 지금 바로 만나보세요</h2>
                                    <p>트위터, 인스타그램 각종 SNS에서 화재가 된 그 상품! 지금 바로 구매하실 수 있습니다.</p>
                                    <div class="button">
                                        <a href="http://localhost/product/list?kind=pcate&search=1" class="btn">강아지 용품</a>
                                        <a href="http://localhost/product/list?kind=pcate&search=2" class="btn">고양이 용품</a>
                                    </div>
                                </div>
                                <!-- End Hero Text -->
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-12 col-12">
                            <div class="hero-image">
                                <img src="./resources/assets/images/hero/bg_1.png" alt="#">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Single Slider -->

        </div>
    </section>
    <!-- End Hero Area -->

    <!-- Start Appointment Area -->
    <section class="appointment">
        <div class="container">
            <!-- Appointment Form -->
            <div class="appointment-form">
                <div class="row">
                    <div class="col-lg-6 col-12">
                        <div class="appointment-title">
                            <span>Appointment</span>
                            <h2>Book An Appointment</h2>
                            <p>Please feel welcome to contact our friendly reception staff with any general or medical
                                enquiry. Our doctors will receive or return any urgent calls.</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-12 p-0">
                        <div class="appointment-input">
                            <label for="name"><i class="lni lni-user"></i></label>
                            <input type="text" name="name" id="name" placeholder="Your Name">
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-12 p-0">
                        <div class="appointment-input">
                            <label for="email"><i class="lni lni-envelope"></i></label>
                            <input type="email" name="email" id="email" placeholder="Your Email">
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-12 p-0">
                        <div class="appointment-input">
                            <label for="department"><i class="lni lni-notepad"></i></label>
                            <select name="department" id="department">
                                <option value="none" selected disabled>Department</option>
                                <option value="none">General Surgery</option>
                                <option value="none">Gastroenterology</option>
                                <option value="none">Nutrition & Dietetics</option>
                                <option value="none">Cardiology</option>
                                <option value="none">Neurology</option>
                                <option value="none">Pediatric</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-12 custom-padding">
                        <div class="appointment-btn button">
                            <button class="btn">Get Appointment</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Appointment Form -->
        </div>
    </section>
    <!-- End Appointment Area -->

    <!-- Start About Area -->
    <section class="about-us section">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-12 col-12">
                    <div class="content-left wow fadeInLeft" data-wow-delay=".3s">
                        <img src="./resources/assets/images/about/about.png" alt="#">
                        <a href="https://www.youtube.com/watch?v=r44RKWyfcFw&fbclid=IwAR21beSJORalzmzokxDRcGfkZA1AtRTE__l5N4r09HcGS5Y6vOluyouM9EM"
                            class="glightbox video"><i class="lni lni-play"></i></a>
                    </div>
                </div>
                <div class="col-lg-6 col-md-12 col-12">
                    <!-- content-1 start -->
                    <div class="content-right wow fadeInRight" data-wow-delay=".5s">
                        <span class="sub-heading">About</span>
                        <h2>Thousands of specialities for any
                            type diagnostic.</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eius mod tempor incididunt
                            ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                            laboris nisi aliquip ex ea commodo consequat.</p>
                        <div class="row">
                            <div class="col-lg-6 col-12">
                                <ul class="list">
                                    <li><i class="lni lni-checkbox"></i>Conducts eye health checkups</li>
                                    <li><i class="lni lni-checkbox"></i>Best lasik treatment</li>
                                    <li><i class="lni lni-checkbox"></i>Treats minor illnesses</li>
                                </ul>
                            </div>
                            <div class="col-lg-6 col-12">
                                <ul class="list">
                                    <li><i class="lni lni-checkbox"></i>Special eye exam</li>
                                    <li><i class="lni lni-checkbox"></i>Contact lens service</li>
                                    <li><i class="lni lni-checkbox"></i>Special Retina exam</li>
                                </ul>
                            </div>
                        </div>
                        <div class="button">
                            <a href="about-us.html" class="btn">More About Us</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End About Area -->

    <!-- Start Call Action Area -->
    <section class="call-action section">
        <div class="container">
            <div class="row ">
                <div class="col-lg-8 offset-lg-2 col-12">
                    <div class="inner">
                        <div class="content">
                            <h2 class="wow fadeInUp" data-wow-delay=".4s">Currently You are using free<br>
                                Lite version of MediGrids</h2>
                            <p class="wow fadeInUp" data-wow-delay=".6s">Please, purchase full version of the template to get all pages,<br> features and commercial license.</p>
                            <div class="button wow fadeInUp" data-wow-delay=".8s">
                                <a href="javascript:void(0)" class="btn">Purchase Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Call Action Area -->

    <!-- Start Achievement Area -->
    <section class="our-achievement section">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-12">
                    <div class="single-achievement wow fadeInUp" data-wow-delay=".2s">
                        <i class="lni lni-apartment"></i>
                        <h3 class="counter"><span id="secondo1" class="countup" cup-end="1250">1250</span></h3>
                        <p>Hospital Rooms</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-12">
                    <div class="single-achievement wow fadeInUp" data-wow-delay=".4s">
                        <i class="lni lni-sthethoscope"></i>
                        <h3 class="counter"><span id="secondo2" class="countup" cup-end="350">350</span></h3>
                        <p>Specialist Doctors</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-12">
                    <div class="single-achievement wow fadeInUp" data-wow-delay=".6s">
                        <i class="lni lni-emoji-smile"></i>
                        <h3 class="counter"><span id="secondo3" class="countup" cup-end="2500">2500</span></h3>
                        <p>Happy Patients</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-12">
                    <div class="single-achievement wow fadeInUp" data-wow-delay=".6s">
                        <i class="lni lni-certificate"></i>
                        <h3 class="counter"><span id="secondo3" class="countup" cup-end="35">35</span></h3>
                        <p>Years of Experience</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Achievement Area -->

    <!-- Start Pricing Table Area -->
    <section class="pricing-table section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h3>pricing</h3>
                        <h2 class="wow fadeInUp" data-wow-delay=".4s">Pricing Plan</h2>
                        <p class="wow fadeInUp" data-wow-delay=".6s">There are many variations of passages of Lorem
                            Ipsum available, but the majority have suffered alteration in some form.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6 col-12">
                    <!-- Single Table -->
                    <div class="single-table wow fadeInUp" data-wow-delay=".2s">
                        <!-- Table Head -->
                        <div class="table-head">
                            <h4 class="title">Basic</h4>
                            <div class="price">
                                <h2 class="amount">$45<span class="duration">/ Monthly</span></h2>
                            </div>
                        </div>
                        <!-- End Table Head -->
                        <!-- Table List -->
                        <ul class="table-list">
                            <li>Routine Checkup</li>
                            <li>24Th Assisance</li>
                            <li>100 Text & Treatments</li>
                            <li>Regular Health Checkups</li>
                        </ul>
                        <!-- End Table List -->
                        <!-- Table Bottom -->
                        <div class="button">
                            <a class="btn" href="javascript:void(0)">Make Payment</a>
                        </div>
                        <!-- End Table Bottom -->
                    </div>
                    <!-- End Single Table-->
                </div>
                <div class="col-lg-4 col-md-6 col-12">
                    <!-- Single Table -->
                    <div class="single-table wow fadeInUp" data-wow-delay=".4s">
                        <!-- Table Head -->
                        <div class="table-head">
                            <h4 class="title">Advance</h4>
                            <div class="price">
                                <h2 class="amount">$204<span class="duration">/ Monthly</span></h2>
                            </div>
                        </div>
                        <!-- End Table Head -->
                        <!-- Table List -->
                        <ul class="table-list">
                            <li>Routine Checkup</li>
                            <li>24Th Assisance</li>
                            <li>100 Text & Treatments</li>
                            <li>Regular Health Checkups</li>
                        </ul>
                        <!-- End Table List -->
                        <!-- Table Bottom -->
                        <div class="button">
                            <a class="btn" href="javascript:void(0)">Make Payment</a>
                        </div>
                        <!-- End Table Bottom -->
                    </div>
                    <!-- End Single Table-->
                </div>
                <div class="col-lg-4 col-md-6 col-12">
                    <!-- Single Table -->
                    <div class="single-table wow fadeInUp" data-wow-delay=".6s">
                        <!-- Table Head -->
                        <div class="table-head">
                            <h4 class="title">Premium</h4>
                            <div class="price">
                                <h2 class="amount">$355<span class="duration">/ Monthly</span></h2>
                            </div>
                        </div>
                        <!-- End Table Head -->
                        <!-- Table List -->
                        <ul class="table-list">
                            <li>Routine Checkup</li>
                            <li>24Th Assisance</li>
                            <li>100 Text & Treatments</li>
                            <li>Regular Health Checkups</li>
                        </ul>
                        <!-- End Table List -->
                        <!-- Table Bottom -->
                        <div class="button">
                            <a class="btn" href="javascript:void(0)">Make Payment</a>
                        </div>
                        <!-- End Table Bottom -->
                    </div>
                    <!-- End Single Table-->
                </div>
            </div>
        </div>
    </section>
    <!--/ End Pricing Table Area -->
    
    <c:import url="./temp/footer.jsp"></c:import>

    <!-- ========================= JS here ========================= -->
    <script src="./resources/assets/js/bootstrap.min.js"></script>
    <script src="./resources/assets/js/wow.min.js"></script>
    <script src="./resources/assets/js/tiny-slider.js"></script>
    <script src="./resources/assets/js/glightbox.min.js"></script>
    <script src="./resources/assets/js/count-up.min.js"></script>
    <script src="./resources/assets/js/imagesloaded.min.js"></script>
    <script src="./resources/assets/js/isotope.min.js"></script>
    <script src="./resources/assets/js/main.js"></script>
    <script type="text/javascript">
        //======== Hero Slider
        var slider = new tns({
            container: '.hero-slider',
            slideBy: 'page',
            autoplay: true,
            autoplayButtonOutput: false,
            mouseDrag: true,
            gutter: 0,
            items: 1,
            nav: false,
            controls: true,
            controlsText: [
                '<i class="lni lni-chevron-left"></i>',
                '<i class="lni lni-chevron-right"></i>'
            ],
            responsive: {
                1200: {
                    items: 1,
                },
                992: {
                    items: 1,
                },
                0: {
                    items: 1,
                }
            }
        });
        //========= testimonial 
        /* tns({
            container: '.testimonial-slider',
            items: 3,
            slideBy: 'page',
            autoplay: false,
            mouseDrag: true,
            gutter: 0,
            nav: true,
            controls: false,
            controlsText: ['<i class="lni lni-arrow-left"></i>', '<i class="lni lni-arrow-right"></i>'],
            responsive: {
                0: {
                    items: 1,
                },
                540: {
                    items: 1,
                },
                768: {
                    items: 2,
                },
                992: {
                    items: 2,
                },
                1170: {
                    items: 3,
                }
            }
        }); */
        //====== counter up 
        var cu = new counterUp({
            start: 0,
            duration: 2000,
            intvalues: true,
            interval: 100,
            append: " ",
        });
        cu.start();
        //========= glightbox
        GLightbox({
            'href': 'https://www.youtube.com/watch?v=r44RKWyfcFw&fbclid=IwAR21beSJORalzmzokxDRcGfkZA1AtRTE__l5N4r09HcGS5Y6vOluyouM9EM',
            'type': 'video',
            'source': 'youtube', //vimeo, youtube or local
            'width': 900,
            'autoplayVideos': true,
        });
        //============== isotope masonry js with imagesloaded
        imagesLoaded('#container', function () {
            var elem = document.querySelector('.grid');
            var iso = new Isotope(elem, {
                // options
                itemSelector: '.grid-item',
                masonry: {
                    // use outer width of grid-sizer for columnWidth
                    columnWidth: '.grid-item'
                }
            });
            let filterButtons = document.querySelectorAll('.portfolio-btn-wrapper button');
            filterButtons.forEach(e =>
                e.addEventListener('click', () => {
                    let filterValue = event.target.getAttribute('data-filter');
                    iso.arrange({
                        filter: filterValue
                    });
                })
            );
        });
    </script>
</body>

</html>