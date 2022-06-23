<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<my:navbar></my:navbar>

	<div class="container">
		<div class="row">
			<my:faq></my:faq>
			<div class="col-8 mt-3 ms-3">
				<h1>1대1 문의</h1>
				<form action="${appRoot }/faq/insert" method="post"
					enctype="multipart/form-data">
					<div>
						<label class="form-label" for="input1">제목</label> <input
							class="form-control" type="text" name="title" required /> <br />
	
					</div>
					<div>
						<label class="form-label" for="input1">이메일</label> <input
							class="form-control" type="email" name="email" required /> <br />
	
					</div>
	
	
					<div>
						<label for="textareal1">문의 내용 </label>
						<textarea class="form-control" name="content" id="" cols="30"
							rows="10" required></textarea>
						<br />
					</div>
					<div>
						파일 <input multiple="multiple" type="file" name="file"
							accept="image/*" />
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