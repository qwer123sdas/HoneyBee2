<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>서비스소개: 꿀비</title>

<style>
body {
	margin: 0;
	height: 500px;
}

body, button, input, select, textarea, h4, h5{
	font-family: sans-serif;
	font-size: 14px;
	line-height: 1.5;
	color: #444;
}

img{
	max-width: 100%;
	height: auto;
}

section {
	height: 500px;
	width: 100%;
	background: url(https://ymcaofcoastalga.org/clientuploads/volunteer.jpg) fixed;
	background-size: contain;
	background-repeat: no-repeat;
	background-position: 0px 30px;
}

.introduction {
	color: yellow;
	font-family: sans-serif;
	top: 20px;
	animation: slide;
}
</style>

</head>
<body>
	<my:mainNavBar current="about"></my:mainNavBar>

	<section></section>
	<!-- about 내용 -->
	<div class="introduction">
		<h4>누구나 사회를 변화시킬 수 있습니다.</h4>
		<h5>더 나은 사회를 만들고 싶다면 누구나 공익 프로젝트를 제안하고 모금을 진행할 수 있습니다.</h5>

		<h4>공익을 위한 모든 것을 제안할 수 있습니다.</h4>
		<h5>이웃과 함께 하는 마을사업, 청년들을 위한 일자리 캠페인 등 더 나은 사회를 위한 프로젝트라면 모두
			환영합니다. 다양한 프로젝트를 만들고 만나보세요.</h5>

		<h4>함께 할 수 있기에 더욱 즐겁습니다.</h4>
		<h5>주위 사람들에게 같이가치 콘텐츠를 알리는 것 만으로도 충분합니다. ♡응원이나 공유만 해도 꿀비가 여러분의
			이름으로 대신 기부합니다.</h5>

		<h4>함께 할 수 있는 일을 해요, 모두의행동</h4>
		<h5>우리 사회가 함께 해결해야 할 다양한 주제들을 같이 고민하고 함께 행동해보세요.</h5>

		<h4>착한 마음을 맑게 유지해요, 마음날씨</h4>
		<h5>'안녕지수'로 다른 사람들의 마음과 내 마음의 안녕을 확인하고 '마음챙김'과 '힐링사운드'로 지친 마음을
			위로받을 수 있어요.</h5>
	</div>

	<!-- 슬라이드 -->
	<div id="carouselExampleInterval" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active" data-bs-interval="10000">
				<img
					src="https://mud-kage.kakaocdn.net/dn/cI8SiF/btqjFmjZaut/2R9mbQpxuxVKlt7R8lkJGk/img.png"
					class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item" data-bs-interval="8000">
				<img
					src="https://mud-kage.kakaocdn.net/dn/NbtUx/btqjAdPaCaj/hG6waxVbS0Ya62xcILA2W1/img.png"
					class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item" data-bs-interval="8000">
				<img
					src="https://mud-kage.kakaocdn.net/dn/h7DcA/btqjJbIJvZy/auLAPsDnLXcQEMUs32GK11/img.png"
					class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item" data-bs-interval="8000">
				<img
					src="https://mud-kage.kakaocdn.net/dn/ccnkLH/btqjGVl7Q9p/gSvibw8pJMDdihTCB9aFw1/img.png"
					class="d-block w-100" alt="...">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="visually-hidden">이전</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleInterval" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="visually-hidden">다음</span>
		</button>
	</div>

	<div class="donationTogether">
		<h3>꿀비에서 우리가 함께 만드는 변화는 무궁무진 합니다.</h3>
		
		<h5><!-- 프로젝트 횟수 넣기 -->가 꿀비를 통해 사회 변화를 만들어 냈습니다.</h5>
		
		<h5><!-- 모금 횟수 넣기 -->이 모여 사회 변화를 이루어냈습니다.</h5>
		
		<h5><!-- 총 기부금 넣기 -->이 꿀비에서 사회 변화를 위해 모여졌습니다.</h5>
		
		<h5>꿀비에서는 모금 프로젝트당 <!-- 평균 기부금 액수 -->이 모금됩니다.</h5>
	</div>

	<div class="d-grid gap-2 col-6 mx-auto">
		<button class="btn btn-secondary">제안하기</button>
		<button class="btn btn-warning">기부하기</button>
	</div>

	<!-- Footer Start -->
	<div
		class="container-fluid bg-dark text-body footer mt-5 pt-5 wow fadeIn"
		data-wow-delay="0.1s">
		<div class="container py-5">
			<div class="row g-5">
				<div class="col-lg-3 col-md-6">
					<h5 class="text-white mb-4">Address</h5>
					<p class="mb-2">
						<i class="fa fa-map-marker-alt me-3"></i>
						123 Street, New York, USA
					</p>
					<p class="mb-2">
						<i class="fa fa-phone-alt me-3"></i>
						+012 345 67890
					</p>
					<p class="mb-2">
						<i class="fa fa-envelope me-3"></i>
						info@example.com
					</p>
					<div class="d-flex pt-2">
						<a class="btn btn-square btn-outline-light btn-social" href="">
							<i class="fab fa-twitter"></i>
						</a>
						<a class="btn btn-square btn-outline-light btn-social" href="">
							<i class="fab fa-facebook-f"></i>
						</a>
						<a class="btn btn-square btn-outline-light btn-social" href="">
							<i class="fab fa-youtube"></i>
						</a>
						<a class="btn btn-square btn-outline-light btn-social" href="">
							<i class="fab fa-linkedin-in"></i>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<h5 class="text-white mb-4">Quick Links</h5>
					<a class="btn btn-link" href="">About Us</a>
					<a class="btn btn-link" href="">Contact Us</a>
					<a class="btn btn-link" href="">Our Services</a>
					<a class="btn btn-link" href="">Terms & Condition</a>
					<a class="btn btn-link" href="">Support</a>
				</div>
				<div class="col-lg-3 col-md-6">
					<h5 class="text-white mb-4">Project Gallery</h5>
					<div class="row g-2">
						<div class="col-4">
							<img class="img-fluid rounded"
								src="${appRoot }/resources/webContents/img/gallery-1.jpg" alt="">
						</div>
						<div class="col-4">
							<img class="img-fluid rounded"
								src="${appRoot }/resources/webContents/img/gallery-2.jpg" alt="">
						</div>
						<div class="col-4">
							<img class="img-fluid rounded"
								src="${appRoot }/resources/webContents/img/gallery-3.jpg" alt="">
						</div>
						<div class="col-4">
							<img class="img-fluid rounded"
								src="${appRoot }/resources/webContents/img/gallery-4.jpg" alt="">
						</div>
						<div class="col-4">
							<img class="img-fluid rounded"
								src="${appRoot }/resources/webContents/img/gallery-5.jpg" alt="">
						</div>
						<div class="col-4">
							<img class="img-fluid rounded"
								src="${appRoot }/resources/webContents/img/gallery-6.jpg" alt="">
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<h5 class="text-white mb-4">Newsletter</h5>
					<p>Dolor amet sit justo amet elitr clita ipsum elitr est.</p>
					<div class="position-relative mx-auto" style="max-width: 400px;">
						<input class="form-control border-0 w-100 py-3 ps-4 pe-5"
							type="text" placeholder="Your email">
						<button type="button"
							class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="copyright">
				<div class="row">
					<div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
						&copy;
						<a href="#">Your Site Name</a>
						, All Right Reserved.
					</div>
					<div class="col-md-6 text-center text-md-end">
						<!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
						Designed By
						<a href="https://htmlcodex.com">HTML Codex</a>
						<br>
						Distributed By:
						<a href="https://themewagon.com" target="_blank">ThemeWagon</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer End -->

</body>
</html>