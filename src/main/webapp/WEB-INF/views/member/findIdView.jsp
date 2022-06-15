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

<script type="text/javascript">
	var msg = "${msg}";
	if(msg != "") {
		alert(msg);
	}
</script>

<title>아이디 찾기</title>
</head>
<body>
	<div class="text-center">
		<h1 class="h4 text-gray-900 mb-2">아이디 찾기</h1>
		<p class="mb-4">이름과 이메일을 입력해주세요.</p>
	</div>
	<c:if test="${empty message }">
		<form class="user" action="findId" method="POST">
			<div class="form-group">
				<input type="text" class="form-control form-control-suer" 
				id="name" aria-describedby="nameHelp" name="name" placeholder="이름을 입력해주세요." />
				<input type="email" class="form-control form-control-user"
				id="email" aria-describedby="emailHelp" name="email" placeholder="이메일을 입력해주세요." />
			</div>
			<div class="justify-cotent center">
				<button type="submit" class="btn btn-primary btn-user btn-block">
					아이디 확인
				</button>
			</div>
		</form>
	</c:if>
	<c:if test="${not empty message }">
		<h2 class="text-center">회원님의 아이디는 ${message } 입니다.</h2>
	</c:if>
	<hr />
	
	<div class="text-center">
		<a href="findPw">
		비밀번호 찾기
		</a>
	</div>
	
	<hr />
	
	<div class="text-center">
		<a href="login">
		로그인하러 가기
		</a>
	</div>
	
	<hr />
	
	<div class="text-center">
		<a href="temp-mainPage" class="small">메인페이지로 이동</a>
	</div>
</body>
</html>