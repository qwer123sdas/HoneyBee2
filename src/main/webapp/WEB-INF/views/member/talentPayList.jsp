<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
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
<link
	href="${appRoot }/resources/webContents/lib/animate/animate.min.css"
	rel="stylesheet">
<link
	href="${appRoot }/resources/webContents/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="${appRoot }/resources/webContents/lib/lightbox/css/lightbox.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="${appRoot }/resources/webContents/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Template Stylesheet -->
<link href="${appRoot }/resources/webContents/css/style.css"
	rel="stylesheet">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
table{
text-align: center;
vertical-align: middle;
}

.talent_left_btn {
	width: 50%;
	float: left;
}

.talent_right_btn {
	width: 50%;
	float: left;
}
</style>
<body>
<my:mainNavBar current="talentPayList"></my:mainNavBar>
	<div class="container">
		<div class="row">
			<div class="lg-8">
				<table class="table">

					<thead>
						<tr>
							<th scope="col">#</th>
							<th>list</th>
							<th>상품이름</th>
							<th>상품정보</th>
							<th>평가</th>
							<th>재구매</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${myTalentList}" var="talent" varStatus="status">
							<c:url value="/talent/board/${talent.talentId }" var="getTalentUrl">
							</c:url>
							<!--  	<td>${talent.talentId}</td>
									<td>${talent.title}</td>
									<td>${talent.nickname}</td>
									<td>${talent.price}원</td>
									<td>${talent.starRating }</td>-->
							<td style="vertical-align: middle;">${talent.talentId }</td>
							<td><img width="180px" height="auto"
								src="${imageUrl }/talent/${talent.folderName }/${talent.MPhoto}"
								alt="" /></td>
							<td style="vertical-align: middle;">${talent.title}</td>

							<td style="border: 1px solid #444444; vertical-align: middle;">
								<div class="talent_left_btn">
									<div>가격:</div>
									<div>판매자:</div>
								</div>
								<div class="talent_right_btn">
									<div>${talent.price}</div>
									<div>${talent.nickname}</div>
								</div>
							</td>
							<td style="border: 1px solid #444444; vertical-align: middle;">${talent.starRating }</td>
							<td style="vertical-align: middle;"><a href="${getTalentUrl}"><button type="button"
										class="btn btn-warning" style="">재구매</button></a></td>
							</tr>

						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>