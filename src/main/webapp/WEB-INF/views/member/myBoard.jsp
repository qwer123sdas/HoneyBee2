<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<!-- initializing dataTable -->
<script>
	$(document).ready(function () {
	    $('#donationBoard').DataTable();
	});
	$(document).ready(function () {
	    $('#talentBoard').DataTable();
	});
	$(document).ready(function () {
	    $('#meetingBoard').DataTable();
	});
</script>

<style>
body {
	height: 1600px;
	font-family: "Apple SD Gothic Neo", "Malgun Gothic", sans-serif;
}
caption{
	color: #53a0c1;
	font-weight: bold;
	font-size: 25px;
}
thead tr{
	color: #fff;
	background-color: #87d1f4;
}
</style>

<title>내가 쓴 글 : 꿀비</title>
</head>
<body>
	<a:boardNavBar current="myBoard"></a:boardNavBar>
	<div class="main-container">
		<div class="row">
			<div class="col">
				<table class="table caption-top table-hover" id="donationBoard" style="width: 100%">
					<caption>&#60;기부 게시판&#62;</caption>
					<thead>
						<tr class="headDonation">
							<th scope="col">#</th>
							<th scope="col">작성자</th>
							<th scope="col">제목</th>
							<th scope="col">enable</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${donation }" var="donation">
							<tr>
								<td>
									<c:out value="${donation.donationId }"></c:out>
								</td>
								<td>
									<c:out value="${donation.memberId }"></c:out>
								</td>
								<td>
									<c:out value="${donation.title }"></c:out>
								</td>
								<td>
									<c:out value="${donation.enable }"></c:out>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<hr />

				<table class="table caption-top table-hover" id="talentBoard" style="width: 100%">
					<caption>&#60;재능판매 게시판&#62;</caption>
					<thead>
						<tr class="headTalent">
							<th scope="col">#</th>
							<th scope="col">작성자</th>
							<th scope="col">제목</th>
							<th scope="col">enable</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${talent }" var="talent">
							<tr>
								<td>
									<c:out value="${talent.talentId }"></c:out>
								</td>
								<td>
									<c:out value="${talent.memberId }"></c:out>
								</td>
								<td>
									<c:out value="${talent.title }"></c:out>
								</td>
								<td>
									<c:out value="${talent.enable }"></c:out>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<hr />

				<table class="table caption-top table-hover" id="meetingBoard" style="width: 100%">
					<caption>&#60;모임 게시판&#62;</caption>
					<thead>
						<tr class="headMeeting">
							<th scope="col">#</th>
							<th scope="col">작성자</th>
							<th scope="col">제목</th>
							<th scope="col">enable</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${meeting }" var="meeting">
							<tr>
								<td>
									<c:out value="${meeting.meetingId }"></c:out>
								</td>
								<td>
									<c:out value="${meeting.memberId }"></c:out>
								</td>
								<td>
									<c:out value="${meeting.title }"></c:out>
								</td>
								<td>
									<c:out value="${meeting.enable }"></c:out>
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