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
	<my:navBar current="info"></my:navBar>

	<div class="container">
		<div class="row justify-content-center">
		<my:mypage></my:mypage>
			<div class="col-8 mt-5 ms-5">
				<form id="form1" action="${appRoot }/member/modify" method="post"
					enctype="multipart/form-data">
					<h1>회원 정보 변경</h1>

					<div>
						<p>${message }</p>
					</div>

					<input type="hidden" name="memberId"
						value="${memberInfo.memberId }" readonly />

					프로필 사진
					<img
						src="${imageUrl }/member/${memberInfo.memberId }/${memberInfo.profile }"
						alt="" />
					<input type="file" name="profileFile"
						value="${memberInfo.profile }" accept="image/*" />
					<br />

					이름
					<input type="text" name="name" value="${memberInfo.name }" readonly />
					<br />
					<!-- 
					비밀번호 <input id="pwInput1" type="text" value="${memberInfo.pw }" />
					<br />
					비밀번호 확인 <input id="pwInput2" type="text" value="${memberInfo.pw }"/>
					<p id="pwMessage1"></p>
					<br />
					 -->

					이메일
					<input id="emailInput1" type="email" name="email"
						value="${memberInfo.email }" />
					<button id="emailCheckButton1" disabled>이메일 수정</button>
					<p id="emailMessage1"></p>
					<br />

					닉네임
					<input id="nickNameInput1" type="text" name="nickname"
						value="${memberInfo.nickname }" />
					<button id="nickNameCheckButton1" disabled>닉네임 수정</button>
					<p id="nickNameMessage1"></p>
					<br />

					<!-- 우편번호 주소 상세주소 전화 수정 누르면 변경할 수 있도록 만들기 -->
					우편번호
					<input type="text" name="postcode" value="${memberInfo.postcode }" />
					<br />
					주소
					<input type="text" name="address" value="${memberInfo.address }" />
					<br />
					상세주소
					<input type="text" name="detail" value="${memberInfo.detail }" />
					<br />
					전화
					<input type="text" name="phone" value="${memberInfo.phone }" />
					<br />
					<div>
						<button type="button" id="modifySubmitButton1"
							data-bs-toggle="modal" data-bs-target="#modalSheet2" disabled>수정</button>
						<button type="button" data-bs-toggle="modal"
							data-bs-target="#modalSheet1">삭제</button>
					</div>

					<a href="updatePw">비밀번호 변경하러 가기</a>
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


















