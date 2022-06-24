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

<script>
	$(document).ready(function() {
		$("#deleteAllButton").click(function() {
			if ($("#deleteAllButton").is(":checked"))
				$(".deleteButton").prop("checked", true);
			else
				$(".deleteButton").prop("checked", false);
		});
		$(".deleteButton").click(function() {
			var total = $(".deleteButton").length;
			var checked = $(".deleteButton:checked").length;

			if (total != checked)
				$("#deleteAllButton").prop("checked", false);
			else
				$("#deleteAllButton").prop("checked", true);
		});
	});
</script>

</head>
<body>
	<my:navbar></my:navbar>
	<my:faq1tag></my:faq1tag>
	<div class="container">
		<div class="row">
			<my:faq></my:faq>
			<div class="col-8 mt-4 ms-5">
				<table class="table">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>문의일자</th>
							<th>처리상태</th>

							<th><input id="deleteAllButton" type="checkbox"
								data-oper='remove' />삭제</th>

						</tr>
					</thead>
					<tbody>
						<c:forEach items="${faqList}" var="faq">
							<tr>
								<td>${faq.questionId }</td>
								<td><c:url value="/faq/faqGet" var="getUrl">
										<c:param name="questionId" value="${faq.questionId }"></c:param>
									</c:url> <a href="${getUrl }"> <c:out value="${faq.title }" />
								</a></td>
								<td>${faq.inserted }</td>
								<c:if test="${faq.enable == 0 }">
									<td>답변중</td>
								</c:if>
								<c:if test="${faq.enable == 1  }">
									<td>답변완료</td>
								</c:if>


								<td><input class="deleteButton" type="checkbox"
									data-oper='remove'>
								</button></td>
							</tr>

						</c:forEach>

					</tbody>

				</table>
				<div class='right-box'>
					<a class="btn btn-danger">글삭제</a>
				</div>
			</div>

		</div>
	</div>
	<my:footbar></my:footbar>
</body>
</html>