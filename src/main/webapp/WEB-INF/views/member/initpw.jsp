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

<title>비밀번호 찾기 : 꿀비</title>
</head>
<body>
	<!-- 임시 navbar -->
	<my:navBar current="memberList"></my:navBar>
	
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-lg-6">
				 <h3>비밀번호 찾기</h3>
				 <h4>비밀번호를 찾고자하는 아이디를 입력해주세요.</h4>
				<form method="post">
					<label for="idInput1" class="form-label"> 아이디 </label>

					<input id="idInput1" class="form-control" type="text" name="memberId" placeholder="꿀비 아이디"/>

					<div class="form-text mb-3">※비밀번호는 아이디로 초기화 됩니다.※</div>

					<input class="btn btn-primary" type="submit" value="다음" />
				</form>
			</div>
		</div>
	</div>

</body>
</html>