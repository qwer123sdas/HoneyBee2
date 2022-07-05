<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
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

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>

<style>

.table td{
vertical-align:middle;


}
</style>
<body>
<my:mainNavBar current="payList"></my:mainNavBar>
	<form action="${appRoot }/member/payList" method="post">
		<div class="container">
			<div class="row">
				<div class="col-8 mt-5 ms-5">
				
					<table class="table">
						<colgroup>
							<col style="width: 10%">
							<col style="width: 40%">
							<col style="width: 20%">
							<col style="width: 20%">
							<col style="width: 10%">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">상품</th>
								<th>상품이름</th>
								<th>수랑</th>
								<th>구매가격</th>
								<th>구매일자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${payList}" var="pay" varStatus="status">
								<c:if test="${not empty marketList }"> <!-- 필요하면 변경 marketList[status.index].marketId -->
									<%-- <h1>${payList[status.index] }</h1>
									<h1>${marketList[status.index] }</h1>
									<h1>${status.index }</h1> --%>
									<tr>
										<td><img width="150px" height="auto" src="${imageUrl }/market/${marketList[status.index].marketId }/${marketList[status.index].thumbNailImage }" alt="" /></td>
										<td style ="vertical-align:middle"><c:url value="/member/payGet" var="getUrl">
												<c:param name="orderId" value="${pay.orderId }"></c:param>
											</c:url> <a href="${getUrl }"> <c:out value="${pay.productName }" />
										</a></td>
										<td>${pay.amount }</td>
										<td>${pay.finalPayment}원</td>
										<td>${pay.inserted }</td>
										<!--<c:if test="${faq.enable == 0 }">
											<td>답변중</td>
										</c:if>
										<c:if test="${faq.enable == 1  }">
											<td>답변완료</td>
										</c:if>-->
	
										<!--  -->
	
									</tr>
								</c:if>

							</c:forEach>

						</tbody>

					</table>  
					
					

				</div>
			</div>
		</div>
	</form>
</body>
</html>