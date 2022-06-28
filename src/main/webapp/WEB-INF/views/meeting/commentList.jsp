<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>Insert title here</title>
</head>
<body>
	<!-- Comment with nested comments-->
	<div class="d-flex mb-4">
		<!-- Parent comment-->
		<div class="flex-shrink-0">
			<!-- 프로필사진 -->
			<img class="rounded-circle"
				src="${appRoot}/resources/webContents/img/user_profile.png"
				alt="..." />
			<!-- 프로필사진 -->
		</div>
		<div class="ms-3 justify-content-between">
			<div class="fw-bold ">
				\${list[i].nickname }
				<br>
				\${list[i].inserted }
			</div>
		</div>
		\${list[i].content }
		<div class="ms-3 justify-content-between">
			<div class="fw-bold ">
				<a class="small fw-medium" href="#">
					<strong class="replyTxt">답글 작성</strong>
					<span class="replyCnt" style="">0</span>
				</a>
				<div class="replyIcon">
					<!-- 좋아요 -->
					<a class="replyLike" href="#">
						<i class="fa-regular fa-heart"></i>
						<em class="replyLikeCnt">0</em>
					</a>
				</div>
			</div>


			<!-- Child comment 1-->
			<div class="d-flex mt-4">
				<div class="flex-shrink-0">
					<img class="rounded-circle"
						src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
				</div>
				<div class="ms-3">
					<div class="fw-bold">Commenter Name</div>
					And under those conditions, you cannot establish a capital-market
					evaluation of that enterprise. You can't get investors.
				</div>
			</div>
			<!-- Child comment 2-->
			<div class="d-flex mt-4">
				<div class="flex-shrink-0">
					<img class="rounded-circle"
						src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
				</div>
				<div class="ms-3">
					<div class="fw-bold">Commenter Name</div>
					When you put money directly to a problem, it makes a good headline.
				</div>
			</div>
		</div>
	</div>
	<!-- 댓글 끝 -->

<!-- 수정삭제관련 포 -->
	<a class="small fw-medium"
		href="${appRoot }/meeting/board/${reply.meetingReplyId}">
		<i class="fa-solid fa-trash-can"></i>
		삭제
	</a>
	<a class="small fw-medium"
		href="${appRoot }/meeting/board/${reply.meetingReplyId}"
		id="insertReplyButton">
		<i class="fa-solid fa-pen"></i>
		수정
	</a>




	<div class="input-group ms-3">
		<span style="display: none">
			<input id="insertReplyContentInput1" class="form-control" type="text"
				name="content" placeholder="" style="display: none" />
			<br>
			<button class="btn btn-primary" id="insertReplyButton1">
				<i class="fa-solid fa-circle-check"></i>
			</button>
		</span>
		<input type="hidden" name="meetingReplyId"
			value="\${list[i].meetingReplyId }" />
		<input type="hidden" name="refNum" value="\${list[i].refNum }" />
		<input type="hidden" name="refOrder" value="\${list[i].refOrder }" />
		<input type="hidden" name="meetingId" value="\${list[i].meetingId }" />
	</div>
</body>
</html>