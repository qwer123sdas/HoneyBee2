<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Solartec - Renewable Energy Website Template</title>
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
	    padding: 57px 17px 48px;
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
	/* 컬러이미지 */
	.group_catelist .inner_catelist a.on{
		/*filter: grayscale(0%);   */
		font-family: KakaoBold;
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
    <div class="container-fluid page-header py-5 mb-5">
        <div class="container py-5">
            <h1 class="display-3 text-white mb-3 animated slideInDown">기부 게시판</h1>
            <nav aria-label="breadcrumb animated slideInDown">
            </nav>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Service Start -->
    <div class="container-xxl">
        <div class="container">
            <!-- 카테고리(param.sort) -->
			<div class="group_catelist  wow fadeInUp">
				<div class="inner_catelist">
					<ul lass="mb-5" id="portfolio-flters">
						<li class="mx-4">
							<a <c:if test="${param.subtopic==null or param.subtopic==''}"> class="on"</c:if> href="/fund/now?sort=1">
								<img class="mb-3" src="${appRoot}/resources/webContents/img/ico_all.png">
								<span>전체</span>
							</a>
						</li>
						<li class="mx-4">
							<a <c:if test="${param.subtopic=='A'}"> class="on"</c:if> href="/fund/now?subtopic=A&sort=1">
								<img class="mb-3" src="${appRoot}/resources/webContents/img/ico_kidz.png">
								<span>어린이</span>
							</a>
						</li>
						<li class="mx-4">
							<a <c:if test="${param.subtopic=='B'}"> class="on"</c:if> href="/fund/now?subtopic=B&sort=1">
								<img class="mb-3" src="${appRoot}/resources/webContents/img/ico_accessible.png">
								<span>장애인</span>
							</a>
						</li>
						<li class="mx-4">
							<a <c:if test="${param.subtopic=='C'}"> class="on"</c:if> href="/fund/now?subtopic=C&sort=1">
								<img class="mb-3"src="${appRoot}/resources/webContents/img/ico_neighborhood.png">
								어려운 이웃
							</a>
						</li>
						<li class="mx-4" data-filter=".second">
							<a <c:if test="${param.subtopic=='D'}"> class="on"</c:if> href="/fund/now?subtopic=D&sort=1">
								<img class="mb-3"src="${appRoot}/resources/webContents/img/ico_culture.png">
								환경
							</a>
						</li>
					</ul>
				</div>
			</div> <!-- end: group_catelist -->
			<!--  
			태그 부분 비울 것
            <div class="row mt-n2 wow fadeInUp group_catelist" data-wow-delay="0.3s">
                <div class="col-12 text-center inner_catelist">
                    <ul class="mb-5" id="portfolio-flters">
                        <li class="mx-2 active" >
							<a <c:if test="${param.subtopic==null or param.subtopic==''}"> class="on"</c:if> href="/fund/now?sort=1">
								<img src="${appRoot}/resources/webContents/img/ico_all.png">
								<span>전체</span>
							</a>
						</li>
                        <li class="mx-2" data-filter=".first">기부 종류 1</li>
                        <li class="mx-2" data-filter=".second">기부 종류 2</li>
                        <li class="mx-2" data-filter=".third">기부 종류3</li>
                    </ul>
                </div>
            </div>
            -->
            <div class="row g-4">
 
                <c:forEach items="${boardList }" var="list">
		                <div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-delay="0.3s">
                			<a href="${appRoot }/donation/board/${list.donationId }">
			                    <div class="service-item rounded overflow-hidden">
			                   		<c:if test="${empty list.MPhoto }">
			  					  		<img class="img-fluid" src="${appRoot }/resources/webContents/img/재능사진1.png" alt="">
			  					  	</c:if>
			  					  	<c:if test="${not empty list.MPhoto }">
			  					  		<img class="img-fluid" src="https://bucket0207-4885.s3.ap-northeast-2.amazonaws.com/donation/mainPhoto/${list.donationId }/${list.MPhoto}" alt="">
			  					  	</c:if> 
			                        <div class="position-relative p-4 pt-0">
			                            <div class="service-icon">
			                                <img class="mb-3" src="${appRoot}/resources/webContents/img/ico_kidz.png">
			                            </div>
			                            <h4 class="mb-3">${list.title }</h4>
			                            <p>${list.nickname }</p>
			                            <p>현재 모금액 : ${list.currentAmount}</p>
			                            <div class="progress">
										  <div class="progress-bar bg-warning" role="progressbar" style="width: ${list.achievementRate}%" aria-valuenow="${list.achievementRate}" aria-valuemin="0" aria-valuemax="100"></div>
										</div>
			                        </div>
			                    </div>
	                		</a>
		                </div>
                </c:forEach>
                
               	 <div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="service-item rounded overflow-hidden">
  						<img class="img-fluid" src="${appRoot }/resources/webContents/img/재능사진1.png" alt="">
                        <div class="position-relative p-4 pt-0">
                            <div class="service-icon">
                                <i class="fa fa-wind fa-3x"></i>
                            </div>
                            <h4 class="mb-3">임시 게시글제목</h4>
                            <p>닉네임</p>
                          	<div class="progress">
								  <div class="progress-bar bg-warning" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
    <!-- Service End -->


    
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