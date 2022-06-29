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

<style>

</style>

<script>

</script>

<title>내가 쓴 글 : 꿀비</title>
</head>
<body>
	<my:navBar current="memberInfo"></my:navBar>
	
	<div>
		<table class="table caption-top table-hover">
			<caption>기부 게시판</caption>
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">아이디</th>
					<th scope="col">제목</th>
					<th scope="col">enable</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="donation">
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
				<tr>
					<th scope="col">#</th>
					<th scope="col">아이디</th>
					<th scope="col">제목</th>
					<th scope="col">enable</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="talent">
					<tr>
						<td>
							<c:out value="${talent.donationId }"></c:out>
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
				<tr>
					<th scope="col">#</th>
					<th scope="col">아이디</th>
					<th scope="col">제목</th>
					<th scope="col">enable</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="meeting">
					<tr>
						<td>
							<c:out value="${meeting.donationId }"></c:out>
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
	
	<!-- 페이징 -->
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<li class="page-item disabled">
				<a class="page-link">Previous</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="#">1</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="#">2</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="#">3</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="#">Next</a>
			</li>
		</ul>
	</nav>
</body>
</html>