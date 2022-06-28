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
	border-width: 40%;
	padding: 80px;
}
.form-items{
	text-align: center;
}
.inputBoxes{
	position: relative;
	left: 190px;
	font-family: sans-serif;
	color: #000000;
}
</style>

<title>이메일로 인증 : 꿀비</title>

<script>
	$(document).ready(function() {
		let otpOk = false;
		// otp 체크
		$("#checkOtpButton").click(function(e) {
			e.preventDefault();
			const otp1 = $("#otp").val();
			const otp2 = $("#otp_value").val();

			otpOk = false;
			if(otp1 == otp2) {
				$("#otpMessage").text("인증번호가 일치합니다.");
			} else {
				$("#otpMessage").text("인증번호가 일치하지 않습니다. 다시 시도해주세요.");
			}
		});

		// 새 비밀번호 체크
		$("#pwInput, #pwInputCheck").keyup(function() {
			const pw1 = $("#pwInput").val();
			const pw2 = $("#pwInputCheck").val();

			pwOk = false;
			if (pw1 == pw2) {
				$("#pwMessage").text("비밀번호가 일치합니다.");
			} else {
				$("#pwMessage").text("비밀번호가 일치하지 않습니다.");
			}
		});
	});
</script>

</head>
<body>
	<my:navBar current="changePw"></my:navBar>
	
	<div class="main-container">
		<div class="main-wrap">
			<div class="form-holder">
				<div class="form-content">
					<div class="form-items">
						<form method="post">
							<div class="inputBoxes">
								<input type="hidden" name="memberId" value="${memberId }" />
								<!-- OTP 확인 -->
								<div class="col-md-8">
									인증번호
									<input type="hidden" id="otp_value" value="${OTP }" />
									<br />
									<input type="text" id="otp" name="otpValue" />
									<br />
									<button type="button" id="checkOtpButton"
										class="btn btn-block otpCheck">인증번호 확인</button>
								</div>
	
								<!-- 새 비밀번호 -->
								<div class="gap-3 col-md-8">
									새 비밀번호
									<br />
									<input type="password" name="newPw" id="pwInput" />
									<br />
									새 비밀번호 확인
									<br />
									<input type="password" name="newPwConfirm" id="pwInputCheck" />
									<br />
								</div>
							</div>
							
							<div class="form-text-otp" id="otpMessage"></div>
							<div class="form-text-pw" id="pwMessage"></div>
							
								<div class="d-grid gap-2 col-3 mx-auto">
									<button type="submit" id="changePwButton" class="btn btn-secondary confirm" >확인</button>
									<div class="form-text" id="confirmMessage"></div>
									<button id="cancelButton" class="btn btn-secondary cancel" >취소</button>
								</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>