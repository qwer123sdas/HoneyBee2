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

<title>마이페이지 비밀번호 변경</title>

<script>
	// 패스워드 오타 체크
	$("#pwInput1, #pwInput2").keyup(function() {
		const pw1 = $("#pwInput1").val();
		const pw2 = $("#pwInput2").val();
		
		pwOk = false;
		if(pw1 == pw2) {
			$("#pwMessage").text("패스워드가 일치합니다.");
			pwOk = true;
		} else {
			$("#pwMessage").text("패스워드가 일치하지 않습니다.");
		}
		enableSubmit();
	});
</script>

</head>
<body>
	<div class="container">
		<div class="row justtify-content-center">
			<div class="col-12 col-lg-6">
				<h1>비밀번호 변경</h1>
				<form method="post">
					<label for="pwInput1" class="form-label">
						비밀번호를 변경해주세요.
					</label>
					
					<div class="col-md-12">
						<input type="password" id="pwInput1" class="form-control" name="pw" placeholder="현재 비밀번호" />
					</div>
					
					<div class="col-md-12">
						<input type="password" id="pwInput1" class="form-control" name="newPw" placeholder="새 비밀번호" />
					</div>
					
					<div class="col-md-12">
						<input type="password" id="pwInput2" class="form-control" name="newPwConfirm" placeholder="새 비밀번호 확인" />
					</div>
					
					<div class="form-text" id="pwMessage"></div>
					
					<div class="form-button mt-3">
						<button id="submitButton" class="btn btn-block">비밀번호 변경</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>