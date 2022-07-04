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


<title>Insert title here</title>
</head>
<style>
h1{
color: #ffc107;
}

</style>
<body>
	<my:navbar></my:navbar>
	<my:faq1tag></my:faq1tag>
	<div class="container">
		<div class="row">
			<my:faq></my:faq>
			<div class="col-8 mt-5 ms-5">
			
			<h1>공지사항</h1>
			<table class="table">
			<colgroup>
							<col style="width: 10%">
							<col style="width: 60%">
							<col style="width: 15%">
							<col style="width: 15%">
				
						</colgroup>
				
						<tr>
							<th><i class="fa-solid fa-hashtag"></i></th>
							<th>제목</th>
							<th>작성자</th>
							<th><i class="fa-solid fa-calendar"></i></th>
						</tr>
				
				
						<tr style="justify-content: center;">
						<td style="colspan : 4;"></td>
						<td style="text-align: center;">준비중 입니다.</td>
						<td></td>
						<td></td>
						</tr>
					
				</table>
			
			</div>
		</div>
	</div>
	<my:footbar></my:footbar>
	</body>
</html>