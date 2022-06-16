<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Blog Post - Start Bootstrap Template</title>
        
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
	    <meta content="" name="keywords">
	    <meta content="" name="description">

	    <!-- Google Web Fonts -->
	    <link rel="preconnect" href="https://fonts.googleapis.com">
	    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap" rel="stylesheet"> 
	
	    <!-- google font 추가함 -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
	    
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
	    
	    <style>
	    
	    body {
		  margin: 0;
		  font-size: var(--bs-body-font-size);
		  font-weight: var(--bs-body-font-weight);
		  line-height: var(--bs-body-line-height);
		  color: var(--bs-body-color);
		  text-align: var(--bs-body-text-align);
		  background-color: var(--bs-body-bg);
		  -webkit-text-size-adjust: 100%;
		  -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
		}
	    
	    .container,
		.container-fluid,
		.container-xxl,
		.container-xl,
		.container-lg,
		.container-md,
		.container-sm {
		  width: 100%;
		  padding-right: var(--bs-gutter-x, 0.75rem);
		  padding-left: var(--bs-gutter-x, 0.75rem);
		  margin-right: auto;
		  margin-left: auto;
		}
		
		.mt-5 {
		  margin-top: 3rem !important;
		}
		
		.mb-4 {
		  margin-bottom: 1.5rem !important;
		}
		
		.mb-5 {
		  margin-bottom: 3rem !important;
		}
		
		.bg-light {
		  --bs-bg-opacity: 1;
		  background-color: rgba(var(--bs-light-rgb), var(--bs-bg-opacity)) !important;
		}
		
		.card-body {
		  flex: 1 1 auto;
		  padding: 1rem 1rem;
		}
		
		.input-group {
		  position: relative;
		  display: flex;
		  flex-wrap: wrap;
		  align-items: stretch;
		  width: 100%;
		}
		
		.input-group-lg > .form-control,
		.input-group-lg > .form-select,
		.input-group-lg > .input-group-text,
		.input-group-lg > .btn {
		  padding: 0.5rem 1rem;
		  font-size: 1.25rem;
		  border-radius: 0.3rem;
		}
		
		<!-- 대댓글 부분 -->
		.d-flex {
		  display: flex !important;
		}
		.flex-shrink-0 {
		  flex-shrink: 0 !important;
		}
		.rounded-circle {
		  border-radius: 50% !important;
		}
		.ms-3 {
		  margin-left: 1rem !important;
		}
		.fw-bold {
		  font-weight: 700 !important;
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
		<nav:navbar></nav:navbar>
	
	
	    <!-- Page Header Start -->
	    <div class="container-fluid page-header py-5 mb-5">
	        <div class="container py-5">
	            <h1 class="display-3 text-white mb-3 animated slideInDown">기부 모임</h1>
	            <nav aria-label="breadcrumb animated slideInDown">
	            </nav>
	        </div>
	    </div>
	    <!-- Page Header End -->
        <!-- Page content-->
	<div class="container mt-4">
		<div class="row">
			<div class="col-lg-8">

				<!-- Post content Start -->
				<article>
					<!-- Post title Start -->
					<header class="mb-4">
						<!-- Post title-->
						<h1 class="fw-bolder mb-1">${meeting.title }</h1>
						<!-- Post meta content-->
						<div class="text-muted fst-italic mb-2">${meeting.startDate } ~ ${meeting.endDate }</div>
						<!-- Post categories-->
						<a class="badge bg-secondary text-decoration-none link-light"
							href="#!">${meeting.tag }</a>
					</header>
					<!-- Post title End -->

					<!-- Preview image -->
					<figure class="mb-4">
						<img class="img-fluid rounded"
							src="https://dummyimage.com/900x400/ced4da/6c757d.jpg" alt="..." />
					</figure>

					<!-- Post content-->
					<section class="mb-5">
						<p class="fw-bolder fs-5 mb-4">${meeting.content }</p>
						<p class="fs-5 mb-4">host by. ${meeting.nickname }</p>
						<h2 class="fw-bolder mb-4 mt-5">I have odd cosmic thoughts
							every day</h2>
						<p class="fs-5 mb-4">For me, the most fascinating interface is
							Twitter. I have odd cosmic thoughts every day and I realized I
							could hold them to myself or share them with people who might be
							interested.</p>
						<p class="fs-5 mb-4">Venus has a runaway greenhouse effect. I
							kind of want to know what happened there because we're twirling
							knobs here on Earth without knowing the consequences of it. Mars
							once had running water. It's bone dry today. Something bad
							happened there as well.</p>
					</section>
				</article>
				
				<!-- 카카오 지도 api -->
				<div class="mb-5 container">
					<div id="map" style="width:690 px; height:400px; margin:auto; margin-top:10px;"></div>
				</div>

					<!-- 댓글, 대댓글 -->
                    <section class="mt-5 mb-5">
                        <div class="card bg-light">
                            <div class="card-body">
                                <!-- 댓글 입력 form -->
                                <form class="mb-4" id="insertReplyForm1" action="${appRoot }/meeting/reply/insert" method="post">
									<div class="input-group">
									<input type="hidden" name="meetingId" value="${meeting.meetingId }"/>
									<input id="insertReplyContentInput1" class="form-control" type="text" name="content"
											placeholder="아름다운 발걸음을 함께해요!"/>
									<button class="btn btn-primary" id="insertReplyButton1" type="submit">한걸음!</button>
									
								</div>
							</form>
                                <!-- 댓글 대댓글 -->
                                <div class="d-flex mb-4">
                                    <!-- 부모댓글 출력 -->
                                    <c:forEach items="${replyList }" var="reply">
	                                    <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
	                                    <div class="ms-3">
	                                        <div class="fw-bold">${reply.nickname } ${reply.inserted }</div>
	                                        ${reply.content } 
	                                        <hr>
                                    </c:forEach>
                                        <!-- 자식 댓글 출력 
                                        -->
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
                    <!-- Search widget-->
                    <div class="card mb-4">
                        <div class="card-header">Search</div>
                        <div class="card-body">
                            <div class="input-group">
                                <input class="form-control" type="text" placeholder="Enter search term..." aria-label="Enter search term..." aria-describedby="button-search" />
                                <button class="btn btn-primary" id="button-search" type="button">Go!</button>
                            </div>
                        </div>
                    </div>
                    <!-- Categories widget-->
                    <div class="card mb-4">
                        <div class="card-header">Categories</div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><a href="#!">Web Design</a></li>
                                        <li><a href="#!">HTML</a></li>
                                        <li><a href="#!">Freebies</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><a href="#!">JavaScript</a></li>
                                        <li><a href="#!">CSS</a></li>
                                        <li><a href="#!">Tutorials</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Side widget-->
                    <div class="card mb-4">
                        <div class="card-header">Side Widget</div>
                        <div class="card-body">You can put anything you want inside of these side widgets. They are easy to use, and feature the Bootstrap 5 card component!</div>
                    </div>
                </div>
            </div>
        </div>

		<!-- foot bar -->
		<nav:footbar></nav:footbar>


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
	    
	   	<!-- 카카오 지도 api 실행, 코드보다 먼저 선언 -->
	    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=85d045c455e66b45c873d8a3ab36b2ed"></script>
	    
        
	    <script>
	    	/* 카카오 지도 api */
		    var mapContainer = document.getElementById('map'); // 지도 div
		    var option = { //지도를 생성할 때 필요한 기본 옵션
		    	center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표
		    	level: 3 //지도의 레벨(확대, 축소 정도)
		    };
			
		 	 //지도 생성 및 객체 리턴	
		    var map = new kakao.maps.Map(container, option); 
		 	 
			 // 주소, 좌표 변환 객체를 생성
		    var geocoder = new kakao.maps.services.Geocoder();
			
			 // 주소로 좌표를 검색
		    geocoder.addressSearch('서울시 광진구 천호대로 579', function(result, status) {

		   	// 정상적으로 검색이 완료됐으면 
		    if (status === kakao.maps.services.Status.OK) {

		    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		    // 결과값으로 받은 위치를 마커로 표시
		    var marker = new kakao.maps.Marker({
		        	map: map,
		            position: coords
		   	});

		    // 인포윈도우로 장소에 대한 설명을 표시
		    var infowindow = new kakao.maps.InfoWindow({
		                content: '<div style="width:150px;text-align:center;padding:6px 0;">꿀비장소</div>'
		    });
		    infowindow.open(map, marker);

		     // 지도의 중심을 결과값으로 받은 위치로 이동
		    map.setCenter(coords);
		     
		    	} 
			});    	
			 
			const
	    
</script>
</body>
	    

</html>