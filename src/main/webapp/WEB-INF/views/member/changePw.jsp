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

<style>
.form-holder {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	text-align: center;
	min-height: 80vh;
}

.form-holder .form-content {
	position: relative;
	text-align: center;
	display: -webkit-box;
	display: -moz-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-align-items: center;
	align-items: center;
	padding: 60px;
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
		
		// 확인버튼
		$("#changePwButton").click(function() {
			$("#confirmMessage").text("비밀번호가 변경되었습니다.");
		});
	});
</script>

</head>
<body>

	<div class="container">
		<div class="row">
			<div class="form-holder">
				<div class="form-content">
					<div class="form-items">
						<form method="post">
							<input type="hidden" name="memberId" value="${memberId }" />
							<br />
							<!-- OTP 확인 -->
							<div class="col-md-8">
								인증번호
								<input type="hidden" id="otp_value" value="${OTP }" />
								<br />
								<input type="text" id="otp" name="otpValue" />
								<button type="button" id="checkOtpButton"
									class="btn btn-block otpCheck">인증번호 확인</button>
							</div>
							<div class="form-text" id="otpMessage"></div>
							<hr />

							<!-- 새 비밀번호 -->
							<div class="col-md-8">
								새 비밀번호
								<br />
								<input type="password" name="newPw" id="pwInput" />
								<br />
								새 비밀번호 확인
								<br />
								<input type="password" name="newPwConfirm" id="pwInputCheck" />
								<br />
							</div>

							<div class="form-text" id="pwMessage"></div>

								<button type="submit" id="changePwButton" class="btn btn-block confirm" >확인</button>
								<div class="form-text" id="confirmMessage"></div>
								<button id="cancelButton" class="btn btn-block cancel" >취소</button>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>