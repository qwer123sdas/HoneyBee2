<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags"%>
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
<title>나의 주문 : 꿀비</title>

</head>

<style>

.table td{
vertical-align:middle;


}
.divList{
margin: auto;
}
</style>
<body>
<my:mainNavBar current="payList"></my:mainNavBar>
	<form action="${appRoot }/member/payList" method="post">
		<div class="container">
			<div class="row">
				<div class="divList">
					<table class="table">
						<colgroup>
							<col style="width: 20%">
							<col style="width: 50%">
							<col style="width: 10%">
							<col style="width: 10%">
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
								<c:if test="${not empty marketList[status.index] }"> <!-- 필요하면 변경 marketList[status.index].marketId -->
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
								<c:if test="${not empty talentList[status.index] }"> <!-- 필요하면 변경 marketList[status.index].marketId -->
									<%-- <h1>${payList[status.index] }</h1>
									<h1>${marketList[status.index] }</h1>
									<h1>${status.index }</h1> --%>
									<tr>
										<td><img width="150px" height="auto" src="${imageUrl }/talent/${talentList[status.index].folderName }/${talentList[status.index].MPhoto }" alt="" /></td>
										<td style ="vertical-align:middle"><c:url value="/talent/board/${talentList[status.index].talentId }" var="getUrl">
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
	
	<!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>

	
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${appRoot }/resources/webContents/lib/wow/wow.min.js"></script>
    <script src="${appRoot }/resources/webContents/lib/easing/easing.min.js"></script>
    <script src="${appRoot }/resources/webContents/lib/waypoints/waypoints.min.js"></script>
    <script src="${appRoot }/resources/webContents/lib/counterup/counterup.min.js"></script>
    <script src="${appRoot }/resources/webContents/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="${appRoot }/resources/webContents/lib/isotope/isotope.pkgd.min.js"></script>
    <script src="${appRoot }/resources/webContents/lib/lightbox/js/lightbox.min.js"></script>

    <!-- Template Javascript -->
    <script src="${appRoot }/resources/webContents/js/main.js"></script>
	
	<nav:footbar_kim></nav:footbar_kim>
</body>
</html>