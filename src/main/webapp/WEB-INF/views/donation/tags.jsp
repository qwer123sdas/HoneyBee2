<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>도네이션 태그</title>
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
	body{
		font-size: 15px;
	}
	a{
		color : black;
	}
	/* 최신순, 오래된 순  */

	.group_fundlist {
	    position: relative;
	    width: 1300px;
	    margin: 0 auto 10px;
	}
	
	.group_fundlist .sort_cate {
		text-align: right;
	}
	
	.group_fundlist .sort_cate .inner_sort_cate {
		padding-right: 16px;
		display: inline-block;
	}
	.group_fundlist .sort_cate .box_sorting {
		margin-left: 24px;
		float: left;
		font-size: 16px;
	    padding-left: 19px;
	    color: #aaa;
	    font-family: KakaoBold;
	    cursor: pointer;
	}
	
	.group_fundlist .sort_cate .box_sorting.on {
		color: #444;
	}
	
	.main-title{
		color : black;
		font-weight: bold;
		font-size: 18px;
		width: 250;
		height: 47;
	}
	.image {
	object-fit: cover;
	width: 100%;
	height: 240px;
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
	<nav:navbar_kim></nav:navbar_kim>
	    <!-- Service Start -->
	<!-- Page Header Start -->
	
    <div class="container-fluid page-header py-5 mb-5">
        <div class="container py-5">
            <h1 class="display-3 text-white mb-3 animated slideInDown">#  ${hashTag }</h1>
            <nav aria-label="breadcrumb animated slideInDown">
            </nav>
        </div>
    </div>
    <!-- Page Header End -->    
    
    <div class="container-xxl">
        <div class="container">
        	<div class="row g-4">
        	    <!-- 최신순, 오래된 순 -->
 				<div class="group_fundlist" >
 					<div class="sort_cate">
 						<span class="inner_sort_cate">
 							<a href="${appRoot}/donation/tags/${hashTag }?sort=1">
								<c:if test="${sort == 1 or sort == null}"><span class="box_sorting on">전체</span></c:if>
								<c:if test="${sort != 1 and sort != null}"><span class="box_sorting">전체</span></c:if>
							</a>
							<a href="${appRoot}/donation/tags/${hashTag }?sort=2">
								<c:if test="${sort == 2 }"><span class="box_sorting on">모금중</span></c:if>
								<c:if test="${sort != 2 }"><span class="box_sorting">모금중</span></c:if>
							</a>
							<a href="${appRoot}/donation/tags/${hashTag }?sort=3">
								<c:if test="${sort == 3 }"><span class="box_sorting on">모금 완료</span></c:if>
								<c:if test="${sort != 3 }"><span class="box_sorting">모금 완료</span></c:if>
							</a>
							<a href="${appRoot}/donation/tags/${hashTag }?sort=4">
								<c:if test="${sort == 4 }"><span class="box_sorting on">준비중</span></c:if>
								<c:if test="${sort != 4 }"><span class="box_sorting">준비중</span></c:if>
							</a>
 						</span>
 					</div>
 				</div>
 				
	 			<!-- 게시글 목록  -->
           		<c:if test="${boardList } == '' ">
         			글이 없습니다
         		</c:if>
         		
                <c:forEach items="${boardList }" var="list">

		                <div class="col-md-6 col-lg-4 wow fadeInUp me-4" data-wow-delay="0.3s">
                			<a href="${appRoot }/donation/board/${list.donationId }">
			                    <div class="service-item rounded overflow-hidden">
			                   		<c:if test="${empty list.MPhoto }">
			  					  		<img class="img-fluid" src="${appRoot }/resources/webContents/img/재능사진1.png" alt="">
			  					  	</c:if>
			  					  	<c:if test="${not empty list.MPhoto }">
			  					  		<img class="image img-fluid" src="https://bucket0207-4885.s3.ap-northeast-2.amazonaws.com/donation/${list.folderName }/${list.MPhoto}" alt="">
			  					  	</c:if> 
			                        <div class="position-relative p-4 pt-0">
			                            <div class="service-icon">
			                                <img class="mb-3" src="${appRoot}/resources/webContents/img/donation_${list.topic }.png">
			                            </div>
			                            <h4 class="main-title mb-3">${list.title }</h4>
			                            <p style="color: black;">${list.nickname }</p>
			                            <p style="color: black;">현재 모금액 : ${list.currentAmount}</p>
			                            <div class="progress">
										  <div class="progress-bar bg-warning" role="progressbar" style="width: ${list.achievementRate}%" aria-valuenow="${list.achievementRate}" aria-valuemin="0" aria-valuemax="100"></div>
										</div>
			                        </div>
			                    </div>
	                		</a>
		                </div>
                </c:forEach>
			</div>
		</div>
	</div>
	
	
	
	
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