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



<meta charset="UTF-8">
</head>
<style>
table.insertTable {
	width: 100%;
	height: 200px;
	border: 1px solid #444444;
}

td.insertTable1 {
	width: 30px;
	border: 1px solid #444444;
	text-align: center;
	background-color: #ffc107;
}

td.insertTable2 {
	border: 1px solid #444444;
	width: 150px;
}

td.insertTable3 {
	border: 1px solid #444444;
	text-align: center;
	height: 500px;
}

h1 {
	color: #ffc107;
}

textarea {
	height: 500px;
	border: none;
	resize: none;
}
</style>
<body>
	<my:navbar></my:navbar>
	<my:faq1tag></my:faq1tag>
	<div class="container">
		<div class="row">
			<my:faq></my:faq>
			<div class="col-8 mt-3 ms-5">
				<h1>1대1 문의</h1>
				<form action="${appRoot }/faq/insert" method="post"
					enctype="multipart/form-data">
					<table class="insertTable">
						<tr>

							<td class="insertTable1">제목</td>
							<td class="insertTable2"><div>
									<label class="form-label" for="input1"></label> <input
										class="form-control" type="text" name="title" required /> <br />

								</div></td>
						</tr>
						<tr>
							<td class="insertTable1">이메일</td>
							<td class="insertTable2"><div>
									<label class="form-label" for="input1"></label><input
										class="form-control" type="email" name="email" required />
									※메일 주소가 틀릴경우 답변을 못받을 수 있습니다. <br />
								</div></td>


						</tr>
						<tr>
							<td class="insertTable3 "style="background-color: #ffc107;">문의내용</td>
							<td class="insertTable3"><div>
									<label for="textareal1"></label>
									<textarea class="form-control" name="content" id="" cols="30"
										rows="10" required></textarea>
									<br />
								</div></td>
						</tr>

						<tr>
							<td class="insertTable1">파일첨부</td>
							<td class="insertTable2"><input multiple="multiple"
								type="file" name="file" accept="image/*" /></td>
						</tr>

					</table>
					<div>※ 이미지 파일만 첨부 가능합니다.</div>
					<div>※ 문의에 욕설, 폭언, 인격침해, 성적 수치심을 유발하는 내용 포함 시 상담이 중단될 수 있습니다.</div>
					<button class="btn btn-warning" style="float: right;">작성완료</button>

				</form>

				<br /> <br /> <br /> <br /> <br /> <br />
			<!-- <div>※ 출처:거상 1대1 문의</div>
				 <div>※ 이 파일은 영리목적이 없음을 알려드립니다.</div> -->

			</div>
		</div>
	</div>
	<my:footbar></my:footbar>
</body>
</html>