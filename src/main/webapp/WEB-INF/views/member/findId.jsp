<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>

<title>아이디 찾기</title>
</head>
<body>
	<div class="card o-hidden border-0 shadow-lg my-5">
		<div class="jumbotron">
			<h2>아이디는 : </h2> <br />
			<ul>
				<c:forEach items="${memberId }" var="memberId">
					<li>${memberId }</li> <br />
				</c:forEach>
			</ul>
			<h2>입니다.</h2>
			<button type="button" class="btn btn-primary" onclick="location.href='/member/login'">로그인하기</button>
			<button type="button" class="btn btn-primary" onclick="location.href='/main'">메인페이지로</button>
		</div>
	</div>
</body>
</html>