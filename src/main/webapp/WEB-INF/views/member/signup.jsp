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
				url : "${appRoot}/member/check",
				type : "get",
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
				url : "${appRoot}/member/check",
				type : "get",
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
				url : "${appRoot}/member/check",
				type : "get",
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

<div class="container">
	<div class="row justify-content-center">
		<div class="col-12 col-lg-6">
			<form id="form1" action="${appRoot }/member/signup" method="post">
				<h1>회원 가입</h1>
				
				아이디 <input type="text" name="memberId" />
				<button id="checkIdButton" type="button">중복 확인</button>
				<p id="memberIdMessage"></p>
				<br />
				
				비밀번호 <input id="pwInput1" type="password" name="pw" /> <br />
				
				비밀번호 확인 <input id="pwInput2" type="password" name="pwConfirm" /> <br />
				<p id="pwMessage"></p>
				
				이름 <input type="text" name="name" /> <br />
				이메일 <input type="email" name="email" /> 
				<button id="checkEmailButton" type="button">중복 확인</button>
				<p id="memberEmailMessage"></p>
				<br />
				
				닉네임 <input type="text" name="nickname" />
				<button id="checkNickNameButton" type="button">중복 확인</button>
				<p id="memberNickNameMessage"></p>
				<br />
				
				우편번호 <input type="text" name="postcode" /> <br />
				주소 <input type="text" name="address" /> <br />
				상세주소 <input type="text" name="detail" /> <br />
				생년월일 <input type="date" name="birth" /> <br />
				전화 <input type="text" name="phone" /> <br />
				<form action="uploadFormAction" method="post" enctype="multipart/form-data">
					<input type="file" name="uploadFile" multiple />
					<button>파일첨부</button>
				</form>
				<button id="submitButton1" disabled>회원가입</button>
			</form>
		</div>
	</div>
</div>
</body>
</html>