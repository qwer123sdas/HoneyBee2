<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ attribute name="current"%>

<c:url value="/board/list" var="listUrl"></c:url>
<c:url value="/main" var="mainPageUrl"></c:url>
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
<c:url value="/member/myBoard" var="myBoardUrl"></c:url>
<c:url value="/member/myReview" var="myReviewUrl"></c:url>
<c:url value="/member/about" var="aboutUrl"></c:url>
<c:url value="/member/faqList" var="faqUrl"></c:url>
<c:url value="/member/payList" var="payUrl"></c:url>
<c:url value="/member/talentPayList" var="talentPayUrl"></c:url>
<%-- payList,faqList,talentPayList 넣어둠.  --%>
<c:url value="/donation/main" var="donationMainUrl"></c:url>
<c:url value="/talent/main" var="talentMainUrl"></c:url>
<c:url value="/meeting/main" var="meetingMainUrl"></c:url>
<c:url value="/market/list" var="marketListUrl"></c:url>

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
@media ( prefers-reduced-motion : reduce) {
	.btn {
		transition: none
	}
}

.btn-primary {
	background-color: #fbc02d;
	border-color: #fbc02d
}

.btn-primary:hover {
	color: #000;
	background-color:#fdd835;
	border-color: #fdd835
}

.btn-check:focus+.btn-primary, .btn-primary:focus {
	color: #000;
	background-color: #fdd835;
	border-color: #fdd835;
	box-shadow: 0 0 0 .25rem rgba(43, 166, 92, 0.5)
}

.btn-check:checked+.btn-primary, .btn-check:active+.btn-primary,
	.btn-primary:active, .btn-primary.active, .show>.btn-primary.dropdown-toggle
	{
	color: #000;
	background-color: #fdd835;
	border-color: #fdd835
}

.btn-check:checked+.btn-primary:focus, .btn-check:active+.btn-primary:focus,
	.btn-primary:active:focus, .btn-primary.active:focus, .show>.btn-primary.dropdown-toggle:focus
	{
	box-shadow: 0 0 0 .25rem rgba(43, 166, 92, 0.5)
}

.btn-primary:disabled, .btn-primary.disabled {
	color: #000;
	background-color: #fbc02d;
	border-color: #fbc02d
}

}


#honeybeeMainNavBar .navbar-nav .dropdown-submenu .dropdown-menu {
	display: none;
	top: 0;
	left: 100%;	
}

.dropdown-submenu {
	position: relative;
}

#honeybeeMainNavBar .navbar-nav .dropdown-submenu:hover .dropdown-menu {
	display: block;
}

.dropdown-menu a{
	text-align: center;
	margin: 0 auto;
	text-decoration: none;
}
.over{
	color: #000000 !important;
}
</style>

<script>
	// jQuery text hover
	$(document).ready(function() {
		$("#dropdown-sub-item1").hover(function() {
			$(this).addClass('over');
		}, function() {
			$(this).removeClass('over');
		});
		
		$("#dropdown-sub-item2").hover(function() {
			$(this).addClass('over');
		}, function() {
			$(this).removeClass('over');
		});
		
		$("#dropdown-sub-item3").hover(function() {
			$(this).addClass('over');
		}, function() {
			$(this).removeClass('over');
		});
	});
</script>
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
	

<nav id="honeybeeMainNavBar"
	class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0">
	<a href="${mainPageUrl }"
		class="navbar-brand d-flex align-items-center border-end px-4 px-lg-5">
			<h2 class="m-0 text-primary"><img src="${appRoot }/resources/webContents/img/honeyBeeLogo.png" 
			style="width: 80px; height: 80px;" /><span style="font-weight: 700; color: #fbc02d;">HoneyBee</span></h2>
	</a>

	<button type="button" class="navbar-toggler me-4"
		data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarCollapse">
		<div class="navbar-nav ms-auto p-4 p-lg-0">
				<li class="nav-item">
					<a
						class="nav-item nav-link ${current == 'main' ? 'active' : '' }"
						href="${mainPageUrl }">홈</a>
				</li>
				
				<li class="nav-item">
					<a class="nav-item nav-link ${current == 'about' ? 'active' : '' }"
						href="${aboutUrl }">About 꿀비</a>
				</li>
				
				<li class="nav-item">
					<a class="nav-item nav-link ${current == 'marketList' ? 'active' : '' }"
						href="${marketListUrl }">마켓</a>
				</li>
			
				<!-- 이중 dropdown -->
				<div class="nav-item dropdown">
					<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">메인메뉴</a>
					<ul class="dropdown-menu">
						<li class="dropdown-submenu">
							<a href="${donationMainUrl }" class="dropdown-item">기부하기</a>
							<ul class="dropdown-menu">
								<li>
									<a id="dropdown-sub-item1" href="${donationWriteUrl }" style="color: #fbc02d">&nbsp;&nbsp;&nbsp;&nbsp;기부 제안하기</a>
								</li>
							</ul>
						</li>
						<li class="dropdown-submenu">
							<a href="${talentMainUrl }" class="dropdown-item">재능기부</a>
							<ul class="dropdown-menu">
								<li>
									<a id="dropdown-sub-item2" href="${talentWriteUrl }" style="color: #fbc02d">&nbsp;&nbsp;&nbsp;&nbsp;재능 제안하기</a>
								</li>
							</ul>
						</li>
						<li class="dropdown-submenu">
							<a href="${meetingMainUrl }" class="dropdown-item">모두의행동</a>
							<ul class="dropdown-menu">
								<li>
									<a id="dropdown-sub-item3" href="${meetingInsertUrl }" style="color: #fbc02d">&nbsp;&nbsp;&nbsp;&nbsp;모임 제안하기</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
				
			<sec:authorize access="not isAuthenticated()">
				<li class="nav-item">
					<a
						class="nav-item nav-link ${current == 'signup' ? 'active' : '' }"
						href="${signupUrl }">회원가입</a>
				</li>
			</sec:authorize>

			<sec:authorize access="isAuthenticated()">
				<li class="nav-item dropdown">
					<a class="nav-item nav-link dropdown-toggle${current == 'memberInfo' ? 'active' : '' }" data-toggle="dropdown"
						href="${memberInfoUrl }">마이페이지
					</a>
					
					<div class="dropdown-menu">
						<a href="${memberInfoUrl }" class="dropdown-item">회원 정보 변경</a>
						<a href="${myBoardUrl }" class="dropdown-item">내가 쓴 글</a>
						<a href="${myReviewUrl }" class="dropdown-item">내가 쓴 후기</a>
						<a href="${payUrl }" class="dropdown-item">구매 내역</a>
						<a href="${faqUrl }" class="dropdown-item">상담 내역</a>
						<a href="${talentPayUrl }" class="dropdown-item">재능 구매 내역</a>
						<%--구매내역 상담내역 재능구매내역 추가.  --%>
						
					</div>
				</li>
			</sec:authorize>

			<sec:authorize access="not isAuthenticated()">
				<li class="nav-item">
					<a class="btn btn-primary rounded-0 py-4 px-lg-5 d-none d-lg-block" href="${loginUrl }">로그인<i class="fa fa-arrow-right ms-3"></i></a>
				</li>
			</sec:authorize>

			<div class="d-none">
				<form action="${logoutUrl }" id="logoutForm1" method="post"></form>
			</div>
			
			<sec:authorize access="isAuthenticated()">
				<li class="nav-item">
					<button class="btn btn-primary rounded-0 py-4 px-lg-5 d-none d-lg-block" type="submit"
						form="logoutForm1">로그아웃 <i class="fa-solid fa-arrow-right-to-bracket"></i></button>
				</li>
			</sec:authorize>
			
		</div>
	</div>
</nav>
