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
<title>회원 정보</title>
</head>
<body>
	<my:navBar current="info"></my:navBar>

	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-lg-6">
				<form id="form1" action="${appRoot }/member/info" method="get">
					<h1>회원 정보</h1>

					아이디
					<input type="text" name="memberId" value="${memberInfo.memberId }" />
					<br />
					이름
					<input type="text" name="name" value="${memberInfo.name }" />
					<br />
					이메일
					<input type="email" name="email" value="${memberInfo.email }" />

					<br />
					닉네임
					<input type="text" name="nickname" value="${memberInfo.nickname }" />

					<br />
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
						<button data-bs-toggle="modal" data-bs-target="#modalSheet1">삭제</button>
					</div>

				</form>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="modalSheet1" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary">회원 탈퇴</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 
	<div
		class="modal modal-sheet position-static d-block bg-secondary py-5"
		tabindex="-1" role="dialog" id="modalSheet1">
		<div class="modal-dialog" role="document">
			<div class="modal-content rounded-6 shadow">
				<div class="modal-header border-bottom-0">
					<h5 class="modal-title">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body py-0">
					<p>This is a modal sheet, a variation of the modal that docs
						itself to the bottom of the viewport like the newer share sheets
						in iOS.</p>
				</div>
				<div class="modal-footer flex-column border-top-0">
					<button type="button"
						class="btn btn-lg btn-primary w-100 mx-0 mb-2">삭제</button>
					<button type="button" class="btn btn-lg btn-light w-100 mx-0"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	 -->


</body>
</html>