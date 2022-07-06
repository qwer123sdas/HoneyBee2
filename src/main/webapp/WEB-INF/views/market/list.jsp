 <%@page import="com.team.honeybee.domain.MarketDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />   
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">
	<!--font-awesome  -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap" rel="stylesheet"> 

   <!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
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

<!-- Jquery -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	referrerpolicy="no-referrer"></script>

</head>
<body>
<!-- Section-->
	<my:mainNavBar current="marketList"></my:mainNavBar>
	
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5 ">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 d-flex justify-content-start">
                   
                    <c:forEach items="${list }" var="list">
                        <div class="card" style="width: 25rem; margin: 12px;">  
                          <c:if test = "${not list.hasFile }">
                            <img class="card-img-top" src="https://dummyimage.com/900x400/ced4da/6c757d.jpg" alt="..." />
                           </c:if>
                          	<c:if test= "${list.hasFile}">
	                          	<%
								MarketDto market = (MarketDto) pageContext.getAttribute("list");
								String encodedFileName = java.net.URLEncoder.encode(market.getThumbNailImage(), "utf-8");
								pageContext.setAttribute("encodedFileName", encodedFileName);
								%>
                          		<img class="image card-img-top rounded-4" style="height:230px; object-fit: cover;" src="${imageUrl}/market/${list.marketId}/${encodedFileName}">
                          		
                          	</c:if> 
                            <!-- Product details-->
                            <div class="card-body">
                                <div class="text-center">
                                    <!-- Product name--> 
                                    <h5 class="fw-bolder">${list.productName }
                             </h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2" 	style="color: #ffc107;">
                                     <%--여기가 가격 --%>${list.price }원
                                    
                                    </div>
                        		</div>
                            </div>
                            <!-- Product actions-->
                            <c:url value="/market/get" var="getUrl">
								<c:param name="marketId" value="${list.marketId }"></c:param>
							</c:url>
                            <a class="mt-auto stretched-link" href="${getUrl}"></a>
                       	</div>
                      </c:forEach>
                    </div>
                    <!-- 마켓 아랫부분에 코멘트 추가. -->
                    <div style="float: right;"> * 위 마켓의 상품의 수익금은 꿀비의 운영비 및 기부에 사용됩니다.</div>
               </div>
        </section>
		
  
	<nav:footbar_kim></nav:footbar_kim>
</body>
</html>