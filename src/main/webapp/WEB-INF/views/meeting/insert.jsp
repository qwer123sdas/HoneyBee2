<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>


<!-- daum 주소검색 api 추가 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function daumPostCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 우편번호와 주소 정보를 해당 input에 넣는다.
				document.getElementById('postcode').value = data.zonecode;
				document.getElementById("address").value = addr;
				// 커서를 상세주소 입력 포커스
				document.getElementById("detailAddress").focus();
			}
		}).open();
	}
</script>

<title>Insert title here</title>
<style type="text/css">
	var themeObj = {
   bgColor: "#FBC02D" //바탕 배경색

	};
</style>

</head>
<body>
	
	<!-- Nav bar  -->
	<nav:navbar></nav:navbar>
	<!-- 모임 데이터 처리용(나중에 제안서로 변경예정) -->
	<div class="container">
		<div class="row">
			<div class="col">
				<h1>모임 작성</h1>
				<form action="${appRoot }/meeting/board" method="post" enctype="multipart/form-data">
					<!-- meeting_id : 자동생성
					member_id : 권한처리 -->
					
					<!-- 모임 카테고리 고르기 추가해야함 -->
					
					title : 
					<label for="titleInput" class="form-label">제목</label>
					<input type="text" name="title" id="titleInput" />
					
					contents :
					<label for="contentsTextarea" class="form-label">본문</label>
					<textarea name="contents" id="contentsTextarea" cols="30" rows="10" class="form-control"></textarea>
					
					address :
					<label for="address">모임장소</label>
					<input type="text" name="postcode" id="postcode" placeholder="우편번호">
					<input type="button" onclick="daumPostCode()" value="우편번호 찾기"><br>
					<input type="text" id="address" name="address" placeholder="주소"><br>
					<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소">
					
					file :
					<!-- 모임 이미지 aws s3 bucket upload -->
					<c:forEach items="" var="file">
						<% 
						/* 파일명 encoding */
						String file = (String) pageContext.getAttribute("file");
						String encodingFileName = java.net.URLEncoder.encode(file, "utf-8");
						pageContext.setAttribute("encodingFileName", encodingFileName);
						%>
						<!-- img-fulid 이미지 크기 고정 -->
						<img class="img-fulid" src="" alt="" />
					</c:forEach>
					
					
					<!-- guest : 모임보드에서 넘겨줄 값 -->
					
					<!-- inserted : 자동생성 -->
					start_date :
					<label for="start_date">모집 시작일</label>
					<input type="date" name="start_date" id="start_date" />
					
					end_date :
					<label for="end_date">모집 종료일</label>
					<input type="date" name="end_date" id="end_date" />
					
					<button type="submit">전송</button>

				</form>
			</div>
		</div>
	</div>
</body>
</html>