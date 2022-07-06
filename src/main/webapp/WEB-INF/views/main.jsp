<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <title>꿀비 : 기부 마켓 재능 모임을 한곳에!</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">
	<!--font-awesome  -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap" rel="stylesheet"> 

   <!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link
	href="${appRoot }/resources/webContents/lib/animate/animate.min.css"
	rel="stylesheet">
<link
	href="${appRoot }/resources/webContents/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="${appRoot }/resources/webContents/lib/lightbox/css/lightbox.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="${appRoot }/resources/webContents/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Template Stylesheet -->
<link href="${appRoot }/resources/webContents/css/style.css"
	rel="stylesheet">

<!-- Jquery -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	referrerpolicy="no-referrer"></script>

</head>

<style>
body{
	color: #000000 !important
}
.center{
	display: flex;
	align-items: center;
	justify-content: center;
}
#tagName1{
	font-size: 1.25rem;
	font-weight: 700;
}
.temp{
	width: 165px !important;
	height: 70px;
	background: #fff;
	border: 2px solid #f48fb1;
	border-radius: 100px;
	font-family: sans-serif;
	font-size: 30px;
	font-weight: 700;
	text-align: center;
	vertical-align: 20%;
	
}
.right{
	display: flex;
	align-items: flex-end;
	justify-content: flex-end;
}
.main_image{
	height: 40px;
	padding-top : 50px;
	padding-right : 50px;
	padding-bottom: 30px;
}
.input-outline-success{
	border: 2px;
}

.team-item{
	margin 0px auto;
	overflow: hidden;
	transition: all 0.2s linear;
}

.team-item:hover{
	transform: scale(1.1);
}

.service-icon{
	background-color: orange !important;
	margin 0px auto;
	overflow: hidden;
	transition: all 0.2s linear;
}

.service-icon:hover{
	transform: scale(1.4);
}

#card{
	margin 0px auto;
	transition: all 0.2s linear;
}

#card:hover{
	transform: scale(1.1);
}

#hashTag{
	opacity: 0.8;
}
</style>

<body>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->

	<!-- navbar -->
	<my:mainNavBar current="main"></my:mainNavBar>

	<!-- About Start -->
    <div class="container-fluid overflow-hidden px-lg-0" style="background-color: #fff">
        <div class="container about px-lg-0">
            <div class="row g-0 mx-lg-0">
                
                <div class="col-lg-6 about-text py-5 wow fadeIn" data-wow-delay="0.5s" id="hashTag">
                    <div class="p-lg-5 pe-lg-0">
                        <h1 class="mb-4">기부 마켓 No.1 꿀비에서 원하는 기부를 찾아보세요!</h1>
                        <form action="${appRoot }/search"class="d-flex" role="search">
                       		<div class="input-group mb-2" style="width: 600px">
                       			<input type="hidden" name="type" value="donation" />
					     		<input class="form-control input-secondary" type="search" name="keyword" placeholder="Search" aria-label="Search">
					     		<button class="btn btn-warning" type="submit"><i class="fa-solid fa-magnifying-glass" style="color: white"></i></button>
					     	</div>
					    </form>
                        <a href="${appRoot }/search?type=donation&keyword=우크라이나" class="btn  rounded-pill py-1 px-3 mt-3" style="color:red; border-color: red;">#우크라이나</a>
                        <a href="${appRoot }/search?type=donation&keyword=임시1" class="btn  rounded-pill py-1 px-3 mt-3" style="color:pink; border-color: pink;">#임시1</a>
                        <a href="${appRoot }/search?type=donation&keyword=임시2" class="btn  rounded-pill py-1 px-3 mt-3" style="color:green; border-color: green;">#임시2</a>
                        <a href="${appRoot }/search?type=donation&keyword=임시3" class="btn  rounded-pill py-1 px-3 mt-3" style="color:orange; border-color: orange;">#임시3</a>
                        <a href="${appRoot }/search?type=donation&keyword=임시4" class="btn  rounded-pill py-1 px-3 mt-3" style="color:brown; border-color: brown;">#임시4</a>
                    </div>
                </div>
                
                <div class="col-lg-6 ps-lg-0 wow fadeIn main_image" data-wow-delay="0.1s" style="min-height: 400px;">
                    <div class="position-relative h-100 ">
                        <img class="position-absolute img-fluid w-100 h-100 " src="${appRoot}/resources/main_donation.jpg" style="object-fit: cover;" alt="">
                    </div>
                </div>
                
            </div>
        </div>
    </div>
    <!-- About End -->


	<!-- Feature Start -->
    <div class="py-5 " style="background: #fbc02d;">
    	
        <div class="container right">
        	<div>
	            <div class="row" >

	                <div class="col-md-6 col-lg-4 wow fadeIn mx-3">
	                    <div class="d-flex align-items-center mb-4">
	                        <div class="btn-lg-square bg-primary rounded-circle me-3">
	                            <i class="fa-solid fa-hand-holding-dollar fa-2xl text-white"></i>
	                        </div>
	                        <h1 class="mb-0" data-toggle="counter-up">${sum }</h1>
	                    </div>
	                    <h5 class="mb-3">우리가 함께 모은 기부금</h5>
	                    <span>Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit</span>
	                </div>
	                
	                
	                <div class="col-md-6 col-lg-4 wow fadeIn mx-3">
	                    <div class="d-flex align-items-center mb-4">
	                        <div class="btn-lg-square bg-primary rounded-circle me-3">
	                            <i class="fa-solid fa-people-group fa-2xl text-white"></i>
	                        </div>
	                        <h1 class="mb-0" data-toggle="counter-up">${count }</h1>
	                    </div>
	                    <h5 class="mb-3">꿀비를 이용하고 있는 고객분들</h5>
	                    <span>Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit</span>
	                </div>
	                
	            </div>
            </div>
        </div>
    </div>
    <!-- Feature Start -->

	 <!-- Feature Start -->
    <div class="container-xxl py-5">
    	<div class="row" id="tagName1">인기 있는 기부 #태그</div>
	        <div class="container center">
	        	
	            <div class="row g-5">
	            
	                <div class="temp">
	                	<a href="/honeybee/donation/main">#기부</a>
	                </div>
	                &nbsp;&nbsp;
	                <div class="temp">
	                	<a href="">#강좌</a>
	                </div>
	                &nbsp;&nbsp;
	                <div class="temp">
	                	<a href="">#유튜브</a>
	                </div>
	                &nbsp;&nbsp;
	                <div class="temp">
	                	<a href="">#고먐미</a>
	                </div>
	                &nbsp;&nbsp;
	                <div class="temp">
	                	<a href="">#댕댕이</a>
	                </div>
	                
	            </div>
	        </div>
    </div>
    <!-- Team Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                <h6 class="text-primary">인기 급상승!</h6>
                <h1 class="mb-4">진행중인 인기 컨텐츠</h1>
            </div>
            <div class="row g-4" id="contents">
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="team-item">
                        <div class="d-flex">
                            <img class="img-fluid w-75" src="https://cdn.class101.net/images/ad53f654-9f05-4050-a68c-c876869992d5/375xauto.webp" alt="">
                            <div class="team-social w-25">
                            </div>
                        </div>
                        <div class="p-4">
                            <h5>신사임당</h5>
                            <span>가장 빠르게 돈 버는 유튜브 채널 만드는 방법</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="team-item">
                        <div class="d-flex">
                            <img class="img-fluid w-75" src="https://cdn.class101.net/images/cf96702c-677f-4c37-951d-69c9d40376ed/750xauto.webp" alt="">
                            <div class="team-social w-25">
                            </div>
                        </div>
                        <div class="p-4">
                            <h5>선한부자 오가닉</h5>
                            <span>자동으로 매달 천만원씩 통장에 들어오는 &nbsp; &#60;구글 온라인 자동화수익 만들기&#62;</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="team-item">
                        <div class="d-flex">
                            <img class="img-fluid w-75" src="https://cdn.class101.net/images/d106f91b-e912-4d39-ae86-83c6907ce964/750xauto.webp" alt="">
                            <div class="team-social w-25">
                            </div>
                        </div>
                        <div class="p-4">
                            <h5>라이프해커 자청</h5>
                            <span>월 999만원 자동수익, 경제적 자유 얻는 구체적 가이드 라인</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Team End -->
    
    <!-- Feature Start -->

    <!-- Service Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                <h6 class="text-primary">꿀비 컨텐츠</h6>
                <h1 class="mb-4">여러분도 동참해보세요~!</h1>
            </div>
            <div class="row g-4">
                <div class="col-md-6 col-lg-4 h-100 wow fadeInUp" data-wow-delay="0.1s" id="card">
                    <div class="service-item rounded overflow-hidden" id="card">
                        <img class="img-fluid" src="img/img-600x400-4.jpg" alt="">
                        <div class="position-relative p-4 pt-0">
                            <div class="service-icon">
                                <i class="fa-solid fa-hands-holding-circle fa-2xl text-white"></i>
                            </div>
                            <h4 class="mb-3">재능 판매</h4>
                            <p>꿀비와 함께라면 여러분도 강사님!</p>
                            <a class="small fw-medium" href="${appRoot }/talent/main">더 알아보기<i class="fa fa-arrow-right ms-2"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 h-100 wow fadeInUp" data-wow-delay="0.3s" id="card">
                    <div class="service-item rounded overflow-hidden" id="card">
                        <img class="img-fluid" src="img/img-600x400-5.jpg" alt="">
                        <div class="position-relative p-4 pt-0">
                            <div class="service-icon">
                               <i class="fa-solid fa-hand-holding-dollar fa-2xl text-white"></i>
                            </div>
                            <h4 class="mb-3">기부</h4>
                            <p>여러분의 행복한 나눔을 통해 어려운 이웃들을 보살펴주세요.</p>
                            <a class="small fw-medium" href="${appRoot }/donation/main">더 알아보기<i class="fa fa-arrow-right ms-2"></i></a>
                        </div>
                    </div>
                </div>
                 <div class="col-md-6 col-lg-4 h-100 wow fadeInUp" data-wow-delay="0.3s" id="card">
                    <div class="service-item rounded overflow-hidden" id="card">
                        <img class="img-fluid" src="img/img-600x400-5.jpg" alt="">
                        <div class="position-relative p-4 pt-0">
                            <div class="service-icon">
                               <i class="fa-solid fa-handshake-simple fa-2xl text-white"></i>
                            </div>
                            <h4 class="mb-3">모임</h4>
                            <p>작고 소중한 꿀비들의 모임터♥</p>
                            <a class="small fw-medium" href="${appRoot }/meeting/main">더 알아보기<i class="fa fa-arrow-right ms-2"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Service End -->


    <!-- Feature Start -->
    <div class="container-fluid bg-light overflow-hidden my-5 px-lg-0">
        <div class="container feature px-lg-0">
            <div class="row g-0 mx-lg-0">
                <div class="col-lg-6 feature-text py-5 wow fadeIn" data-wow-delay="0.1s">
                    <div class="p-lg-5 ps-lg-0">
                        <h6 class="text-primary">Why Choose Us!</h6>
                        <h1 class="mb-4">내게 필요한 모든 전문가를 만날 수 있는 꿀비!</h1>
                        <p class="mb-4 pb-2">여러가지 카테고리, 서비스에서 여러분에게 필요한 모든 전문가를 만나보세요.</p>
                        <div class="row g-4">
                            <div class="col-6">
                                <div class="d-flex align-items-center">
                                    <div class="btn-lg-square bg-primary rounded-circle">
                                        <i class="fa fa-check text-white"></i>
                                    </div>
                                    <div class="ms-4">
                                        <p class="mb-0">강의</p>
                                        <h5 class="mb-0">THE BEST 강좌 모음</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="d-flex align-items-center">
                                    <div class="btn-lg-square bg-primary rounded-circle">
                                        <i class="fa fa-user-check text-white"></i>
                                    </div>
                                    <div class="ms-4">
                                        <p class="mb-0">전문가</p>
                                        <h5 class="mb-0">검증된 선생님들</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="d-flex align-items-center">
                                    <div class="btn-lg-square bg-primary rounded-circle">
                                        <i class="fa fa-drafting-compass text-white"></i>
                                    </div>
                                    <div class="ms-4">
                                        <p class="mb-0">무료</p>
                                        <h5 class="mb-0">다양한 무료 강의들</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="d-flex align-items-center">
                                    <div class="btn-lg-square bg-primary rounded-circle">
                                        <i class="fa fa-headphones text-white"></i>
                                    </div>
                                    <div class="ms-4">
                                        <p class="mb-0">고객</p>
                                        <h5 class="mb-0">서포트</h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 pe-lg-0 wow fadeIn" data-wow-delay="0.5s" style="min-height: 400px;">
                    <div class="position-relative h-100">
                        <img class="position-absolute img-fluid w-100 h-100" src="https://cdn.pixabay.com/photo/2020/08/04/08/10/woman-5462074_960_720.jpg" style="object-fit: cover;" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Feature End -->

<!-- 슬라이드 -->
	<div id="carouselExampleInterval" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active" data-bs-interval="10000">
				<img
					src="https://mud-kage.kakaocdn.net/dn/cI8SiF/btqjFmjZaut/2R9mbQpxuxVKlt7R8lkJGk/img.png"
					class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item" data-bs-interval="8000">
				<img
					src="https://mud-kage.kakaocdn.net/dn/NbtUx/btqjAdPaCaj/hG6waxVbS0Ya62xcILA2W1/img.png"
					class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item" data-bs-interval="8000">
				<img
					src="https://mud-kage.kakaocdn.net/dn/h7DcA/btqjJbIJvZy/auLAPsDnLXcQEMUs32GK11/img.png"
					class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item" data-bs-interval="8000">
				<img
					src="https://mud-kage.kakaocdn.net/dn/ccnkLH/btqjGVl7Q9p/gSvibw8pJMDdihTCB9aFw1/img.png"
					class="d-block w-100" alt="...">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="visually-hidden">이전</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleInterval" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="visually-hidden">다음</span>
		</button>
	</div>
	
	<nav:footbar_kim></nav:footbar_kim>
    

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>


<!-- JavaScript Libraries -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${appRoot }/resources/webContents/lib/wow/wow.min.js"></script>
	<script
		src="${appRoot }/resources/webContents/lib/easing/easing.min.js"></script>
	<script
		src="${appRoot }/resources/webContents/lib/waypoints/waypoints.min.js"></script>
	<script
		src="${appRoot }/resources/webContents/lib/counterup/counterup.min.js"></script>
	<script
		src="${appRoot }/resources/webContents/lib/owlcarousel/owl.carousel.min.js"></script>
	<script
		src="${appRoot }/resources/webContents/lib/isotope/isotope.pkgd.min.js"></script>
	<script
		src="${appRoot }/resources/webContents/lib/lightbox/js/lightbox.min.js"></script>

	<!-- Template Javascript -->
	<script src="${appRoot }/resources/webContents/js/main.js"></script>
</body>

</html>