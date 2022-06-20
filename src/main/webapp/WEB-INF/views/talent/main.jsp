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
.page-header-main {
    background: linear-gradient(rgba(0, 0, 0, .1), rgba(0, 0, 0, .1)), url(../img/carousel-2.jpg) center center no-repeat;
    background-size: cover;
    margin-top : 75px;
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
	<div class="container-fluid page-header-main py-5 mb-5">
		<div class="container py-5">
			<h1 class="display-3 text-white mb-3 animated slideInDown">재능 공유 게시판</h1>
			<nav aria-label="breadcrumb animated slideInDown"></nav>
		</div>
	</div>
    <!-- Section-->
  	<section class="py-5">
       <div class="container px-4 px-lg-5 mt-5">
           <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
           
           <div class="col mb-5">
	            <div class="card border-0 h-100">
	                <!-- Product image-->
	                <img class="card-img-top rounded-4"  src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
	                <!-- Product details-->
	                <div class="card-body">
	                    <div class="text">
	                        <!-- Product name-->
	                        <h5 class="fw-bolder">Fancy Product</h5>
	                        <!-- Product price-->
	                        $40.00 - $80.00
	                    </div>
	                </div>
	                <!-- Product actions-->
	                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
	                    <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
	                </div>
	            </div>
         	</div>
         	
         	 <div class="col mb-5">
	            <div class="card h-100">
	                <!-- Product image-->
	                <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
	                <!-- Product details-->
	                <div class="card-body p-4">
	                    <div class="text-center">
	                        <!-- Product name-->
	                        <h5 class="fw-bolder">Fancy Product</h5>
	                        <!-- Product price-->
	                        $40.00 - $80.00
	                    </div>
	                </div>
	                <!-- Product actions-->
	                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
	                    <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
	                </div>
	            </div>
         	</div>
         	
         	 <div class="col mb-5">
	            <div class="card h-100">
	                <!-- Product image-->
	                <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
	                <!-- Product details-->
	                <div class="card-body p-4">
	                    <div class="text-center">
	                        <!-- Product name-->
	                        <h5 class="fw-bolder">Fancy Product</h5>
	                        <!-- Product price-->
	                        $40.00 - $80.00
	                    </div>
	                </div>
	                <!-- Product actions-->
	                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
	                    <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
	                </div>
	            </div>
         	</div>
         	
         	<div class="col mb-5">
	            <div class="card h-100">
	                <!-- Product image-->
	                <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
	                <!-- Product details-->
	                <div class="card-body p-4">
	                    <div class="text-center">
	                        <!-- Product name-->
	                        <h5 class="fw-bolder">Fancy Product</h5>
	                        <!-- Product price-->
	                        $40.00 - $80.00
	                    </div>
	                </div>
	                <!-- Product actions-->
	                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
	                    <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
	                </div>
	            </div>
         	</div>
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