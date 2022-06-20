<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ attribute name="current" %>

<c:url value="/board/list" var="listUrl"></c:url>
<c:url value="/member/temp-mainPage" var="mainPageUrl"></c:url>
<c:url value="/member/signup" var="signupUrl" ></c:url>
<c:url value="/member/list" var="memberListUrl"></c:url>
<c:url value="/member/info" var="memberInfoUrl"></c:url>
<c:url value="/member/login" var="loginUrl"></c:url>
<c:url value="/logout" var="logoutUrl"></c:url>
<c:url value="/member/initpw" var="initPasswordUrl"></c:url>

<%-- 회원정보링크 --%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
	<c:url value="/member/info" var="memberInfoUrl">
		<c:param name="memberId" value="${principal.username }" />
	</c:url>
</sec:authorize>

<style>
#aside{
	background-color: #ffca28;
	float: left;
	width: 280px%;
	padding: 75px 0 32px;
	box-sizing: border-box;
}

#aside{
	display: none;
	position: sticky;
	position: -webit-sticky;
	top: -30px;
}

.sidebarToggle{
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
</style>

<script>
	$(document).ready(function() {
		$("#sidebarToggle").click(function() {
			if($("#aside").css("display") == "none") {
				$("#aside").fadeIn(500);
			} else {
				$("#aside").hide();
			}
		});
	});
</script>

<aside id="aside" class="sidebar">
  	<div class="sidebar1">
  		<!-- 홈화면 -->
  		<div class="home">
  			<ul>
	  			<li>
		          <a class="nav-link ${current == 'temp-mainPage' ? 'active' : '' }" href="${mainPageUrl }">홈</a>
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
	        		<a href="${memberInfoUrl }" class="nav-link ${current == 'memberInfo' ? 'active' : '' }">마이페이지</a>
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

<nav class="navbar navbar-expand-lg navbar-light bg-light mb-3">
  <div class="container">
    <button id="sidebarToggle" class="btn btn-warning"><i class="fa-solid fa-bars"></i></button>
    <a class="navbar-brand" href="${mainPageUrl }"><i class="fa-solid fa-house"></i></a>
    
    <!-- button.navbar-toggler>span.navbar-toggler-icon -->
    <button class="navbar-toggler" 
            data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent">
    	<span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
      
      <!-- 
        <li class="nav-item">
          <a class="nav-link ${current == 'list' ? 'active' : '' }" href="${listUrl }">목록보기</a>
        </li>
       -->
       
        <sec:authorize access="isAuthenticated()">
	        <li class="nav-item">
	          <a class="nav-link ${current == 'temp-mainPage' ? 'active' : '' }" href="${mainPageUrl }">홈페이지</a>
	        </li>
        </sec:authorize>
        
        <!-- li.nav-item>a.nav-link{회원가입} -->
        <sec:authorize access="not isAuthenticated()">
	        <li class="nav-item">
	        	<a href="${signupUrl }" class="nav-link ${current == 'signup' ? 'active' : '' }">회원가입</a>
	        </li>
        </sec:authorize>
        
        <sec:authorize access="isAuthenticated()">
        	<li class="nav-item">
        		<a href="${memberInfoUrl }" class="nav-link ${current == 'memberInfo' ? 'active' : '' }">마이페이지</a>
        	</li>
        </sec:authorize>
        
        <sec:authorize access="hasRole('ADMIN')">
	        <li class="nav-item">
	        	<a href="${memberListUrl }" class="nav-link ${current == 'memberList' ? 'active' : '' }">회원목록</a>
	        </li>
	        <div class="nav-item">
	        	<a href="${initPasswordUrl }" class="nav-link">암호초기화</a>
	        </div>
        </sec:authorize>
        
        <!-- li.nav-item>a.nav-link{로그인} -->
        
        <sec:authorize access="not isAuthenticated()">
	        <li class="nav-item">
	        	<a href="${loginUrl }" class="nav-link">로그인</a>
	        </li>
        </sec:authorize>
        
        <sec:authorize access="isAuthenticated()">
	        <li class="nav-item">
	        	<button class="btn btn-link nav-link" type="submit" form="logoutForm1">로그아웃</button>
	        </li>
        </sec:authorize>
      </ul>
      
      <div class="d-none">
      	<form action="${logoutUrl }" id="logoutForm1" method="post"></form>
      </div>
      
      <!-- form.d-flex>input.form-control.me-2[type=search]+button.btn.btn-outline-success -->
      
      <form action="${listUrl }" class="d-flex">
      	<div class="input-group">
	      	<!-- select.form-select>option*3 -->
	      	<select name="type" id="" class="form-select" style="flex:0 0 100px;">
	      		<option value="all" ${param.type != 'title' && param.type != 'body' ? 'selected' : '' }>전체</option>
	      		<option value="title" ${param.type == 'title' ? 'selected' : '' }>제목</option>
	      		<option value="body" ${param.type == 'body' ? 'selected' : ''}>본문</option>
	      	</select>
	      
	      	<input type="search" class="form-control" name="keyword"/>
	      	<button class="btn btn-outline-success"><i class="fa-solid fa-magnifying-glass"></i></button>
      	</div>
      </form>
    </div>
  </div>
</nav>











