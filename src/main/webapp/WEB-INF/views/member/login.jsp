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
<link rel="stylesheet" href="${appRoot}/resources/webContents/img" />
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

<title>꿀비 로그인</title>

<style>
	img{
		width: 480px;
		height: 180px;
	}
	.main-container{
		width:100%;
		display:flex;
		flex-direction:column;
		align-items: center;
		margin-top: 150px;
	}
	
	.main-container .main-wrap{
		border: 3px solid #f9bf2d;
		padding: 40px;
		display: inline-block;
		width: 500px;
		min-width: 400px;
		-webkit-border-radius: 10px;
		-moz-border-radius: 10px;
    	border-radius: 10px;
    	-webkit-transition: all 0.4s ease;
    	transition: all 0.4s ease;
	}
	
	.main-container .main-wrap header .logo-wrap {
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	
	.login-input-section-wrap{
		padding-top: 60px;
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	.password-wrap{
		margin-top: 13px;
	}
	.login-input-wrap{
		border: none;
		width: 450px;
		margin-top: 10px;
		font-family: "Apple SD Gothic Neo", "Malgun Gothic", sans-serif;
		margin-left: 10px;
		height: 30px;
	}
	.login-button-wrap{
		padding-top: 13px;
	}
	.login-button-wrap button{
		width:465px;
		height: 48px;
		font-size: 18px;
		background: #fbc02d;
		border: #fbc02d;
		align-items: center;
	}
	section .find-idpw-wrap-button{
		margin: auto;
		font-size: 18px;
		text-align:center;
		display: felx;
	}
	section .find-idpw-wrap{
		margin: auto;
		color: #fbc02d;
		font-size: 14px;
		padding-top: 10px;
	}
	section .find-idpw-wrap span{
		margin: auto;
		font-size: 13px;
		line-height: 15px;
	}
	footer{
		padding-top: 95px;
		padding-bottom: 15px;
		display:flex;
		flex-direction:column;
		width:768px;
	}
	footer .copyright-wrap{
		align-items: center;
	}
}
	
</style>
<c:if test="${not empty message }">
<script>
	$(document).ready(function() {
		alert('${message}');
	});
</script>
</c:if>

</head>
<body>
	<!-- 임시 navBar -->
	<my:mainNavBar current="login"></my:mainNavBar>

	<div class="main-container">
		<div class="main-wrap">
			<header>
				<div class="logo-wrap">
					<!-- 로고 -->
					<img src="${appRoot }/resources/webContents/img/honeybee1.jpg" alt="" />
				</div>
			</header>
			
			<section class="login-input-section-wrap">
				<form action="${appRoot }/login" method="post">
				
					<!-- 아이디 -->
					<div class="login-input-wrap">
						<input type="text" class="form-control" name="username"
							placeholder="아이디" id="floatingInput" />
					</div>
					
					<!-- 비밀번호 -->
					<div class="login-input-wrap password-wrap">
						<input type="password" class="form-control" name="password"
							placeholder="비밀번호" id="floatingPassword" />
					</div>
					
					<!-- 로그인 -->
					<div class="login-button-wrap">
						<button class="btn btn-secondary" type="submit">로그인</button>
					</div>

					<!-- 자동 로그인 -->
					<div class="checkbox mb-3">
						<label>
							<input type="checkBox" name="remember-me" id="" />
							자동 로그인
						</label>
					</div>
					
				</form>
			</section>
			
			<section class="find-idpw-wrap">
				<!-- 아이디 찾기 -->
				<div class="find-idpw-wrap-button">
					<button type="button" class="btn btn-secondary"
						onclick="location.href='${appRoot}/member/findIdView'">아이디 찾기</button>
					<!-- 비밀번호 찾기 -->
					<button type="button" class="btn btn-secondary"
						onclick="location.href='${appRoot}/member/initpw'">비밀번호 찾기</button>
					<!-- 회원가입 -->
					<button type="button" class="btn btn-secondary"
						onclick="location.href='${appRoot }/member/signup'">회원 가입</button>
					<!-- 
					 <a href="${appRoot }/member/signup">회원 가입</a>
					 -->
				</div>
			</section>
			
			
			<footer>
				<div class="copyright-wrap">
					<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					Copyright &copy; 2022 Honeybee</span>
				</div>
			</footer>
		</div>
	</div>
</body>
</html>