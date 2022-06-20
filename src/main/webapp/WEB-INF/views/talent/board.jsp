<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>재능 공유 게시판</title>
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
	<!-- Page Header End -->
    <!-- Page content-->
    <div class="container mt-5">
        <div class="row">
            <div class="col-lg-7">
                <!-- Post content-->
                <article>
                    <!-- 메인사진-->
                    <figure class="mb-4"><img class="img-fluid rounded" src="https://dummyimage.com/900x400/ced4da/6c757d.jpg" alt="..." /></figure>
                    <!-- 게시판 네비게이션 바 -->
                    <div class="my-4">
		                    <ul class="nav nav-tabs nav-fill justify-content-center ">
							  <li class="nav-item">
							    <button class="flex-sm-fill text-sm-center nav-link active" id="mainContentNav" aria-current="page">재능 소개</button>
							  </li>
							  <li class="nav-item">
							    <button class="flex-sm-fill text-sm-center nav-link" id="cancleAndRefundNav">취소 환불</button>
							  </li>
							  <li class="nav-item">
							    <button class="flex-sm-fill text-sm-center nav-link" id="replyNav">후기</button>
							  </li>
							</ul>
					</div>
                    <!-- 메인 컨텐츠-->
                    <section class="mb-5" id="mainContentContainer">
                        <p class="fs-5 mb-4">Science is an enterprise that should be cherished as an activity of the free human mind. Because it transforms who we are, how we live, and it gives us an understanding of our place in the universe.</p>
                        <p class="fs-5 mb-4">The universe is large and old, and the ingredients for life as we know it are everywhere, so there's no reason to think that Earth would be unique in that regard. Whether of not the life became intelligent is a different question, and we'll see if we find that.</p>
                        <p class="fs-5 mb-4">If you get asteroids about a kilometer in size, those are large enough and carry enough energy into our system to disrupt transportation, communication, the food chains, and that can be a really bad day on Earth.</p>
                        <h2 class="fw-bolder mb-4 mt-5">I have odd cosmic thoughts every day</h2>
                        <p class="fs-5 mb-4">For me, the most fascinating interface is Twitter. I have odd cosmic thoughts every day and I realized I could hold them to myself or share them with people who might be interested.</p>
                        <p class="fs-5 mb-4">Venus has a runaway greenhouse effect. I kind of want to know what happened there because we're twirling knobs here on Earth without knowing the consequences of it. Mars once had running water. It's bone dry today. Something bad happened there as well.</p>
                    </section>
                </article>
                
                <!-- 취소 환불 -->
                <section class="mb-5 d-none" id="cancleAndRefundConatiner">
                    <h2 class="fw-bolder mb-4 mt-5">취소 및 환불 규정</h2>
                    <p class="fs-5 mb-4">[환불 가이드라인]</p>
                    <p class="fs-5 mb-4">(1) 기획 단계에서 청약 철회: 총 결제 금액의 최대 80%까지 환불 가능</p>
                    <p class="fs-5 mb-4">(2) 작업 착수 후 청약 철회: 총 결제 금액의 최대 20%까지 환불 가능</p>
                    <p class="fs-5 mb-4">(3) 작업 50% 완료 후 청약 철회: 총 결제 금액의 최대 10%까지 환불 가능</p>
                    <p class="fs-5 mb-4">(4) 작업 100% 완료 후 청약 철회 : 환불 불가</p>
                    <p class="fs-5 mb-4"></p>
                </section>
                
                <!-- 댓글-->
                <section class="mb-5 d-none" id="replyContainer">
                    <div class="card bg-light">
                        <div class="card-body">
                            <!-- Comment form-->
                            <form class="mb-4"><textarea class="form-control" rows="3" placeholder="Join the discussion and leave a comment!"></textarea></form>
                            <!-- Comment with nested comments-->
                            <div class="d-flex mb-4">
                                <!-- Parent comment-->
                                <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                <div class="ms-3">
                                    <div class="fw-bold">Commenter Name</div>
                                    If you're going to lead a space frontier, it has to be government; it'll never be private enterprise. Because the space frontier is dangerous, and it's expensive, and it has unquantified risks.
                                    <!-- Child comment 1-->
                                    <div class="d-flex mt-4">
                                        <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                        <div class="ms-3">
                                            <div class="fw-bold">Commenter Name</div>
                                            And under those conditions, you cannot establish a capital-market evaluation of that enterprise. You can't get investors.
                                        </div>
                                    </div>
                                    <!-- Child comment 2-->
                                    <div class="d-flex mt-4">
                                        <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                        <div class="ms-3">
                                            <div class="fw-bold">Commenter Name</div>
                                            When you put money directly to a problem, it makes a good headline.
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Single comment-->
                            <div class="d-flex">
                                <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                <div class="ms-3">
                                    <div class="fw-bold">Commenter Name</div>
                                    When I look at the universe and all the ways the universe wants to kill us, I find it hard to reconcile that with statements of beneficence.
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                
                
            </div>
            
            
            <!-- Side widgets-->
            <div class="col-lg-4">
                <!-- Categories widget-->
                <div class="card border-0 mb-4">
                    <div class="card-body">
                    	<div class="mx-3 mb-1">
                    		<!-- Post tag-->
                    		<div class="mb-3">
		                    	<span class="badge rounded-pill bg-warning text-dark ">태그1</span>
		                    	<span class="badge rounded-pill bg-warning text-dark">태그2</span>
	                    	</div>
	                    	<!-- Post title-->
                        	<h4 class="fw-bolder mb-3">종이 청구서와 영수증은 모바일로 스마트하게</h4>
                        	<!-- Post progressbar-->
                        	<div class="progress" style="height: 6px;">
		                    	<div class="progress-bar bg-warning" role="progressbar" style="width: 10%" aria-valuenow="10" aria-valuemin="0"
										aria-valuemax="100"></div>
							</div>
							<div class="mb-5">
							</div>
							<div class="d-grid gap-2">
							<button type="button" class="btn btn-warning">구매하기</button>
							</div>
                    	</div>
                    </div>
                </div>
                <!-- Side widget-->
                <div class="card border-1 mx-4 mb-4">
                	<div>
                		<div class="card-body ">You can put anything you want inside of these side widgets. They are easy to use, and feature the Bootstrap 5 card component!</div>
                	</div>
                </div>
            </div>
        </div>
     </div>



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
    <script>
	$(document).ready(function(){
		/* 메인 게시글 */
		$("#mainContentNav").click(function(){
			$('#mainContentNav').addClass('active');
			$("#cancleAndRefundNav").removeClass("active");
			$("#replyNav").removeClass("active");
			
			$('#mainContentContainer').removeClass("d-none");
			$("#cancleAndRefundConatiner").addClass("d-none");
			$("#replyContainer").addClass("d-none");
		});
		/* 취소 환불 */
		$("#cancleAndRefundNav").click(function(){
			$('#cancleAndRefundNav').addClass('active');
			$("#mainContentNav").removeClass("active");
			$("#replyNav").removeClass("active");
			
			$('#cancleAndRefundConatiner').removeClass("d-none");
			$("#mainContentContainer").addClass("d-none");
			$("#replyContainer").addClass("d-none");
		});
		/* 후기 */
		$("#replyNav").click(function(){
			$('#replyNav').addClass('active');
			$("#mainContentNav").removeClass("active");
			$("#cancleAndRefundNav").removeClass("active");
			
			$('#replyContainer').removeClass("d-none");
			$("#mainContentContainer").addClass("d-none");
			$("#cancleAndRefundConatiner").addClass("d-none");
		});
	});

</script>
</body>
</html>