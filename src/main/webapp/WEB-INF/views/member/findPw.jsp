<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>비밀번호 찾기</title>
</head>
<body>
	<div class="text-center">
		<h1 class="h4 text-gray-900 mb-2">비밀번호 찾기</h1>
		<p class="mb-4">이름과 아이디와 이메일을 입력해주세요.</p>
	</div>
	<c:if test="${empty message }">
	<form class="user" action="findPw" method="POST">
		<div class="form-group">
			<input type="text" class="form-control form-control-suer" id="name"
				aria-describedby="nameHelp" name="name" placeholder="이름을 입력해주세요." />
			<input type="text" class="form-control form-control-suer" id="name"
				aria-describedby="memberIdHelp" name="memberId" placeholder="아이디를 입력해주세요." />
			<input type="email" class="form-control form-control-user" id="email"
				aria-describedby="emailHelp" name="email" placeholder="이메일을 입력해주세요." />
		</div>
		<div class="justify-cotent center">
			<button type="submit" class="btn btn-primary btn-user btn-block">
				이메일로 전송
			</button>
		</div>
	</form>
	</c:if>
	<c:if test="${not empty message }">
		<h2 class="text-center">${message }로 임시 비밀번호를 보냈습니다.</h2>
	</c:if>
</body>
</html>