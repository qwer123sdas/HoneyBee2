<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
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

<style>
*, body{
	font-family: "Apple SD Gothic Neo", "Malgun Gothic", sans-serif;
	font-weight: 400;
}
html, body{
	height: 1700px;
	background: url("https://cdn.pixabay.com/photo/2022/03/24/16/39/background-7089456_960_720.png");
	background-repeat: no-repeat;
	background-size: cover;
}
.container{
	margin: 10px;
	border: 10px;
	padding: 10px;
}

.title h1{
	text-align: center;
	font-family: "Apple SD Gothic Neo", "Malgun Gothic", sans-serif;
	font-weight: 500;
	color: #fff !important;
}
#profile{
	width: 500px;
	margin: 3px;
	border: 3px solid #fbc02d;
	border-radius: 25px;
	-webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 40px;
	display: inline-block;
	color: #333333;
}

#profile .checkButton{
	background-color: rgba(0,0,0,0);
}
form input #profileFile:file-selector-button{
	display: none;
}
</style>

<title>마이페이지</title>

<script>
	// 이메일 수정
	$(document).ready(function() {
		// 비밀번호 & 비밀번호 확인 일치여부
		let pwCheck = true;
		// 이메일 중복 확인 여부
		let emailCheck = true;
		// 닉네임 중복 확인 여부
		let nickNameCheck = true;

		// 기존 이메일
		const oldEmail = $("#emailInput1").val();
		// 기존 닉네임
		const oldNickName = $("#nickNameInput1").val();

		// 수정 버튼 활성화 함수
		const enableModifyButton = function() {
			if (pwCheck && emailCheck && nickNameCheck) {
				$("#modifySubmitButton1").removeAttr("disabled", "");
			} else {
				$("#modifySubmitButton1").attr("disabled", "");
			}
		}

		// 이메일 input 요소에 text 변경시 이메일 수정 버튼 활성화
		$("#emailInput1").keyup(function() {
			const newEmail = $("#emailInput1").val();

			if (oldEmail === newEmail) {
				$("#emailCheckButton1").attr("disabled", "");
				$("#emailMessage1").text("");
				emailCheck = true;
			} else {
				$("#emailCheckButton1").removeAttr("disabled");
				emailCheck = false;
			}
			enableModifyButton();
		});
		// 닉네임 input 요소에 text 변경시 닉네임 수정 버튼 활성화
		$("#nickNameInput1").keyup(function() {
			const newNickName = $("#nickNameInput1").val();

			if (oldNickName === newNickName) {
				$("#nickNameCheckButton1").attr("disabled", "");
				$("#nickNameMessage1").text("");
				nickNameCheck = true;

			} else {
				$("#nickNameCheckButton1").removeAttr("disabled");
				nickNameCheck = false;
			}
			enableModifyButton();
		});

		// 이메일 수정 버튼 클릭시 ajax 요청
		$("#emailCheckButton1").click(function(e) {
			e.preventDefault();

			const data = {
				email : $("#emailInput1").val()
			};

			emailCheck = false;
			$.ajax({
				url : "${appRoot}/member/email/check",
				type : "post",
				data : data,
				success : function(data) {
					switch (data) {
					case "good":
						$("#emailMessage1").text("변경이 가능한 이메일입니다.");
						emailCheck = true;
						break;
					case "bad":
						$("#emailMessage1").text("변경이 불가능한 이메일입니다.");
						break;
					}
				},
				error : function() {
					$("#emailMessage1").text("이메일 중복 확인 중 오류 발생");
				},
				complete : function() {
					enableModifyButton();
				}
			});
		});
		// 닉네임 수정 버튼 클릭시 ajax 요청
		$("#nickNameCheckButton1").click(function(e) {
			e.preventDefault();

			const data = {
				nickname : $("#nickNameInput1").val()
			};

			nickNameCheck = false;
			$.ajax({
				url : "${appRoot}/member/nickname/check",
				type : "post",
				data : data,
				success : function(data) {
					switch (data) {
					case "good":
						$("#nickNameMessage1").text("변경이 가능한 닉네임입니다.");
						nickNameCheck = true;
						break;
					case "bad":
						$("#nickNameMessage1").text("변경이 불가능한 닉네임입니다.");
						break;
					}
				},
				error : function() {
					$("#nickNameMessage1").text("닉네임 중복 확인 중 오류 발생");
				},
				complete : function() {
					enableModifyButton();
				}
			});
		});
	});
</script>

</head>
<body>
	<!-- 임시 navBar -->
	<my:mainNavBar current="info"></my:mainNavBar>
	
	<div class="container">
		<div class="row">
			<div class="d-flex flex-row justify-content-center">
				<form id="form1" action="${appRoot }/member/modify" method="post" enctype="multipart/form-data">
					<div class="title"><h1>회원 정보 변경</h1></div>

					<div><p>${message }</p></div>
					
					<div class="col-md-3 border-center" id="profile">
						<div class="d-flex flex-column align-items-center text-left p-3 py-5">
							<input type="hidden" name="memberId" value="${memberInfo.memberId }" readonly />
							<label class="labels">프로필 사진</label>
							<div>
								<img class="rounded-circle mt-5" id="target_img"
									src="${imageUrl }/member/${memberInfo.memberId }/${memberInfo.profile }"
									onerror="this.src='${appRoot }/resources/webContents/img/user.png';"
									width="80px" height="80px" />
							</div>
								<input type="file" name="profileFile" id="profileFile" value="${memberInfo.profile }" accept="image/*" />
							<br />
					
							<div class="col-md-12">
								<label class="labels">이름</label> <br />
								<input class="form-control" type="text" name="name" value="${memberInfo.name }" readonly />
							</div>
							<br />
							<div class="col-md-12">
								<label class="labels">이메일</label> <br />
								<input class="form-control" id="emailInput1" type="email" name="email" value="${memberInfo.email }" />
								<div class="checkButton"><button class="btn btn-link" id="emailCheckButton1" disabled>이메일 수정</button></div>
							</div>
							<p id="emailMessage1"></p>
							<br />
						
							<div class="col-md-12">
								<label class="labels">닉네임</label> <br />
								<input class="form-control" id="nickNameInput1" type="text" name="nickname" value="${memberInfo.nickname }" />
								<div class="checkButton"><button class="btn btn-link" id="nickNameCheckButton1" disabled>닉네임 수정</button></div>
							</div>
							<p id="nickNameMessage1"></p>
							<br />
	
							<!-- 우편번호 주소 상세주소 전화 수정 누르면 변경할 수 있도록 만들기 -->
							<div class="col-md-12">
								<label class="labels">우편번호</label> <br />
								<input class="form-control" type="text" name="postcode" value="${memberInfo.postcode }" />
							</div>
							<br />
							
							<div class="col-md-12">
								<label class="labels">주소</label> <br />
								<input class="form-control" type="text" name="address" value="${memberInfo.address }" />
							</div>
							<br />
							
							<div class="col-md-12">
								<label class="labels">상세주소</label> <br />
								<input class="form-control" type="text" name="detail" value="${memberInfo.detail }" />
							</div>
							<br />
						
							<div class="col-md-12">
								<label class="labels">전화</label> <br />
								<input class="form-control" type="text" name="phone" value="${memberInfo.phone }" />
							</div>
							<br />
							
							<div class="d-grid gap-2 col-12">
								<button class="btn btn-secondary btn-lg" type="button" id="modifySubmitButton1"
									data-bs-toggle="modal" data-bs-target="#modalSheet2" disabled>수정</button>
								<button class="btn btn-danger btn-lg" type="button" data-bs-toggle="modal"
									data-bs-target="#modalSheet1">삭제</button>
							</div>
							
							<hr />
							
							<span><a href="updatePw">비밀번호 변경하러 가기</a></span>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- 회원 탈퇴 암호 확인 Modal -->
	<div class="modal fade" id="modalSheet1" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">회원 탈퇴</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="form2" action="${appRoot }/member/remove" method="post">
						<input type="hidden" value="${memberInfo.memberId }"
							name="memberId" />
						비밀번호 :
						<input type="password" name="pw" />
					</form>
				</div>
				<div class="modal-footer">
					<button form="form2" type="submit" class="btn btn-danger">회원
						탈퇴</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 회원 수정 기존 암호 확인 Modal -->
	<div class="modal fade" id="modalSheet2" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel2">정보 수정</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="form3" action="${appRoot }/member/modify" method="post">
						<input type="hidden" value="${memberInfo.memberId }"
							name="memberId" />
						비밀번호 :
						<input type="password" name="pw" />
					</form>
				</div>
				<div class="modal-footer">
					<button id="modifySubmitButton2" form="form1" type="submit"
						class="btn btn-warning">정보 수정</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>


















