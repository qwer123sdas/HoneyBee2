<%@page import="com.team.honeybee.domain.FaqDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags"%>
<% request.setCharacterEncoding("utf-8"); %>
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
	$("#deleteButton1").click(function(e) {
		e.preventDefault();
		if(confirm("정말 삭제하시겠습니까?")) {
			let form1 = $("#form1");
			let actionAttr = "${appRoot}/admin/removeFaq";
			let methodAttr = "post";
			form1.attr("action", actionAttr);
			form1.attr("method", methodAttr);
			
			form1.submit();
		}
	});
});
</script>

<title>1대1문의 내용보기(관리자)</title>
</head>
<body>
	<div id="wrapper">
		
		<nav:sidebar current="faq"></nav:sidebar>
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			
			<!-- Main Content -->
			<div id="content">
				
				<nav:topbar></nav:topbar>
				<!-- Page Header Start -->
				<form id="form1" action="${appRoot }/admin/answerFaq" method="get">
					<input type="hidden" name="questionId" value="${faq.questionId }" />
					<input type="hidden" name="email" value="${faq.email }" />
					<div class="container-fluid">
						<div class="container">
							<div class="row">
								<div class="col">
									<h1>1대1문의</h1>
									<!-- Page Header End -->
									<!-- Page content-->
									<div id="wrap_cnt_prom">
										<!-- Body Content -->
										<div id="body_cont">
											<div class="cont_box">
												<!-- <span class="img_ico"><img src=""></span> -->
												<span class="fw-bolder tit_head">${faq.title }</span><br />
												<span class="txt_body">${faq.email }</span>
												<!-- 대표 이미지-->
												<c:if test="${empty faq.fileName }">
													<figure class="img_ico mb-4">
														<img class="img-fluid rounded" src="https://dummyimage.com/900x400/ced4da/6c757d.jpg" alt="..." />
													</figure>
												</c:if>
												<c:if test="${not empty faq.fileName }">
													<c:forEach items="${faq.fileName }" var="file">
														<%
														String file = (String) pageContext.getAttribute("file");
														String encodedFileName = java.net.URLEncoder.encode(file, "utf-8");
														pageContext.setAttribute("encodedFileName", encodedFileName);
														%>
														<figure class="mb-4">
															<img class="img-fluid" src="${imageUrl }/faq/${faq.questionId }/${encodedFileName}" alt="">
														</figure>
													</c:forEach>
												</c:if>
												<span class="txt_body">${faq.content }</span>
												<div style="display: flex; justify-content: flex-end;">
													<c:if test="${faq.enable == 0 }">
														<button id="registerButton1" class="btn btn-primary">답변작성</button>
													</c:if>
													<button id="deleteButton1" class="btn btn-danger">삭제</button>
												</div>
												<hr class="mt-5 mb-4" />
												
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
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
</body>
</html>