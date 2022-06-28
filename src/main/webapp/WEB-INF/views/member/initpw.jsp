<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
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

<style>
.main-container{
	border: 5px;
	padding: 80px;
}
header{
	font-family: sans-serif;
	text-align: center;
}
article{
	border: 3px;
	padding: 30px;
	text-align: center;
}
article .inputIdForm{
	display: inline-block;
	text-align: center;
}

article .inputId{
	text-align: center;
}
</style>

<title>비밀번호 찾기 : 꿀비</title>
</head>
<body>
	<my:navBar current="initpw"></my:navBar>
	
	<div class="main-container">
		<div class="main-wrap">
			<div class="col-12">
				<header>
					 <h1>잊어버린
					 <br />
					 비밀번호 재설정 해드릴게요!
					 </h1>
					 <h4>비밀번호를 찾고자하는 아이디를 입력해주세요.</h4>
				</header>
				
				<article>
					<div class="inputIdForm">
						<form method="post">
							<div class="inputId"><input id="idInput1" class="form-control" type="text" name="memberId" placeholder="꿀비 아이디"/></div>
							<br />
							<input class="btn btn-outline-warning" type="submit" value="다음" />
						</form>
					</div>
				</article>
			</div>
		</div>
	</div>

</body>
</html>