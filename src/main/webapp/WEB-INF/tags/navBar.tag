<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ attribute name="current"%>

<c:url value="/board/list" var="listUrl"></c:url>
<c:url value="/member/index" var="mainPageUrl"></c:url>
<c:url value="/member/signup" var="signupUrl"></c:url>
<c:url value="/member/info" var="pwInfoUrl"></c:url>
<c:url value="/member/info" var="memberInfoUrl"></c:url>
<c:url value="/member/login" var="loginUrl"></c:url>
<c:url value="/logout" var="logoutUrl"></c:url>
<c:url value="/member/initpw" var="initPasswordUrl"></c:url>
<c:url value="/member/changePw" var="changePasswordUrl"></c:url>
<c:url value="/member/about" var="aboutUrl"></c:url>

<%-- 회원정보링크 --%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
	<c:url value="/member/info" var="memberInfoUrl">
		<c:param name="memberId" value="${principal.username }" />
	</c:url>
</sec:authorize>

<style>

#aside {
	background-color: #ffca28;
	float: left;
	width: 280px%;
	padding: 75px 0 32px;
	box-sizing: border-box;
}

#aside {
	display: none;
	position: sticky;
	position: -webit-sticky;
	top: -30px;
}

.sidebarToggle {
	position: absolute;
	top: 30px;
	left: 30px;
	z-index: 300;
	display: inline-block;
	width: 30px;
	height: 30px;
	border: 1px solid #eee;
	border-radius: 50%;
	outline: none;
}

#fa-solid fa-bars {
	color: #fffd61;
}

/*** Navbar ***/
.navbar.sticky-top {
    top: -100px;
    transition: .5s;
}

.navbar .navbar-brand,
.navbar a.btn {
    height: 75px;
}

.navbar .navbar-nav .nav-link {
    margin-right: 30px;
    padding: 25px 0;
    color: var(--dark);
    font-size: 15px;
    font-weight: 500;
    text-transform: uppercase;
    outline: none;
}

.navbar .navbar-nav .nav-link:hover,
.navbar .navbar-nav .nav-link.active {
    color: var(--primary);
}

.navbar .dropdown-toggle::after {
    border: none;
    content: "\f107";
    font-family: "Font Awesome 5 Free";
    font-weight: 900;
    vertical-align: middle;
    margin-left: 8px;
}

@media screen and (max-width: 700px) {

}

@media (max-width: 992px) {
    .navbar .navbar-nav .nav-link  {
        margin-right: 0;
        padding: 10px 0;
    }

    .navbar .navbar-nav {
        border-top: 1px solid #EEEEEE;
    }
}

@media (min-width: 992px) {
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
        top: 100%;
        visibility: visible;
        transition: .5s;
        opacity: 1;
    }
    
.collapse navbar-collapse{
	flex-direction: column;
	align-items: flex-start;
	margin: 0;
	}
}


</style>

<script>
	$(document).ready(function() {
		$("#sidebarToggle").click(function() {
			if ($("#aside").css("display") == "none") {
				$("#aside").fadeIn(500);
			} else {
				$("#aside").hide();
			}
		});
	});
</script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>

<aside id="aside" class="sidebar">
	<div class="sidebar1">
		<!-- 홈화면 -->
		<div class="home">
			<ul>
				<li>
					<a class="nav-link ${current == 'index' ? 'active' : '' }"
						href="${mainPageUrl }">홈</a>
				</li>
			</ul>
		</div>

		<!-- 1:1 문의 -->
		<div class="inquiry">
			<h3>1:1 문의</h3>
		</div>

		<!-- 내가 쓴 기부 확인 -->
		<div class="myDonate">
			<h3>내가 쓴 기부 확인</h3>
		</div>

		<!-- 내가 쓴 리뷰 확인 -->
		<div class="myReview">
			<h3>내가 쓴 리뷰 확인</h3>
		</div>

		<!-- 주문 결제 -->
		<div class="order">
			<h3>주문 결제</h3>
		</div>

		<!-- 마이페이지 -->
		<div class="myPage">
			<ul>
				<li>
					<a href="${memberInfoUrl }"
						class="nav-link ${current == 'memberInfo' ? 'active' : '' }">마이페이지</a>
				</li>
			</ul>
		</div>

		<!-- 고객센터 -->
		<div class="customerService">
			<h3>고객센터</h3>
		</div>

		<!-- 의견 보내기 -->
		<div class="sendOpinion">
			<h3>의견 보내기</h3>
		</div>

	</div>
</aside>

<nav
	class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0">
	<a href="index" class="navbar-brand d-flex align-items-center border-end px-4 px-lg-5">
		<h2 class="m-0 text-primary">꿀비</h2>
	</a>
	
	<button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
    	<span class="navbar-toggler-icon"></span>
    </button>

	<div class="collapse navbar-collapse" id="navbarCollapse">
		<div class="navbar-nav ms-auto p-4 p-lg-0">
			<sec:authorize access="isAuthenticated()">
				<li class="nav-item">
					<a class= "nav-item active nav-link ${current == 'index' ? 'active' : '' }" href="${mainPageUrl }">홈</a>
				</li>
			</sec:authorize>
			
			<ul>
				<li class="nav-item">
					<a class="nav-item nav-link ${current == 'about' ? 'active' : '' }" href="${aboutUrl }">About 꿀비</a>
				</li>
			</ul>
			
			<sec:authorize access="isAuthenticated()">
			<li class="nav-item">
				<a class="nav-item nav-link" href="#">기부하기</a>
			</li>
			</sec:authorize>
			
			<sec:authorize access="not isAuthenticated()">
				<li class="nav-item">
					<a class="nav-item nav-link ${current == 'signup' ? 'active' : '' }" href="${signupUrl }">회원가입</a>
				</li>
			</sec:authorize>
			
			<sec:authorize access="isAuthenticated()">
				<li class="nav-item">
					<a class="nav-item nav-link ${current == 'memberInfo' ? 'active' : '' }" href="${memberInfoUrl }">마이페이지</a>
				</li>
			</sec:authorize>
			
			<sec:authorize access="not isAuthenticated()">
				<li class="nav-item">
					<a class="nav-item nav-link" href="${loginUrl }">로그인</a>
				</li>
			</sec:authorize>
			
			<sec:authorize access="isAuthenticated()">
				<li class="nav-item">
					<button class="btn btn-link nav-link" type="submit" form="logoutForm1">로그아웃</button>
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
            <a href="" class="btn btn-primary rounded-0 py-4 px-lg-5 d-none d-lg-block">Get A Quote<i class="fa fa-arrow-right ms-3"></i></a>
		</div>
	</div>
					<!-- 
        <sec:authorize access="hasRole('USER')">
	        <div class="nav-item">
	        	<a href="${initPasswordUrl }" class="nav-link">암호초기화</a>
	        </div>
        </sec:authorize>
         -->

				<!-- form.d-flex>input.form-control.me-2[type=search]+button.btn.btn-outline-success -->
<!--
				<form action="${listUrl }" class="d-flex">
					<div class="input-group">
						<select name="type" id="" class="form-select"
							style="flex: 0 0 100px;">
							<option value="all"
								${param.type != 'title' && param.type != 'body' ? 'selected' : '' }>전체</option>
							<option value="title" ${param.type == 'title' ? 'selected' : '' }>제목</option>
							<option value="body" ${param.type == 'body' ? 'selected' : ''}>본문</option>
						</select>

						<input type="search" class="form-control" name="keyword" />
						<button class="btn btn-outline-success">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</div>
				</form>
 -->

</nav>











