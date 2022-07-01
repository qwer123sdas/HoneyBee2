<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
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
body {
	height: 1600px;
	font-family: "Apple SD Gothic Neo", "Malgun Gothic", sans-serif;
}

table {
	text-align: left;
	table-layout: fixed;
	width: 756px;
}

table.table.caption-top.table-hover thead th {
	width: 150px;
	padding: 10px;
	margin: 20px 10px; font-weight : bold;
	color: #fff !important;
	font-weight: bold;
}

thead .donation:first-child {
	width: 50px;
}

thead .donation:nth-child(2) {
	width: 100px;
}

table thead tr.headDonation{
	background-color: #f48fb1;
}

table thead tr.headTalent{
	background-color: #f48fb1;
}

table thead tr.headMeeting{
	background-color: #f48fb1;
}
</style>

<script>
	
</script>

<title>내가 쓴 글 : 꿀비</title>
</head>
<body>
	<my:navBar current="memberInfo"></my:navBar>

	<div class="main-container">
		<div class="row">
			<div class="col">
				<table class="table caption-top table-hover">
					<caption>기부 게시판</caption>
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

				<table class="table caption-top table-hover">
					<caption>재능판매 게시판</caption>
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

				<table class="table caption-top table-hover">
					<caption>모임 게시판</caption>
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