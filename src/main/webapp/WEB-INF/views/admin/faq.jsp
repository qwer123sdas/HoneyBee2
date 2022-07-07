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
<title>1대1문의(관리자)</title>
</head>
<body>
	<div id="wrapper">

		<nav:sidebar current="faq"></nav:sidebar>
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <nav:topbar></nav:topbar>

				<div class="container-fluid">
					<div class="row">
						<c:forEach items="${faq }" var="faq">
							<c:url value="/admin/getFaq" var="getUrl">
								<c:param name="questionId" value="${faq.questionId }"></c:param>
							</c:url>
							<div class="card" style="width: 18rem;">
							  <c:if test="${empty faq.thumbNailImage }">
							  	<figure class="img_ico mb-4">
							  		<img class="img-fluid rounded" src="https://dummyimage.com/900x400/ced4da/6c757d.jpg" alt="" />
							  	</figure>
							  </c:if>
							  <c:if test="${not empty faq.thumbNailImage }">
							  	<%
							  	FaqDto faq = (FaqDto) pageContext.getAttribute("faq");
								String encodedFileName = java.net.URLEncoder.encode(faq.getThumbNailImage(), "utf-8");
								pageContext.setAttribute("encodedFileName", encodedFileName);
							  	%>
							  	<figure class="mb-6">
						  			<img src="${imageUrl }/faq/${faq.questionId }/${encodedFileName }" class="img-fluid rounded" alt="">
						  	  	</figure>
						  	  </c:if>
							  <div class="card-body">
							    <h4 class="card-title">${faq.title }</h4>
							    <p><strong>아이디 : </strong> ${faq.memberId }</p>
							    <p><strong>이메일 : </strong> ${faq.email }</p>
							    <p><strong>등록여부</strong><c:if test="${faq.enable == 1 }">답변완료</c:if>
							    <c:if test="${faq.enable == 0 }">답변전</c:if></p>
							    <a href="${getUrl }" class="stretched-link"></a>
							  </div>
							</div>			
						</c:forEach>
					</div>
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
</body>
</html>