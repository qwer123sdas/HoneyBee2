<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>재능 공유 게시판 메인 화면</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${appRoot }/resources/webContents/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${appRoot }/resources/webContents/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${appRoot }/resources/webContents/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${appRoot }/resources/webContents/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${appRoot }/resources/webContents/css/style.css" rel="stylesheet">
</head>
<style>
/* 카테고리 */
	.group_catelist {
	    width: 1000px;
	    margin: 0 auto;
	    text-align: center;
	}
	
	.group_catelist .inner_catelist {
		display:inline-block;
	}
	
	.group_catelist .inner_catelist ul {
	    overflow: hidden;
	    padding: 57px 5px 48px;
	    text-align: center;
	}
	
	.group_catelist .inner_catelist li {
	    float: left;
	    width: 80px;
	}
	
	.group_catelist .inner_catelist a {
		display: block;
		filter: grayscale(100%); 
	}
	/*  */
.page-header-main {
    background: linear-gradient(rgba(0, 0, 0, .1), rgba(0, 0, 0, .1)), url(../resources/webContents/img/carousel-2.jpg) center center no-repeat;
    background-size: cover;
    margin-top : 75px;
}
.image {
	object-fit: cover;
	width: 100%;
	height: 150px;
}
.nickName-body{
	font-size : 14px;
}
.title-body{
	font-size : 20px;
	display: flex;
}
.price-body{
	font-size : 17px;
	font-weight: bold;
	color : rgb(48, 52, 65);
	display: flex;
	justify-content: flex-end; 
}
/* 별점 */
@charset "UTF-8";
:root {
  --star-size: 14px;
  --star-color: #F6F7F8;
  --star-background: #fc0;
}

.Stars {
  --percent: calc(var(--rating) / 5 * 100%);
  display: inline-block;
  font-size: var(--star-size);
  font-family: Times;
  line-height: 1;
  display: flex;
	justify-content: flex-end; 
}
.Stars::before {
  content: "★★★★★";
  letter-spacing: 3px;
  background: linear-gradient(90deg, var(--star-background) var(--percent), var(--star-color) var(--percent));
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
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

	<!-- Nav bar  -->
	<nav:navbar></nav:navbar>
	<!-- Page Header Start -->
	<div class="container-fluid page-header-main py-5">
		<div class="container py-5">
			<h1 class="display-3 text-white mb-3 animated slideInDown">재능 공유 게시판</h1>
			<nav aria-label="breadcrumb animated slideInDown"></nav>
		</div>
	</div>
    <!-- Section-->
  	<section class="py-5">
       <div class="container px-4 px-lg-5">
           <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
           
           <!-- 카테고리(param.sort) -->
			<div class="group_catelist">
				<div class="inner_catelist">
					<ul lass="mb-5" id="portfolio-flters">
						<li class="mx-4">
							<a <c:if test="${topic=='1'}"> class="on"</c:if> href="${appRoot}/donation/main?sort=${sort }&topic_id=1">
								<img class="mb-3" src="${appRoot}/resources/webContents/img/talent_agreement.png">
								<span>문서.취업</span>
							</a>
						</li>
						<li class="mx-4">
							<a <c:if test="${topic=='2'}"> class="on"</c:if> href="${appRoot}/donation/main?sort=${sort }&topic_id=2">
								<img class="mb-3" src="${appRoot}/resources/webContents/img/talent_exercise.png">
								<span>생활.레슨</span>
							</a>
						</li>
						<li class="mx-4">
							<a <c:if test="${topic=='3'}"> class="on"</c:if> href="${appRoot}/donation/main?sort=${sort }&topic_id=3">
								<img class="mb-3"src="${appRoot}/resources/webContents/img/talent_measuring.png">
								IT.프로그래밍 
							</a>
						</li>
						<li class="mx-4">
							<a <c:if test="${topic=='4'}"> class="on"</c:if> href="${appRoot}/donation/main?sort=${sort }&topic_id=4">
								<img class="mb-3"src="${appRoot}/resources/webContents/img/talent_youtube.png">
								콘텐츠
							</a>
						</li>
						<li class="mx-4">
							<a <c:if test="${topic=='4'}"> class="on"</c:if> href="${appRoot}/donation/main?sort=${sort }&topic_id=4">
								<img class="mb-3"src="${appRoot}/resources/webContents/img/talent_handmade.png">
								핸드메이드
							</a>
						</li>
						<li class="mx-4">
							<a <c:if test="${topic=='4'}"> class="on"</c:if> href="${appRoot}/donation/main?sort=${sort }&topic_id=4">
								<img class="mb-3"src="${appRoot}/resources/webContents/img/talent_market.png">
								마켓팅
							</a>
						</li>
						<li class="mx-4">
							<a <c:if test="${topic=='4'}"> class="on"</c:if> href="${appRoot}/donation/main?sort=${sort }&topic_id=4">
								<img class="mb-3"src="${appRoot}/resources/webContents/img/talnet_languages.png">
								번역
							</a>
						</li>
					</ul>
				</div>
			</div> <!-- end: group_catelist -->
           
           <!-- 게시글 목록  -->
           <c:forEach items="${boardList }" var="list">
	           <div class="col mb-5">
		            <div class="card border-0  h-100">
		                <!-- Product image-->
		               	<img class="image card-img-top rounded-4"  src="https://bucket0207-spring0520-teacher-test.s3.ap-northeast-2.amazonaws.com/talent/${list.folderName }/${list.MPhoto}" alt="..." />
		                <!-- Product details-->
		                <div class="card-body">
		                    <div class="text">
		                    	<div class="nickName-body">${list.nickname }</div>
		                        <!-- Product name-->
		                        <h5 class="title-body">${list.title }</h5>
		                        <!-- Product price-->
		                        
		                        <div class="price-body">${list.price } 원</div>
		                        <!-- 별점 -->
		                       	<div class="Stars" style="--rating: 1.3;" aria-label="Rating of this product is 2.3 out of 5."> ｜ 몇개의 평가</div>
		                    </div>
		                </div>
		                <!-- Product actions-->
		                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
		                    <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="${appRoot }/talent/board/${list.talentId}">View options</a></div>
		                </div>
		            </div>
	         	</div>
         	</c:forEach>
         	
			
           </div>
       </div>
   	</section>
	
		<!-- foot bar -->
	<nav:footbar></nav:footbar>
    


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <!--Jquery -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${appRoot }/resources/webContents/lib/wow/wow.min.js"></script>
    <script src="${appRoot }/resources/webContents/lib/easing/easing.min.js"></script>
    <script src="${appRoot }/resources/webContents/lib/waypoints/waypoints.min.js"></script>
    <script src="${appRoot }/resources/webContents/lib/counterup/counterup.min.js"></script>
    <script src="${appRoot }/resources/webContents/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="${appRoot }/resources/webContents/lib/isotope/isotope.pkgd.min.js"></script>
    <script src="${appRoot }/resources/webContents/lib/lightbox/js/lightbox.min.js"></script>

    <!-- Template Javascript -->
    <script src="${appRoot }/resources/webContents/js/main.js"></script>
</body>
</html>