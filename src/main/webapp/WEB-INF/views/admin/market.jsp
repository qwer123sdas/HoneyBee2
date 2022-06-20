<%@page import="com.team.honeybee.domain.MarketDto"%>
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
<title>Insert title here</title>
</head>
<body>
	<div id="wrapper">

		<nav:sidebar></nav:sidebar>

		<div class="container-fluid">
			<nav:topbar></nav:topbar>
			<a class="btn btn-primary" href="${appRoot }/admin/insert">판매글 작성</a>
			<div class="row">
				<c:forEach items="${market }" var="market">
					<c:url value="/admin/getMarket" var="getUrl">
						<c:param name="marketId" value="${market.marketId }"></c:param>
					</c:url>
					<div class="card" style="width: 18rem; margin: 1px;">
					  <c:if test="${not market.hasFile }">
					  	<figure class="img_ico mb-4">
					  		<img class="img-fluid rounded" src="https://dummyimage.com/900x400/ced4da/6c757d.jpg" alt="" />
					  	</figure>
					  </c:if>
					  <c:if test="${market.hasFile }">
					  	<%
					  	MarketDto market = (MarketDto) pageContext.getAttribute("market");
						String encodedFileName = java.net.URLEncoder.encode(market.getThumbNailImage(), "utf-8");
						pageContext.setAttribute("encodedFileName", encodedFileName);
					  	%>
					  	<figure class="mb-6">
				  			<img src="${imageUrl }/market/${market.marketId }/${encodedFileName }" class="img-fluid" alt="">
				  	  	</figure>
				  	  </c:if>
					  <div class="card-body">
					    <h4 class="card-title">${market.title }</h4>
					    <p><strong>상품명 : </strong> ${market.productName }</p>
					    <p><strong>가격 : </strong> ${market.price }</p>
					    <a href="${getUrl }" class="stretched-link"></a>
					  </div>
					</div>			
				</c:forEach>
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