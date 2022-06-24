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
body{
	margin: 0;
	height:500px;
}
section{
	height: 500px;
	width: 100%;
	background: url(https://ymcaofcoastalga.org/clientuploads/volunteer.jpg) fixed;
	background-size: contain;
	background-repeat: no-repeat;
	background-position: 0px 30px;
}
.introduction{
	color: yellow;
	font-family: sans-serif;
	top: 20px;
	animation: slide;
}
</style>

</head>
<body>
	<my:navBar current="about"></my:navBar>

	<section>
		
	</section>
	<!-- about 내용 -->
	<div class="introduction">
		<h4>누구나 사회를 변화시킬 수 있습니다.</h4>
		<h5>더 나은 사회를 만들고 싶다면 누구나 공익 프로젝트를 제안하고 모금을 진행할 수 있습니다.</h5>

		<h4>공익을 위한 모든 것을 제안할 수 있습니다.</h4>
		<h5>이웃과 함께 하는 마을사업, 청년들을 위한 일자리 캠페인 등 더 나은 사회를 위한 프로젝트라면 모두
			환영합니다. 다양한 프로젝트를 만들고 만나보세요.</h5>

		<h4>함께 할 수 있기에 더욱 즐겁습니다.</h4>
		<h5>주위 사람들에게 같이가치 콘텐츠를 알리는 것 만으로도 충분합니다. ♡응원이나 공유만 해도 카카오가 여러분의
			이름으로 대신 기부합니다.</h5>

		<h4>함께 할 수 있는 일을 해요, 모두의행동</h4>
		<h5>우리 사회가 함께 해결해야 할 다양한 주제들을 같이 고민하고 함께 행동해보세요.</h5>

		<h4>착한 마음을 맑게 유지해요, 마음날씨</h4>
		<h5>'안녕지수'로 다른 사람들의 마음과 내 마음의 안녕을 확인하고 '마음챙김'과 '힐링사운드'로 지친 마음을
			위로받을 수 있어요.</h5>
	</div>

	<hr />
	
	<!-- 슬라이드 -->
	<div id="carouselExampleCaptions" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="..." class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h5>First slide label</h5>
					<p>Some representative placeholder content for the first slide.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="..." class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h5>Second slide label</h5>
					<p>Some representative placeholder content for the second
						slide.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="..." class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h5>Third slide label</h5>
					<p>Some representative placeholder content for the third slide.</p>
				</div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Next</span>
		</button>
	</div>
	
	<hr />
	
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