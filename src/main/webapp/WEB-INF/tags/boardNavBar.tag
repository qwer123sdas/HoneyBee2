<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ attribute name="current"%>

<c:url value="/board/list" var="listUrl"></c:url>
<c:url value="/member/index" var="mainPageUrl"></c:url>
<c:url value="/member/signup" var="signupUrl"></c:url>
<c:url value="/member/info" var="pwInfoUrl"></c:url>
<c:url value="/member/info" var="memberInfoUrl" scope='request'></c:url>
<c:url value="/member/login" var="loginUrl"></c:url>
<c:url value="/logout" var="logoutUrl"></c:url>
<c:url value="/member/findIdView" var="findIdViewUrl"></c:url>
<c:url value="/member/findId" var="findIdUrl"></c:url>
<c:url value="/member/initpw" var="initPasswordUrl"></c:url>
<c:url value="/member/updatePw" var="updatePwUrl"></c:url>
<c:url value="/member/changePw" var="changePwUrl"></c:url>
<c:url value="/member/about" var="aboutUrl"></c:url>
<c:url value="/member/faqList" var="faqUrl"></c:url>
<c:url value="/meeting/login" var="loginUrl"></c:url>

<%-- 회원정보링크 --%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
	<c:url value="/member/info" var="memberInfoUrl" scope='request'>
		<c:param name="memberId" value="${principal.username }" />
	</c:url>
</sec:authorize>

<style>
#fa-solid fa-bars {
	color: #fffd61;
}

/*** Navbar ***/
.navbar.sticky-top {
	top: -100px;
	transition: .5s;
}

.navbar .navbar-brand, .navbar a.btn {
	height: 75px;
}

.navbar .navbar-nav .nav-link {
	margin-right: 30px;
	padding: 25px 0;
	color: #1A2A36;
	font-size: 15px;
	font-weight: 500;
	text-transform: uppercase;
	outline: none;
}
.navbar .navbar-nav .nav-link:hover{
	color: #fbc02d;
}
.navbar .navbar-nav .nav-link:active {
	color: #fbc02d;
}

.navbar .dropdown-toggle:after {
	border: none;
	content: "\f107";
	font-family: "Font Awesome 5 Free";
	font-weight: 900;
	vertical-align: middle;
	margin-left: 8px;
}

@media screen and (max-width: 700px) {
}

@media ( max-width : 992px) {
	.navbar .navbar-nav .nav-link {
		margin-right: 0;
		padding: 10px 0;
	}
	.navbar .navbar-nav {
		border-top: 1px solid #EEEEEE;
	}
}

@media ( min-width : 992px) {
	.navbar .nav-item .dropdown-menu {
		display: block;
		border: none;
		margin-top: 0;
		top: 150%;
		opacity: 0;
		visibility: hidden;
		transition: .5s;
	}
	.navbar .nav-item:hover .dropdown-menu {
		color: #fbc02d;
		top: 100%;
		visibility: visible;
		transition: .5s;
		opacity: 1;
	}
	.collapse navbar-collapse {
		flex-direction: column;
		align-items: flex-start;
		margin: 0;
	}
}
</style>
<!-- fontAwesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
	
<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap"
	rel="stylesheet">
<nav
	class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0">
	<a href="index"
		class="navbar-brand d-flex align-items-center border-end px-4 px-lg-5">
		<h2 class="m-0 text-primary">
			<img src="${appRoot }/resources/webContents/img/honeybee1.jpg"
				style="width: 200px; height: 75.6px;" />
		</h2>
	</a>

	<button type="button" class="navbar-toggler me-4"
		data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarCollapse">
		<div class="navbar-nav ms-auto p-4 p-lg-0">
			<sec:authorize access="isAuthenticated()">
				<li class="nav-item">
					<a
						class="nav-item active nav-link ${current == 'index' ? 'active' : '' }"
						href="${mainPageUrl }">홈</a>
				</li>
			</sec:authorize>

			<li class="nav-item">
				<a class="nav-item nav-link ${current == 'about' ? 'active' : '' }"
					href="${aboutUrl }">About 꿀비</a>
			</li>

			<sec:authorize access="isAuthenticated()">
				<li class="nav-item">
					<a class="nav-item nav-link" href="#">기부하기</a>
				</li>
			</sec:authorize>

			<sec:authorize access="not isAuthenticated()">
				<li class="nav-item">
					<a
						class="nav-item nav-link ${current == 'signup' ? 'active' : '' }"
						href="${signupUrl }">회원가입</a>
				</li>
			</sec:authorize>

			<sec:authorize access="isAuthenticated()">
				<li class="nav-item dropdown">
					<a
						class="nav-item nav-link dropdown-toggle ${current == 'memberInfo' ? 'active' : '' }"
						data-toggle="dropdown" href="${memberInfoUrl }">마이페이지 </a>

					<div class="dropdown-menu">
						<a href="${memberInfoUrl }" class="dropdown-item">회원 정보 변경</a>
						<a href="myBoard" class="dropdown-item">내가 쓴 글</a>
						<a href="myReview" class="dropdown-item">내가 쓴 후기</a>
						<a href="faqList" class="dropdown-item">상담 내역</a>
					</div>
				</li>

				<!-- 
				<ul class="">
					<li class="dropdown-item">회원 정보 수정</li>
					<li class="dropdown-item">1:1 문의</li>
					<li class="dropdown-item">내가 쓴 리뷰</li>
					<li class="dropdown-item">내가 쓴 기부</li>
				</ul>
				 -->
			</sec:authorize>

			<sec:authorize access="not isAuthenticated()">
				<li class="nav-item">
					<a class="nav-item nav-link" href="${loginUrl }">로그인</a>
				</li>
			</sec:authorize>

			<sec:authorize access="isAuthenticated()">
				<li class="nav-item">
					<button class="btn btn-link nav-link" type="submit"
						form="logoutForm1">로그아웃</button>
				</li>
			</sec:authorize>
			<!-- 
			<sec:authorize access="isAuthenticated()">
				<li class="nav-item">
					<c:if test="">
					</c:if>
				</li>
			</sec:authorize>
			
			 -->
			<div class="d-none">
				<form action="${logoutUrl }" id="logoutForm1" method="post"></form>
			</div>
			<a href=""
				class="btn btn-warning rounded-0 py-4 px-lg-5 d-none d-lg-block">
				둘러보기<i class="fa fa-arrow-right ms-3"></i>
			</a>
		</div>
	</div>
</nav>





<!-- Navbar Start -->
<!-- 
    <nav class="navbar navbar-expand-lg fixed-top py-lg-0 px-lg-5 wow fadeIn" data-wow-delay="0.1s" style="background-color: white;">
        <a href="index.html" class="navbar-brand ms-4 ms-lg-0">
            <h1 class="text-primary m-0">Baker</h1>
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav mx-auto p-4 p-lg-0">
                <a href="index.html" class="nav-item nav-link active">Home</a>
                <a href="about.html" class="nav-item nav-link">About</a>
                <a href="service.html" class="nav-item nav-link">Services</a>
                <a href="product.html" class="nav-item nav-link">Products</a>
                <a href="${loginUrl }" class="nav-item nav-link">로그인</a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                    <div class="dropdown-menu m-0">
                        <a href="team.html" class="dropdown-item">Our Team</a>
                        <a href="testimonial.html" class="dropdown-item">Testimonial</a>
                        <a href="404.html" class="dropdown-item">404 Page</a>
                    </div>
                </div>
                <a href="contact.html" class="nav-item nav-link">Contact</a>
            </div>
            <div class=" d-none d-lg-flex">
                <div class="flex-shrink-0 btn-lg-square border border-light rounded-circle">
                    <i class="fa fa-phone text-primary"></i>
                </div>
                <div class="ps-3">
                    <small class="text-primary mb-0">Call Us</small>
                    <p class="text-light fs-5 mb-0">+012 345 6789</p>
                </div>
            </div>
        </div>
    </nav>
     -->
<!-- Navbar End -->