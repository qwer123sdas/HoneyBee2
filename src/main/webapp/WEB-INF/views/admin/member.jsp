<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:url value="/resources/admin" var="resources" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="${resources }/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<link href="${resources }/css/sb-admin-2.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>
	$(document).ready(function() {
		let tr;
		// 테이블 클릭시 데이터 가져오기
		$("#dataTable tbody").on('click', 'tr', function() {
			let str = "";
			let tdArr = new Array();
			
			tr = $(this);
			let td = tr.children();
			
			console.log(tr.text());
			
			td.each(function(i) {
				tdArr.push(td.eq(i).text());
			});
			
			console.log(tdArr);
			
			let id = td.eq(0).text();
			let name = td.eq(1).text();
			let email = td.eq(2).text();
			let nickname = td.eq(3).text();
			let postcode = td.eq(4).text();
			let phone = td.eq(5).text();
			
			$("#id-result").val(id);
			$("#id-result2").val(id);
			$("#name-result").val(name);
			$("#email-result").val(email);
			$("#nickname-result").val(nickname);
			$("#postcode-result").val(postcode);
			$("#phone-result").val(phone);
		});
		var myModal = new bootstrap.Modal(document.getElementById('modify'), {})		
		// 수정버튼 누를시 데이터가 있는지
		var myModalEl = document.getElementById('modify');
		myModalEl.addEventListener('show.bs.modal', function (e) {
			// do something...
			e.preventDefault();
			console.log("hello");
			if (tr == null) {
				alert("수정할 행을 선택하세요.");
				
			} else {
				myModal.show();  
			}
		})
		
		$(".modify-modal-close").click(function() {

			myModal.hide();  
		});
		/*
		$("#modifyButton").click(function() {
			var myModal = new bootstrap.Modal(document.getElementById('modify'), {})
			if (tr == null) {
				myModal.hide();
				alert("수정할 행을 선택하세요.");
			} else {
				myModal.show();
			}
		});
		*/
		// 삭제버튼 클릭시 삭제할것인가를 띄워줌
		$("#deleteButton").click(function() {
			if(tr == null) {
				alert("삭제할 행을 선택하세요.");
			} else {
				if(confirm("정말 삭제하시겠습니까?")) {
					$("#form2").submit();
				}
			}
		});
	});
</script>

<title>Insert title here</title>
</head>
<body>
	<div class="modal fade" id="modify" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
			<form id="form1" action="updateMember.do" method="post">
				<div class="modal-header">
					<h5 class="modal-title">회원수정</h5>
					<button type="button" class="btn-close modify-modal-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="mb-3">
					    <label for="id-result" class="form-label">아이디</label>
					    <input type="text" id="id-result" class="form-control" name="memberId" />
					</div>
					<div class="mb-3">
					    <label for="ename-result" class="form-label">이름</label>
					    <input type="text" id="name-result" class="form-control" name="name" />
					</div>
					<div class="mb-3">
					    <label for="email-result" class="form-label">이메일</label>
					    <input type="text" id="email-result" class="form-control" name="email" />
					</div>
					<div class="mb-3">
					    <label for="nickname-result" class="form-label">닉네임</label>
					    <input type="text" id="nickname-result" class="form-control" name="nickname" />
					</div>
					<div class="mb-3">
					    <label for="postcode-result" class="form-label">우편번호</label>
					    <input type="text" id="postcode-result" class="form-control" name="postcode" />
					</div>
					<div class="mb-3">
					    <label for="phone-result" class="form-label">전화번호</label>
					    <input type="text" id="phone-result" class="form-control" name="phone" />
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">수정</button>
					<button type="button" class="btn btn-secondary modify-modal-close" data-bs-dismiss="modal">취소</button>
				</div>
			</form>
			</div>
		</div>
	</div>
	
	<div id="wrapper">

		<nav:sidebar></nav:sidebar>

		<div class="container-fluid">
		
			<nav:topbar></nav:topbar>
			
			<div class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800">회원관리</h1>
				<div class="d-sm-flex align-items-center justify-content-between">
					<button type="button" class="btn btn-primary" id="modifyButton" data-bs-toggle="modal" data-bs-target="#modify">수정</button>
					<form id="form2" action="deleteMember.do" method="post">
						<input type="hidden" id="id-result2" name="memberId" />
						<button type="button" class="btn btn-danger" id="deleteButton">삭제</button>
					</form>
				</div>
			</div>

			<div class="row">
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">회원목록</h6>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
								<thead>
									<tr>
										<td>아이디</td>
										<td>이름</td>
										<td>이메일</td>
										<td>닉네임</td>
										<td>우편번호</td>
										<td>전화번호</td>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${member }" var="mem">
										<tr>
											<td>${mem.memberId }</td>
											<td>${mem.name }</td>
											<td>${mem.email }</td>
											<td>${mem.nickname }</td>
											<td>${mem.postcode }</td>
											<td>${mem.phone }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

    <!-- Bootstrap core JavaScript-->
    <script src="${appRoot }/resources/admin/vendor/jquery/jquery.min.js"></script>
    <script src="${appRoot }/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${appRoot }/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${appRoot }/resources/admin/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="${appRoot }/resources/admin/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level plugins -->
    <script src="${appRoot }/resources/admin/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${appRoot }/resources/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${appRoot }/resources/admin/js/demo/datatables-demo.js"></script>
</body>
</html>