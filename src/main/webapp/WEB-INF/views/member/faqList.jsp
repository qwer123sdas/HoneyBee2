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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
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
<title>FAQ : 꿀비</title>

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
	<my:navBar current="faqList"></my:navBar>
	<form action="${appRoot }/faq/remove" method="post">
		<div class="container">
			<div class="row">
				<div class="col-8 mt-5 ms-5">
					<table class="table">
						<colgroup>
							<col style="width: 10%">
							<col style="width: 50%">
							<col style="width: 20%">
							<col style="width: 10%">
							<col style="width: 10%">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th scope="col">제목</th>
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


									<td><input name="questionIdList" class="deleteButton"
										type="checkbox" data-oper='remove' value="${faq.questionId }">
									</td>
								</tr>

							</c:forEach>

						</tbody>

					</table>
					<div class="d-flex flex-row-reverse">
						<button class="btn btn-danger">글삭제</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>