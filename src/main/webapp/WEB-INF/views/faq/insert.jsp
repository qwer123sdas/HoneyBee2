<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	   <link href="${appRoot }/resources/webContents/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${appRoot }/resources/webContents/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${appRoot }/resources/webContents/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${appRoot }/resources/webContents/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${appRoot }/resources/webContents/css/style.css" rel="stylesheet">


	
<meta charset="UTF-8">
</head>
<body>
	<my:navbar></my:navbar>


	<div class="container">
		<div class="row">
			<div class="col">
			
				<h1>1대1 문의</h1>
				<form action="${appRoot }/faq/insert" method="post">
					<div>
						<label class="form-label" for="input1"></label> 
						<input class= "form-control" type="text" name="title"  /> <br />

					</div>
					<div>
						<label class="form-label" for="input1"></label> 
						<input class= "form-control" type="email" name="email"  /> <br />

					</div>
		

					<div>
						<label for="textareal1">문의 내용 </label> 
						<textarea class="form-control" name = "content" id="" cols="30" rows="10"></textarea> <br />
					</div>
					<div>
						파일
						<input multiple="multiple" type="file" name="file" accept="image/*" />
					</div>
					
					<button class="btn btn-primary">취소</button>
					<button class="btn btn-primary">작성완료</button>
				</form>
			</div>
		</div>
	</div>
	<my:footbar></my:footbar>
	</body>
</html>