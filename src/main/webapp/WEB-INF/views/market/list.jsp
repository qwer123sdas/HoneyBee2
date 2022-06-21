 <%@page import="com.team.honeybee.domain.MarketDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />   
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- Libraries Stylesheet -->
    <link href="${appRoot }/resources/webContents/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${appRoot }/resources/webContents/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${appRoot }/resources/webContents/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${appRoot }/resources/webContents/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${appRoot }/resources/webContents/css/style.css" rel="stylesheet">






</head>
<body>
	<my:navbar></my:navbar>

<!-- Section-->

        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4">
                   
                    <c:forEach items="${list }" var="list">
                        <div class="card">  
                          <c:if test = "${not list.hasFile }">
                            <img class="card-img-top" src="https://dummyimage.com/900x400/ced4da/6c757d.jpg" alt="..." />
                           </c:if>
                          	<c:if test= "${list.hasFile}">
	                          	<%
								MarketDto market = (MarketDto) pageContext.getAttribute("list");
								String encodedFileName = java.net.URLEncoder.encode(market.getThumbNailImage(), "utf-8");
								pageContext.setAttribute("encodedFileName", encodedFileName);
								%>
                          		<img src="${imageUrl}/market/${list.marketId}/${encodedFileName}">
                          		
                          	</c:if> 
                            <!-- Product details-->
                            <div class="card-body">
                                <div class="text-center">
                                    <!-- Product name--> 
                                    <h5 class="fw-bolder">${list.productName }
                             </h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                     <%--여기가 가격 --%>${list.price }
                                    
                                    </div>
                        		</div>
                            </div>
                            <!-- Product actions-->
                            <c:url value="/market/get" var="getUrl">
								<c:param name="marketId" value="${list.marketId }"></c:param>
							</c:url>
                            
                            <div class="card-footer p-1 pt-0 border-top-0">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="${getUrl}">  <i class="bi bi-bag-plus-fill"></i></a><i class="bi bi-bag-plus-fill"></i></div>
                            </div>
                       	</div>
                       	
                      </c:forEach>
                    </div>
                                
               </div>
        </section>
<my:footbar></my:footbar>
  

</body>
</html>