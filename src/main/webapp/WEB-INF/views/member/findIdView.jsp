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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
	
<script type="text/javascript">
	var msg = "${msg}";
	if (msg != "") {
		alert(msg);
	}
</script>

<style>
body{
    background:#f3c538;
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
.checkId-button-wrap button{
	width:414px;
	height: 48px;
	font-size: 18px;
	background: #fbc02d;
	border: #fbc02d;
	align-items: center;
}
.shift-a-wrap a{
	width:414px;
	height: 48px;
	font-size: 18px;
	background: #fbc02d;
	border: #fbc02d;
	align-items: center;
}
</style>

<title>아이디 찾기</title>
</head>
<body>
	<my:mainNavBar current="findIdView"></my:mainNavBar>
	
	<div class="main-container">
		<div class="main-wrap">
			<div class="col-md-12 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="text-center">
							<h1 class="h4 text-gray-900 mb-2">아이디 찾기</h1>
							<c:if test="${empty message }">
								<p class="mb-4">이름과 이메일을 입력해주세요.</p>
							</c:if>
						</div>
						
						<c:if test="${empty message }">
							<form class="user" action="findId" method="POST">
								<div class="form-group">
									<input type="text" class="form-control form-control-user"
										id="name" aria-describedby="nameHelp" name="name"
										placeholder="이름을 입력해주세요." />
									<input type="email" class="form-control form-control-user"
										id="email" aria-describedby="emailHelp" name="email"
										placeholder="이메일을 입력해주세요." />
								</div>
								<br />
								<div class="checkId-button-wrap">
									<button class="btn btn-secondary btn-user btn-block"
										type="submit" >아이디 확인</button>
								</div>
							</form>
						</c:if>
						
						<c:if test="${not empty message }">
							<h2 class="text-center">${message }</h2>
						</c:if>

						<hr />

						<c:if test="${not empty message }">
							<div class="shift-a-wrap">
								<a class="btn btn-secondary" href="findIdView"> 다시 시도하기 </a>
							</div>
						</c:if>
						
						<br />
						
						<div class="shift-a-wrap">
							<a class="btn btn-secondary" href="initpw"> 비밀번호 찾기 </a>
						</div>

						<br />

						<div class="shift-a-wrap">
							<a class="btn btn-secondary" href="login"> 로그인하러 가기 </a>
						</div>

						<br />

						<div class="shift-a-wrap">
							<a class="btn btn-secondary" href="index" class="small">메인페이지로 이동</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>