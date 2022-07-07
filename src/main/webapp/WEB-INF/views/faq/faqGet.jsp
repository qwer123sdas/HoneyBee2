<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<div class="container">
		<div class="row">
			<div class="col">		
						<input type="hidden" name="questionId" value="${faq.questionId }" />
						<div>
							<label class="form-label" for="memberinput1">맴버</label>
							<input class="form-control" type="text" value="${faq.memberId }"
								name="memberId" required id="memberinput1" readonly />
						</div>
						
						<div>
							<label class="form-label" for="input1">제목 </label>
							<input class="form-control" type="text" value="${faq.title }"
								name="title" required id="input1" readonly />
						</div>
						<br />
						
						
						
						
						
						
						<br />
						<div>
							<label class="form-label" for="textarea1">본문</label>
							<textarea class="form-control" id="textarea1" cols="30" rows="10"
								name="content" readonly>${faq.content }</textarea>
						</div>
						<br />
						
						
						
						
						<div>
							<label for="form-label" class="form-label"> 이메일 :</label>
							<input type="form-control" id="email"  cols="30" value="${faq.email }" readonly />
							<br />
						</div>
						
						</div>
						

				</div>
			</div>
		</div>
			<my:footbar></my:footbar>
</body>
</html>