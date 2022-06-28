<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>

<style>

*, body {
    font-family:"Roboto", sans-serif;
    font-weight: 400;
    -webkit-font-smoothing: antialiased;
    text-rendering: optimizeLegibility;
    -moz-osx-font-smoothing: grayscale;
}

html, body {
    height: 100%;
	background: url("https://images.pexels.com/photos/164470/pexels-photo-164470.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	overflow: hidden;
}


.form-holder {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      text-align: center;
      min-height: 100vh;
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
    padding: 40px;
}

.form-content .form-items {
	background-color: #fff;
    border: 3px solid #fbc02d;
    padding: 40px;
    display: inline-block;
    width: 100%;
    min-width: 540px;
    -webkit-border-radius: 10px;
    -moz-border-radius: 10px;
    border-radius: 10px;
    -webkit-transition: all 0.4s ease;
    transition: all 0.4s ease;
}

.form-content h1 {
    color: #333333;
    text-align: left;
	font-family:"Roboto", sans-serif;
	font-weight: 700;
    font-size: 50px;
    font-weight: 300;
    line-height: 20px;
    margin-bottom: 30px;
}

.form-content label, .was-validated .form-check-input:invalid~.form-check-label, .was-validated .form-check-input:valid~.form-check-label{
    color: #fff;
	text-align: center;
}

.form-content input[type=text], .form-content input[type=password], .form-content input[type=email], .form-content select {
    width: 100%;
    padding: 9px 20px;
    border: 1px solid #f9c22d;
    outline: 0;
    border-radius: 6px;
    background-color: #fff;
    font-size: 15px;
    font-weight: 300;
    color: #000000;
    -webkit-transition: all 0.3s ease;
    transition: all 0.3s ease;
    margin-top: 16px;
}

.form-content button{
	color: #333333;
	width: 300px;
	display:flex;
	margin: 0 auto;
}

</style>

<title>회원 가입 화면</title>

<script>
	$(document).ready(function() {
		// 중복, 비밀번호 확인 변수
		let memberIdOk = false;
		let pwOk = false;
		let emailOk = false;
		let nickNameOk = false;
		
		// 아이디 체크 버튼
		$("#checkIdButton").click(function(e) {
			e.preventDefault();
			const data = {
					memberId : $("#form1").find("[name=memberId]").val()
			};
			$("#checkIdButton").attr("disabled", "");
			memberIdOk = false;
			$.ajax({
				url : "${appRoot}/member/memberId/check",
				type : "post",
				data : data,
				success : function(data) {
					switch(data) {
					case "good" :
						$("#memberIdMessage").text("사용 가능한 아이디 입니다.");
						memberIdOk = true;
						break;
					case "bad" :
						$("#memberIdMessage").text("이미 있거나 사용이 불가능한 아이디 입니다.");
						break;
					}
				},
				error : function() {
					$("#memberIdMessage").text("중복 확인 중 오류 발생");
				},
				complete : function() {
					$("#checkIdButton").removeAttr("disabled");
					enableSubmit();
				}
			});
		});
		
		// 이메일 체크 버튼
		$("#checkEmailButton").click(function(e) {
			e.preventDefault();
			const data = {
					email : $("#form1").find("[name=email]").val()
			};
			$("#checkEmailButton").attr("disabled", "");
			emailOk = false;
			$.ajax({
				url : "${appRoot}/member/email/check",
				type : "post",
				data : data,
				success : function(data) {
					switch(data) {
					case "good" :
						$("#memberEmailMessage").text("사용 가능한 이메일 입니다.");
						emailOk = true;
						break;
					case "bad" :
						$("#memberEmailMessage").text("이미 있거나 사용이 불가능한 이메일 입니다.");
						break;
					}
				},
				error : function() {
					$("#memberEmailMessage").text("중복 확인 중 오류 발생");
				},
				complete : function() {
					$("#checkEmailButton").removeAttr("disabled");
					enableSubmit();
				}
			});
		});
		
		// 닉네임 체크 버튼
		$("#checkNickNameButton").click(function(e) {
			e.preventDefault();
			const data = {
					nickname : $("#form1").find("[name=nickname]").val()
			};
			$("#checkNickNameButton").attr("disabled", "");
			nickNameOk = false;
			$.ajax({
				url : "${appRoot}/member/nickname/check",
				type : "post",
				data : data,
				success : function(data) {
					switch(data) {
					case "good" :
						$("#memberNickNameMessage").text("사용 가능한 닉네임 입니다.");
						nickNameOk = true;
						break;
					case "bad" :
						$("#memberNickNameMessage").text("이미 있거나 사용이 불가능한 닉네임 입니다.");
						break;
					}
				},
				error : function() {
					$("#memberNickNameMessage").text("중복 확인 중 오류 발생");
				},
				complete : function() {
					$("#checkNickNameButton").removeAttr("disabled");
					enableSubmit();
				}
			});
		});
		
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
		
		// 회원가입 버튼 활성화/비활성화
		const enableSubmit = function() {
			if(memberIdOk && pwOk && emailOk && nickNameOk) {
				$("#submitButton1").removeAttr("disabled");
			} else {
				$("#submitButton1").attr("disabled", "");
			}
		}
	});
</script>

</head>
<body>

<!-- 임시 navBar -->
<my:navBar current="signup"></my:navBar>

<div class="form-body">
	<div class="row">
		<div class="form-holder">
			<div class="form-content">
				<div class="form-items">
					<form id="form1" action="${appRoot }/member/signup" method="post" class="requires-validation" novalidate>
						<h1>꿀비 회원 가입</h1>
						
						<div class="col-md-12">
							<!-- 아이디 -->
							<input type="text" name="memberId" placeholder="아이디"/>
							<div class="buttonGroup">
								<button id="checkIdButton" type="button" class="btn btn-secondary doubleCheck">중복 확인</button>
							</div>
						</div>
						<div class="form-text" id="memberIdMessage"></div>
						<br />
						
						<div class="col-md-12">
							<!-- 비밀번호 -->
							<input id="pwInput1" type="password" name="pw" placeholder="비밀번호"/>
						</div>
						<br />
						
						<div class="col-md-12">
							<!-- 비밀번호 확인 -->
							<input id="pwInput2" type="password" name="pwConfirm" placeholder="비밀번호 확인"/>
						</div>
						<div class="form-text" id="pwMessage"></div>
						<br />
						
						<div class="col-md-12">
							<!-- 이름 -->
							<input type="text" name="name" placeholder="이름" /> 
						</div>
						<br />
						
						<div class="col-md-12">
							<!-- 이메일 -->
							<input type="email" name="email" placeholder="이메일" /> 
							<div class="buttonGroup">
								<button id="checkEmailButton" type="button" class="btn btn-secondary doubleCheck">중복 확인</button>
							</div>
						</div>
						<div class="form-text" id="memberEmailMessage"></div>
						<div class="col-md-12">
							<!-- 닉네임 -->
							<input type="text" name="nickname" placeholder="닉네임" />
							<div class="buttonGroup">
								<button id="checkNickNameButton" type="button" class="btn btn-secondary doubleCheck">중복 확인</button>
							</div>
						</div>
						<div class="form-text" id="memberNickNameMessage"></div>
						<div class="col-md-12">
							<!-- 우편번호 -->
							<input type="text" name="postcode" placeholder="우편번호" />
						</div>
						<div class="col-md-12">
							<!-- 주소 -->
							<input type="text" name="address" placeholder="주소" />
						</div>
						<div class="col-md-12">
							<!-- 상세주소 -->
							<input type="text" name="detail" placeholder="상세주소" />
						</div>
						<br />
						<div class="col-md-12">
							<!-- 생년월일 -->
							<input type="date" name="birth" placeholder="생년월일" />
						</div>
						<br />
						
						<div class="col-md-12">
							<!-- 전화 -->
							<input type="text" name="phone" placeholder="전화" />
						</div>
						<br />
						
						<div class="buttonGroup">
							<button id="submitButton1" class="btn btn-warning create-account" disabled>회원가입</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>


















