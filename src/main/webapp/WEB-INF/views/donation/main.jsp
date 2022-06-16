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
							<a <c:if test="${topic==null or topic==''}"> class="on"</c:if> href="${appRoot}/donation/main?sort=1">
								<img class="mb-3" src="${appRoot}/resources/webContents/img/donation_all.png">
								<span>전체</span>
							</a>
						</li>
						<li class="mx-4">
							<a <c:if test="${topic=='1'}"> class="on"</c:if> href="${appRoot}/donation/main?sort=${sort }&topic_id=1">
								<img class="mb-3" src="${appRoot}/resources/webContents/img/donation_1.png">
								<span>어린이</span>
							</a>
						</li>
						<li class="mx-4">
							<a <c:if test="${topic=='2'}"> class="on"</c:if> href="${appRoot}/donation/main?sort=${sort }&topic_id=2">
								<img class="mb-3" src="${appRoot}/resources/webContents/img/donation_2.png">
								<span>장애인</span>
							</a>
						</li>
						<li class="mx-4">
							<a <c:if test="${topic=='3'}"> class="on"</c:if> href="${appRoot}/donation/main?sort=${sort }&topic_id=3">
								<img class="mb-3"src="${appRoot}/resources/webContents/img/donation_3.png">
								어려운 이웃
							</a>
						</li>
						<li class="mx-4" data-filter=".second">
							<a <c:if test="${topic=='4'}"> class="on"</c:if> href="${appRoot}/donation/main?sort=${sort }&topic_id=4">
								<img class="mb-3"src="${appRoot}/resources/webContents/img/donation_4.png">
								환경
							</a>
						</li>
					</ul>
				</div>
			</div> <!-- end: group_catelist -->

            <div class="row g-4">
            	<!-- 최신순, 오래된 순 -->
 				<div class="group_fundlist" >
 					<div class="sort_cate">
 						<span class="inner_sort_cate">
 							<a href="${appRoot}/donation/main?sort=1&topic_id=${topic}">
								<c:if test="${sort == 1 or sort == null}"><span class="box_sorting on">최신순</span></c:if>
								<c:if test="${sort != 1 and sort != null}"><span class="box_sorting">최신순</span></c:if>
							</a>
							<a href="${appRoot}/donation/main?sort=2&topic_id=${topic}">
								<c:if test="${sort == 2 }"><span class="box_sorting on">오래된 순</span></c:if>
								<c:if test="${sort != 2 }"><span class="box_sorting">오래된 순</span></c:if>
							</a>
 						</span>
 					</div>
 				</div>
 				<!-- 게시글 목록  -->
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
			                                <img class="mb-3" src="${appRoot}/resources/webContents/img/donation_${list.topic }.png">
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