<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<title>Insert title here</title>
</head>
<body>
		<!-- 댓글 insert 시작 -->
		<div class="replyFormLayout">
			<div class="replyUserInfoLayout" style="margin-top: 24px;">
				<div class="replyinsertFormLayout1">
				<form action="${appRoot }/meeting/replyForm" method="get" style="margin-top: 16px; margin-bottom: 24px;">
					<div class="replyInsertForm">
						<input type="hidden" name="meetingId" value="${meeting.meetingId }" />
						더하기 버튼 누르면 로그인 창으로 이동, 대댓글 입력
						<textarea placeholder="댓글을 입력해주세요!" name="content" id="content" cols="30" rows="1" style="overflow-x: hidden; overflow-wrap: break-word; height: 48px;"></textarea>
						<button id="insertReplyButton1" kind="textGreay" type="submit" id="replyInsert"><i class="fa-solid fa-comment"></i></button>
						
						<span class="전송버튼 아이콘">
							<svg id="전송버튼 경로 추가한듯"> 전송 아이콘 추가</svg>
						</span>
					</div>
				</form>
			</div>
				
				<section class="replyUserInfo">
					<div class="userProfile1">
						<span class="userProfile">
							<img class="rounded-circle" src="${appRoot}/resources/webContents/img/user_profile.png" alt="" />
							프로필사진
						</span>
					</div>
					<div class="nicknameInsert">
						<strong class="nickname">
							닉네임, 
						</strong>
						<div class="insert">
							글쓴날짜
						</div>
					</div>
				</section>
				<section class="updateDelete">
					수정, 삭제 버튼				
				</section>
			</div> <!-- replyUserInfoLayout 끝 -->
			<div class="replyContent">
				댓글 내용
			</div>
			<!-- 대댓글용 insert -->
			<div class="replyinsertFormLayout2">
				<form action="${appRoot }/meeting/replyform" method="post" style="margin-top: 16px; margin-bottom: 24px;">
					<div class="replyInsertForm">
						<input type="hidden" name="meetingId" value="${meeting.meetingId }" />
						더하기 버튼 누르면 로그인 창으로 이동, 대댓글 입력
						<textarea placeholder="댓글을 입력해주세요!" name="content" id="content" cols="30" rows="1" style="overflow-x: hidden; overflow-wrap: break-word; height: 48px;"></textarea>
						<button id="insertReplyButton1" kind="textGreay" type="submit" id="replyInsert"><i class="fa-solid fa-comment"></i></button>
						
						<span class="전송버튼 아이콘">
							<svg id="전송버튼 경로 추가한듯"> 전송 아이콘 추가</svg>
						</span>
					</div>
				</form>
			</div>
		</div> <!-- 댓글 전체 끝 -->
		
		
		
		
			<div id="replyAreaPaginate" style="display: none;">
				<textarea placeholder="댓글을 입력해주세요!" name="content" id="content" cols="30" rows="1" style="overflow-x: hidden; overflow-wrap: break-word; height: 48px;"></textarea>
				<button id="insertReplyButton1" kind="textGreay" type="submit" id="replyInsert"><i class="fa-solid fa-comment"></i></button>
			</div>
		

</body>
</html>