<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--font-awesome  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!--bootstrap  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!--Jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
<!-- Bulma  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
<title>Insert title here</title>
</head>
<body>
	
	<form action="${appRoot }/donation/board_write" method="POST" enctype="multipart/form-data">
		<label for="">제목</label>
		<input type="text" name="title"/>
		<br />
		<label for="">주제 내용</label>
		<!-- '모금중'일 경우 주제 선택 -->
		<select id="subtopic" name="subtopic" class="subtopic">
			<option value="0">주제 선택</option>
			<option value="1">어린이</option>
			<option value="2">장애인</option>
			<option value="3">어려운 이웃</option>
			<option value="4">환경</option>
		</select>
		<br />
		
		<label for="">내용</label>
		<input type="text" name="content"/>
		<br />
		<label for="">마감날짜</label>
		<input type="date" name="expired"/>
		<br />
		<label for="">목표금액</label>
		<input type="number" name="goal"/>

		<br />
		<label for="">메인사진 등록</label>
		<input type="file" name="mainPhoto" accept="image/*" /> 
		<br />
		<label for="">태그</label>
		<div class="input_tag"><input type="text" name="tag1" value="${tag1}" placeholder="태그1 (필수)"></div>
		<div class="input_tag"><input type="text" name="tag2" value="${tag2}" placeholder="태그2 (선택)"></div>
		<div class="input_tag"><input type="text" name="tag3" value="${tag3}" placeholder="태그3 (선택)"></div>
		
		<div class="input_tag"><input type="text" name="tagAll" placeholder="태그All"></div>
		<button>제출</button>
	</form>
</body>
</html>