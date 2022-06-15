<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
 <link href="${appRoot }/resources/webContents/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${appRoot }/resources/webContents/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${appRoot }/resources/webContents/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${appRoot }/resources/webContents/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${appRoot }/resources/webContents/css/style.css" rel="stylesheet">

<title>Insert title here</title>
</head>
<body>
<div>
		이름: <input type="text" value="${member.name}"  readonly /><br/>
		아이디 : <input type="text" value="${member.memberId }" readonly /> <br />
		 암호: <input id="passwordInout1" type="text" value="" /> <br /> 
		 암호확인 : <input id="passwordInout2" type="text" value="" />
		<p id="passwordMessege1"></p>
		<br /> 
		이메일 : <input id="emailInput1" type="email" value="${member.email }" />
		<button id="emailCheckButton1" disabled>이메일 중복확인</button>
		<p id="emailMessage1"></p><br /> 
		닉네임 : <input type="text" id="nickNameInput1" value="${member.nickName }" />
		<button id="nickNameCheckButton1" disabled>닉네임 중복확인</button>
		<p id="nickNameMessage1"></p><br />
		 가입일시 : <input type="datetime-local" value="${member.birth }" readonly /> <br />
		 우편번호:<input type="text" value="${member.address }"></input><br/>
		 폰: <input type="text" value="${member.phone}" /><br/>
		 주소 : <input type="text" value="${member.address} "/><br/>
		 세부주소 : <input type="text" value="${member.detail}" />
	</div>
	<div>
		<button id="modifySubmitButton1" data-bs-toggle="modal"
			data-bs-target="#modal2" disabled>수정</button>
		<button data-bs-toggle="modal" data-bs-target="#modal1">삭제</button>
	</div>


	

</body>
</html>