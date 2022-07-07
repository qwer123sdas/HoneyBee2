<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--font-awesome  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!--bootstrap  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!--Jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
<!-- Bulma  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
<title>Insert title here</title>
<meta charset="utf-8">
    <title>꿀비 - 검색사이트</title>
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
<body>
	 <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->

	<!-- Nav bar  -->
	<my:mainNavBar></my:mainNavBar>
	    <!-- Service Start -->
	<!-- Page Header Start -->
	
    <div class="container-fluid mb-5">
        <div class="container py-5">
        	<form action="${appRoot }/search"class="d-flex" role="search">
	            <div class="input-group mb-2" style="width: 600px">
                    <input type="hidden" name="type" value="${type }" />
	     			<input class="form-control input-secondary" type="search" name="keyword" value="${keyword }" aria-label="Search">
	     			<button class="btn btn-warning" type="submit"><i class="fa-solid fa-magnifying-glass" style="color: white"></i></button>
		     	</div>
		    </form>
            <ul class="nav nav-tabs nav-fill">
			  <li class="nav-item">
			    <a <c:if test="${type=='donation'}"> class="active"</c:if> class="nav-link" aria-current="page" href="${appRoot }/search?type=donation&keyword=${keyword}">기부</a>
			  </li>
			  <li class="nav-item">
			    <a <c:if test="${type=='talent'}"> class="active"</c:if>class="nav-link" href="${appRoot }/search?type=talent&keyword=${keyword}">재능판매</a>
			  </li>
			  <li class="nav-item">
			    <a <c:if test="${type=='meeting'}"> class="active"</c:if>class="nav-link" href="${appRoot }/search?type=meeting&keyword=${keyword}">모두의 행동</a>
			  </li>
			</ul>
        </div>
    </div>
    <!-- Page Header End -->    
    
	<!-- Donation Section-->
  	<section class="py-5">
       <div class="container px-4 px-lg-5">
           <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
           
           	<!-- 카테고리(param.sort) -->
				
 			
	           <!-- 게시글 목록  -->
	           <c:if test='${type == "donation" }'>
		           <c:forEach items="${boardList }" var="list">
			           <div class="col mb-5">
			           		<a href="${appRoot }/donation/board/${list.donationId }">
					            <div class="card border-0  h-100">
					                <!-- Product image-->
					               	<img class="image card-img-top rounded-4"  src="https://bucket0207-4885.s3.ap-northeast-2.amazonaws.com/donation/${list.folderName }/${list.MPhoto}" alt="..." />
					                <!-- Product details-->
					                <div class="card-body">
					                    <div class="text">
					                    	<div class="nickName-body">${list.nickname }</div>
					                        <!-- Product name-->
					                        <h5 class="title-body">${list.title }</h5>
					                    </div>
					                </div>
					            </div>
				            </a>
			         	</div>
		         	</c:forEach>
		         </c:if>
		        <c:if test='${type == "talent" }'>
		           <c:forEach items="${boardList }" var="list">
			           <div class="col mb-5">
			           		<a href="${appRoot }/talent/board/${list.talnetId }">
					            <div class="card border-0  h-100">
					                <!-- Product image-->
					               	<img class="image card-img-top rounded-4"  src="https://bucket0207-4885.s3.ap-northeast-2.amazonaws.com/talent/${list.folderName }/${list.MPhoto}" alt="..." />
					                <!-- Product details-->
					                <div class="card-body">
					                    <div class="text">
					                    	<div class="nickName-body">${list.nickname }</div>
					                        <!-- Product name-->
					                        <h5 class="title-body">${list.title }</h5>
					                    </div>
					                </div>
					            </div>
				            </a>
			         	</div>
		         	</c:forEach>
		         </c:if>
		         <c:if test='${type == "meeting" }'>
		           <c:forEach items="${boardList }" var="list">
			           <div class="col mb-5">
			           		<a href="${appRoot }/talent/board/${list.meetingId }">
					            <div class="card border-0  h-100">
					                <!-- Product image-->
					               	<img class="image card-img-top rounded-4"  src="https://bucket0207-4885.s3.ap-northeast-2.amazonaws.com/meeting/${list.folderName }/${list.MPhoto}" alt="..." />
					                <!-- Product details-->
					                <div class="card-body">
					                    <div class="text">
					                    	<div class="nickName-body">${list.nickname }</div>
					                        <!-- Product name-->
					                        <h5 class="title-body">${list.title }</h5>
					                    </div>
					                </div>
					            </div>
				            </a>
			         	</div>
		         	</c:forEach>
		         </c:if>
	         </div>
       </div>
   	</section>
	
	
	
	
	<!-- foot bar -->
	<nav:footbar_kim></nav:footbar_kim>

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