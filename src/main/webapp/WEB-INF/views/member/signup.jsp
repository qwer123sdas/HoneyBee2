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

<title>회원 가입 화면</title>
</head>
<body>

<!-- navBar 넣어야할 곳 -->

<div class="container">
	<div class="row justify-content-center">
		<div class="col-12 col-lg-6">
			<form action="${appRoot }/member/signup" method="post">
				아이디 <input type="text" name="memberId" /> <br />
				패스워드 <input type="password" name="pw" /> <br />
				이름 <input type="text" name="name" /> <br />
				이메일 <input type="email" name="email" /> <br />
				닉네임 <input type="text" name="nickname" /> <br />
				우편번호 <input type="text" name="postcode" />
				주소 <input type="text" name="address" /> <br />
				상세주소 <input type="text" name="detail" /> <br />
				생년월일 <input type="date" name="birth" /> <br />
				전화 <input type="text" name="phone" /> <br />
				<button>회원가입</button>
			</form>
		</div>
	</div>
</div>
</body>
</html>