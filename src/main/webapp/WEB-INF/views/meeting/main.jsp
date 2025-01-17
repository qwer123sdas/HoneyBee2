<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
    <title>Solartec - Renewable Energy Website Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="${appRoot }/resources/webContents/img/favicon.ico" rel="icon">

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
    
    <!-- jQuery Modal -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
    
<style>
.page-header-main {
    background: linear-gradient(rgba(0, 0, 0, .1), rgba(0, 0, 0, .1)), 
    url("https://mud-kage.kakaocdn.net/dn/bSZlKT/btrDghJRjqh/KWJPi7zbvmb7K7ncVvhkQK/c360.jpg") center center no-repeat;
    background-size: cover;
}

.row .g-4 #meetingList {
	height: 150px;
}

.group_catelist {
	width: 1000px;
	margin: 0 auto;
	text-align: center;
}

.group_catelist .inner_catelist {
	display: inline-block;
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
.group_catelist .inner_catelist a.on {
	/*filter: grayscale(0%);   */
	font-family: KakaoBold;
}

/* 최신순, 오래된 순 */
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

.mainImage1 {
	object-fit: cover;
	width: 100%;
	height: 240px;
}

.catagory-image {
	width: 50px;
	height: 50px;
}

.meetingCurrent {
	color: FF7400; font-family : KakaoBold;
	font-weight: 800;
	font-size: 150%;
	font-family: KakaoBold;
}

.meetingStatus {
	margin: -50px 0 -14px 0;
}

.mainTitle {
	color: black;
	font-weight: 800;
	font-size: 180%;
	width: 250;
	height: 50;
}
</style>
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
	<my:mainNavBar current="meetingMain"></my:mainNavBar>
	
	<!-- 후기 관련 내용 form 전송 -->
	<form id="commentAddForm1" action="${appRoot }/meeting/commentAdd"
		method="post">
		<input type="hidden" name="content" id="content" />
	</form>

	<!-- Page Header Start -->
    <div class="container-fluid page-header-main py-5" style="margin-top: 0px;">
        <div class="container py-5">
            <h1 class="display-3 text-white mb-3 animated slideInDown text-center">모두의행동</h1>
            <nav aria-label="breadcrumb animated slideInDown text-center" style="margin-left: 490px; font-size: 150%">
                <ol class="breadcrumb text-center" >
                    <li class="breadcrumb-item"><a class="text-white" href="${appRoot }/meeting/insert">꿀비에게 제안하기</a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="#" id="commentAdd"  >후기작성</a></li>
                </ol>
                
            </nav>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Projects Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                <h6 class="text-primary">우리 함께해요!</h6>
                <h1 class="mb-4">꿀비들이 모여 큰 힘이 됩니다! <br> 같이의 행복을 함께 느껴요</h1>
            </div>
            <div class="row mt-n2 wow fadeInUp" data-wow-delay="0.3s">
                <div class="col-12 text-center">
                    <ul class="mb-5" id="portfolio-flters">
                    	<li class="mx-4">
                    		<a <c:if test="${topic == null or topic == ''}"> class="on"</c:if> href="${appRoot }/meeting/main?sort=1">
                    			<img class="mb-3" src="${appRoot}/resources/webContents/img/meeting_all.png" />
                    			<span>전체</span>
                    		</a>
                    	</li>
                    	<li class="mx-4">
                    		<a <c:if test="${topic == '1'}"> class="on"</c:if> href="${appRoot }/meeting/main?sort=${sort }&topic_id=1">
                    			<img class="mb-3" src="${appRoot}/resources/webContents/img/meeting_1.png" />
                    			<span>어린이</span>
                    		</a>
                    	</li>
                    	<li class="mx-4">
                    		<a <c:if test="${topic == '2'}"> class="on"</c:if> href="${appRoot }/meeting/main?sort=${sort }&topic_id=2">
                    			<img class="mb-3" src="${appRoot}/resources/webContents/img/meeting_2.png" />
                    			<span>장애인</span>
                    		</a>
                    	</li>
                    	<li class="mx-4">
                    		<a <c:if test="${topic == '3'}"> class="on"</c:if> href="${appRoot }/meeting/main?sort=${sort }&topic_id=3">
                    			<img class="mb-3" src="${appRoot}/resources/webContents/img/meeting_3.png" />
                    			<span>어려운 이웃</span>
                    		</a>
                    	</li>
                    	<li class="mx-4" data-filter=".second">
							<a <c:if test="${topic=='4'}"> class="on"</c:if> href="${appRoot}/meeting/main?sort=${sort }&topic_id=4">
								<img class="mb-3"src="${appRoot}/resources/webContents/img/meeting_4.png">
								<span>환경</span>
							</a>
						</li>
                    	
                    </ul>
                </div>
            </div>
        <div class="row g-4">
            <!-- 최신순, 오래된 순 -->
 				<div class="group_fundlist" >
 					<div class="sort_cate">
 						<span class="inner_sort_cate">
 							<a href="${appRoot}/meeting/main?sort=1&topic_id=${topic}">
								<c:if test="${sort == 1 or sort == null}"><span class="box_sorting on">최신순</span></c:if>
								<c:if test="${sort != 1 and sort != null}"><span class="box_sorting">최신순</span></c:if>
							</a>
							<a href="${appRoot}/meeting/main?sort=2&topic_id=${topic}">
								<c:if test="${sort == 2 }"><span class="box_sorting on">오래된 순</span></c:if>
								<c:if test="${sort != 2 }"><span class="box_sorting">오래된 순</span></c:if>
							</a>
 						</span>
 					</div>
 				</div>
            
            <!-- 게시물 리스트 start -->
            <div class="row g-4" id="meetingList">
	          <c:forEach items="${meetingList }" var="meeting">
			 	 <div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-delay="0.3s">
					<div class="service-item rounded overflow-hidden h-100">
						
								<img class="img-fluid mainImage1"
									src="${imageUrl }/meeting/${meeting.folderName}/${meeting.MPhoto}"
									style="width: 500px; height: 200px;" alt="">
								<div class="position-relative p-4 pt-0">
			                    <div class="meetingStatus service-icon">
			                         <span class="meetingCurrent"><i class="fa-solid fa-handshake-simple fa-2xl"></i></span>
			                    </div><!-- 
			                    <div class="service-icon">
			                         <span class="meetingCurrent"><i class="fa-solid fa-temperature-empty">종료</i></span>
			                    </div>
			                             --><p class="mb-2" style="font-weight: 600; font-size:18px; text-align:right;">${meeting.nickname }</p>
			                            <h4 class=" mb-3 mainTitle">${meeting.title }</h4>
			                            <a class="small fw-medium" href="${appRoot }/meeting/board/${meeting.meetingId}" ><span  style="font-weight: 600; font-size:18px;" >모임신청<i class="fa fa-arrow-right ms-2"></i></span></a>
				                    	<div>
					                    	<p class="timeLimit" style="margin:5px 0px; text-align:right; font-weight: 600;"><i class="fa-solid fa-clock"></i>${meeting.endDate }까지 신청하세요</p>
				                    	</div>
			                        </div>
			                    </div>
				            </div> <!-- 요기까지 forEach가야함 -->
				  		</c:forEach> 
			        </div>
			  	</div>
	   		 </div>
	   	</div>
    <!-- 게시물리스트 End -->
    
	<!-- 후기 Start -->
	<div class="container-xxl py-5">
		<div class="container">
			<div class="text-center mx-auto mb-5 wow fadeInUp"
				data-wow-delay="0.1s" style="max-width: 600px;">
				<h6 class="text-primary">꿀비 윙윙</h6>
				<h1 class="mb-4">꿀비 모임 생생한 행복나눔!</h1>
			</div>
			<div class="owl-carousel testimonial-carousel wow fadeInUp"
				data-wow-delay="0.1s">
				<c:forEach items="${commentList }" var="comment">
					<div class="testimonial-item text-center">
						<div class="testimonial-img position-relative">
							<img class="img-fluid rounded-circle mx-auto mb-5"
								src="${appRoot}/resources/webContents/img/user_profile.png">
							<div class="btn-square bg-primary rounded-circle">
								<i class="fa fa-quote-left text-white"></i>
							</div>
						</div>
						<div class="testimonial-text text-center rounded p-4">
							<p>${comment.content }</p>
							<h5 class="mb-1">${comment.memberId }</h5>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- 후기 End -->

	<!-- foot bar -->
	<my:footbar_kim></my:footbar_kim>
    <!-- Footer End -->

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>

	
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
$(document).ready(function() {
	// 후기 작성
	$("#commentAdd").click(function(e) {
		e.preventDefault();
		
		const content = window.prompt("모두의행동 후기를 남겨주세요!");
		document.getElementById('content').setAttribute("value",content);
		console.log(content);
		console.log(document.getElementById('content'));
		$("#commentAddForm1").submit();
	});

});

</script>
</body>

</html>