<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="a" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- dataTable style -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" />
<!-- bootstrap -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css" />
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!-- dataTable -->
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<!-- dataTable bootstrap5 -->
<script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
<!-- for drop down animation -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<!-- initializing dataTable -->
<script>
	$(document).ready(function() {
		$('#donationReply').DataTable();
		let tr;
		// 테이블 클릭시 데이터 가져오기
		$("#donationReply tbody").on('click', 'tr', function() {
			
			let str = "";
			let tdArr = new Array();
			
			tr = $(this);
			let td = tr.children();
			
			console.log(tr.text());
			
			td.each(function(i) {
				tdArr.push(td.eq(i).text());
			});
			
			console.log(tdArr);
			
			$("#replyIdResult").val(td.eq(0).text());
			$("#donationReplyDeleteButtonWrapper").show();
		});
	});
	$(document).ready(function() {
		$('#meetingComment').DataTable();
		let tr;
		// 테이블 클릭시 데이터 가져오기
		$("#meetingComment tbody").on('click', 'tr', function() {
			let str = "";
			let tdArr = new Array();
			
			tr = $(this);
			let td = tr.children();
			
			console.log(tr.text());
			
			td.each(function(i) {
				tdArr.push(td.eq(i).text());
			});
			
			console.log(tdArr);
			
			$("#meetingCommentIdResult").val(td.eq(0).text());
			$("#meetingCommentDeleteButtonWrapper").show();
		});
	});
</script>

<style>
body {
	height: 1600px;
	font-family: "Apple SD Gothic Neo", "Malgun Gothic", sans-serif;
}
caption{
	color: #ba68c8;
	font-weight: bold;
	font-size: 25px;
}
thead tr{
	color: #fff;
	background-color: #e1bee7;
}
</style>

<title>내가 쓴 후기 : 꿀비</title>
</head>
<body>
	<a:boardNavBar current="myReview"></a:boardNavBar>
	<div class="main-container">
		<div class="row">
			<div class="col">
				<form action="deleteDonationReply" method="post">
					<input type="hidden" name="replyId" id="replyIdResult" />
					<div class="d-flex flex-row-reverse">
						<input id="donationReplyDeleteButtonWrapper" style="display: none;" type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#staticBackdrop" value="삭제"></input>
					</div>
					<!-- Donation Reply Modal -->
					<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="staticBackdropLabel">기부 댓글 삭제</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        정말로 삭제하시겠습니까?
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					        <button type="submit" class="btn btn-danger">삭제</button>
					      </div>
					    </div>
					  </div>
					</div>
				</form>
					<table class="table caption-top table-hover" id="donationReply" style="width: 100%">
						<caption>&#60;내가 쓴 기부 댓글&#62;</caption>
						<thead>
							<tr class="headDonationReply">
								<th scope="col">#</th>
								<th scope="col">작성자</th>
								<th scope="col">댓글</th>
								<th scope="col">기부금</th>
								<th scope="col">작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${donationReply }" var="donationReply">
								<tr>
									<td>
										<c:out value="${donationReply.replyId }"></c:out>
									</td>
									<td>
										<c:out value="${donationReply.memberId }"></c:out>
									</td>
									<td>
										<c:out value="${donationReply.content }"></c:out>
									</td>
									<td>
										<c:out value="${donationReply.amount }"></c:out>
									</td>
									<td>
										<c:out value="${donationReply.inserted }"></c:out>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				<hr />

				<form action="deleteMeetingComment" method="post">
					<input type="hidden" name="meetingCommentId" id="meetingCommentIdResult" />
					<div class="d-flex flex-row-reverse">
						<input id="meetingCommentDeleteButtonWrapper" style="display: none;" type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#staticBackdrop1" value="삭제"/>
					</div>
					<!-- Meeting Comment Modal -->
					<div class="modal fade" id="staticBackdrop1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="staticBackdropLabel">모임 후기 삭제</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        정말로 삭제하시겠습니까?
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					        <button type="submit" class="btn btn-danger">삭제</button>
					      </div>
					    </div>
					  </div>
					</div>
				</form>
				<table class="table caption-top table-hover" id="meetingComment" style="width: 100%">
					<caption>&#60;내가 쓴 모임 댓글&#62;</caption>
					<thead>
						<tr class="headMeetingComment">
							<th scope="col">#</th>
							<th scope="col">작성자</th>
							<th scope="col">후기</th>
							<th scope="col">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${meetingComment }" var="meetingComment">
							<tr>
								<td>
									<c:out value="${meetingComment.meetingCommentId }"></c:out>
								</td>
								<td>
									<c:out value="${meetingComment.memberId }"></c:out>
								</td>
								<td>
									<c:out value="${meetingComment.content }"></c:out>
								</td>
								<td>
									<c:out value="${meetingComment.inserted }"></c:out>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>