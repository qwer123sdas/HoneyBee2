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
<title>로그인 화면</title>
</head>
<body>
	<!-- 임시 navBar -->
	<my:navBar current="login"></my:navBar>

	<div class="container">
		<div class="row justtify-content-center">
			<div class="col-8 col-lg-4">
				<!-- 로고 넣을 자리 (HoneyBee) -->
				<form action="${appRoot }/login" method="post"
					class="justify-content center">
					<div class="form-floating">
						<input type="text" class="form-control" name="username"
							placeholder="아이디" id="floatingInput" />
						<label for="floatingInput">아이디</label>
					</div>

					<div class="form-floating">
						<input type="password" class="form-control" name="password"
							placeholder="비밀번호" id="floatingPassword" />
						<label for="floatingPassword">비밀번호</label>
					</div>

					<div class="checkbox mb-3">
						<label>
							<input type="checkBox" name="remember-me" id="" />
							자동 로그인
						</label>
					</div>
					
					<button>아이디 찾기</button>
					<button>비밀번호 찾기</button>
					
					<br />

					<button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
					<a href="${appRoot }/member/signup">회원 가입</a>

					<p class="mt-5 mb-3 text-muted">&copy; 2021-2022</p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>