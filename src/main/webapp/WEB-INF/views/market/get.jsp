<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<%--<html>
<head>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css"
	integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	referrerpolicy="no-referrer"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<meta charset="UTF-8">

<title>Insert title here</title>
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
</head>
<body>
	<my:navbar></my:navbar>
	<my:market></my:market>
	<%--<div class="container">
		<div class="row">
			<div class="col">
				<c:if test="${not empty market.fileName }">
					<div id="carouselExampleControls" class="carousel slide"
						data-bs-ride="carousel">
						<div class="carousel-inner">
							<c:forEach items="${market.fileName }" var="image"
								varStatus="status">
								<div class="carousel-item ${status.first ? 'active' : ''}">
								<% 	String file = (String) pageContext.getAttribute("image");
									String encodedFileName = java.net.URLEncoder.encode(file,
									"utf-8"); pageContext.setAttribute("encodedFileName",
									encodedFileName); %> 
									<img
										src="${imageUrl }/market/${market.marketId }/${encodedFileName }"
										class="d-block w-100" alt="Card image cap">
								</div>
							</c:forEach>
						</div>
						<button class="carousel-control-prev" type="button"
							data-bs-target="#carouselExampleControls" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button"
							data-bs-target="#carouselExampleControls" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
				</c:if>



					<hr />
				<section id="article-description">
					<h1>${market.title}</h1>
					<div style="bottom: 15px">
									<strong>${market.inserted }</strong>
								</div>
					<p id="article-price" size="font-size : 18px;">${market.price }원</p>
					<div>${market.content }</div>
					<div>조회수 : ${market.viewCount }</div>
					<hr />

				</section>
				<section>
				
				<button type="button" class="btn btn-primary">장바구니</button>
				<button type="button" class="btn btn-primary">구매</button>
				</section> 

			</div>
		</div>
	</div>


	<my:footbar></my:footbar>
</body>
</html>--%>



<html>
<head>
	<meta charset="UTF-8">
    <title></title>
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
    background: linear-gradient(rgba(0, 0, 0, .1), rgba(0, 0, 0, .1)), url(/honeybee/resources/webContents/img/carousel-2.jpg) center center no-repeat;
    background-size: cover;
    margin-top : 75px;
}
.map_wrap {
	position: relative;
	width: 80%;
	height: 400px;
}
</style>

<body>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>

    <!-- Page content-->
    <div class="container mt-5">
        <div class="row">
            <div class="col-lg-7">
                <!-- Post content-->
                <article>
                    <!-- 메인사진-->
                   	<!-- 대표 이미지-->
                   	
					<%-- <c:if test="${empty board.MPhoto }">
						<figure class="img_ico mb-4">
							<img class="img-fluid rounded" src="https://dummyimage.com/900x400/ced4da/6c757d.jpg" alt="..." />
						</figure>
					</c:if>
					<c:if test="${not empty board.MPhoto }">
						<figure class="mb-4">
							<img class="img-fluid" src="https://bucket0207-spring0520-teacher-test.s3.ap-northeast-2.amazonaws.com/talent/${board.folderName }/${board.MPhoto}" alt="">
						</figure>
					</c:if>--%>
					
					
						<c:if test="${not empty market.fileName }">
					<div id="carouselExampleControls" class="carousel slide"
						data-bs-ride="carousel">
						<div class="carousel-inner">
							<c:forEach items="${market.fileName }" var="image"
								varStatus="status">
								<div class="carousel-item ${status.first ? 'active' : ''}">
								<% 	String file = (String) pageContext.getAttribute("image");
									String encodedFileName = java.net.URLEncoder.encode(file,
									"utf-8"); pageContext.setAttribute("encodedFileName",
									encodedFileName); %> 
									<img
										src="${imageUrl }/market/${market.marketId }/${encodedFileName }"
										class="d-block w-100" alt="Card image cap">
								</div>
							</c:forEach>
						</div>
						<button class="carousel-control-prev" type="button"
							data-bs-target="#carouselExampleControls" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button"
							data-bs-target="#carouselExampleControls" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
				</c:if>
                    <!-- 게시판 네비게이션 바 -->
                    <div class="my-4">
		                    <ul class="nav nav-tabs nav-fill justify-content-center ">
							  <li class="nav-item">
							    <button class="flex-sm-fill text-sm-center nav-link active" id="mainContentNav" aria-current="page">상품 소개</button>
							  </li>
							  <li class="nav-item">
							    <button class="flex-sm-fill text-sm-center nav-link" id="cancleAndRefundNav">취소 환불</button>
							  </li>
							  
							</ul>
					</div>
                    <!-- 메인 컨텐츠-->
                    <section class="mb-5" id="mainContentContainer">
                    	<p class="fs-5 mb-4">${board.content }</p>
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
                    <h2 class="fw-bolder mb-4 mt-5" style="color: #ffc107;">취소 및 환불 규정</h2>
                    <p class="fs-5 mb-4">[환불 가이드라인]</p>
                    <p class="fs-5 mb-4">일반적으로 소비자는 자신이 체결한 전자상거래 계약에 대해 그 계약의 내용을 불문하고 
                    					  그 청약철회 및 계약해제의 기간(통상 7일) 
                    					  내에는 청약철회 등을 자유롭게 할 수 있습니다(「전자상거래 등에서의 소비자보호에 관한 법률」 제17조제1항).
                    <p class="fs-5 mb-4"></p>
                </section>
                
                
                
                
            </div>
            
            
            <!-- Side widgets-->
            <div class="col-lg-4">
                <!-- Categories widget-->
                <div class="card border-1 mb-4">
                    <div class="card-body">
                    	<div class="mx-3 mb-1">
                    		<!-- Post tag-->
                    		<div class="mb-3">
		                    	<span class="badge rounded-pill bg-warning text-dark ">태그1</span>
		                    	<span class="badge rounded-pill bg-warning text-dark">태그2</span>
	                    	</div>
	                    	<!-- Post title-->
                        	<h2 class="fw-bolder mb-3">${market.title }</h2>
                        	<!-- Post progressbar-->
                        	
							<div class="mb-5">
							<h4 class="fw-bolder mb-3">${market.price }원</h4>
							
							</div>
							
						<section>
				
				
				<c:url value="/market/cart" var="buyUrl">
					<c:param name="marketId" value="${market.marketId }"></c:param>
				</c:url>
				<a type="button" class="btn btn-warning" href="${buyUrl}">구매</a>
				<p>조회수${market.viewCount }</p>
				</section> 
                    	</div>
                    </div>
                </div>
                <!-- Side widget-->
                
            </div>
        </div>
     </div>



	<!-- foot bar -->
	<my:footbar></my:footbar>
    


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
		
	});
</script>
</body>
</html>