<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:url value="/resources/admin" var="resources" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="${resources }/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<link href="${resources }/css/sb-admin-2.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<title>Insert title here</title>
</head>
<body>
	<div id="wrapper">
	
		<nav:sidebar></nav:sidebar>
		        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <nav:topbar></nav:topbar>
				<!-- Page Header Start -->
				<div class="container-fluid">
					<div class="container">
						<div class="row">
							<div class="col">
								<h1>기부 게시판</h1>
								<!-- Page Header End -->
								<!-- Page content-->
								<div id="wrap_cnt_prom">
									<!-- Body Content -->
									<div id="body_cont">
										<div class="cont_box">
											<!-- <span class="img_ico"><img src=""></span> -->
											<span class="fw-bolder tit_head">${donation.title }</span> 
											<span class="txt_body">by ${donation.nickname }</span>
											<span class="txt_body">${donation.content }</span>
											<!-- 대표 이미지-->
											<c:if test="${empty donation.MPhoto }">
												<figure class="img_ico mb-4">
													<img class="img-fluid rounded" src="https://dummyimage.com/900x400/ced4da/6c757d.jpg" alt="..." />
												</figure>
											</c:if>
											<c:if test="${not empty donation.MPhoto }">
												<figure class="mb-4">
													<img class="img-fluid" src="https://bucket0207-spring0520-teacher-test.s3.ap-northeast-2.amazonaws.com/donation/${donation.folderName }/${donation.MPhoto}" alt="">
												</figure>
											</c:if>
							
											<p class="fs-5 mb-4">For me, the most fascinating interface is
												Twitter. I have odd cosmic thoughts every day and I realized I
												could hold them to myself or share them with people who might be
												interested.</p>
											<p class="fs-5 mb-4">Venus has a runaway greenhouse effect. I
												kind of want to know what happened there because we're twirling
												knobs here on Earth without knowing the consequences of it. Mars
												once had running water. It's bone dry today. Something bad happened
												there as well.</p>
											
											<p class="mb-4"></p>
											<h2>${donation.currentAmountMakedDecimalFormat}원</h2>
											<h5>${donation.goalMakedDecimalFormat}</h5>
											<div class="progress mb-2">
												<div class="progress-bar bg-warning" role="progressbar"
													style="width: ${donation.achievementRate}%" aria-valuenow="${donation.achievementRate}" aria-valuemin="0"
													aria-valuemax="100"></div>
											</div>
							
											<p>모금기간 : ${donation.inserted} ~ ${donation.expired}</p>
											
											<hr class="mt-5 mb-4" />
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
    <script src="${appRoot }/resources/admin/vendor/jquery/jquery.min.js"></script>
    <script src="${appRoot }/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${appRoot }/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${appRoot }/resources/admin/js/sb-admin-2.min.js"></script>
</body>
</html>