<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap"
	rel="stylesheet">

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
</head>
<style>
table.jh-table {
	width: 100%;
	border: 1px solid #444444;
	width: 100%;
	height: 300px;
}

td.jh-table {
	padding: 20px;
}

.jh-table td:first-child {
	background-color: #ffc107;
	width: 10%;
}

.jh-table td:nth-child(3) {
	border: 1px solid #444444;
}

table.jh1-table {
	width: 100%;
	border: 1px solid #444444;
	width: 100%;
	height: 300px;
}

td.jh1-table {
	padding: 20px;
}

.jh1-table td:first-child {
	width: 70%;
	border: 1px solid #444444;
}

.main_left_btn {
	width: 50%;
	float: left;
}

.main_right_btn {
	width: 50%;
	float: left;
}

table.productProfile {
	width: 100%;
	height: 200px;
	border: 1px solid #444444;
	text-align: center;
}

.productProfile th {
	border-bottom: 1px solid #444444;
}

.orderPage {
	border: 1px solid #444444;
}

.orderPageTitle {
	margin-top: 5px;
	margin: 10px;
}

.orderPageSub {
	margin-left: -10px;
	margin-right: 15px;
}

.table-left {
	border-right: 1px solid #444444;
}

h3 {
	color: #ffc107;
}
</style>
<body>
	<c:url value="/market/get" var="getMarketUrl">
		<c:param name="marketId" value="${market.marketId }"></c:param>
	</c:url>
	<!-- Spinner Start -->
	<div id="spinner"
		class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
		<div class="spinner-border text-primary"
			style="width: 3rem; height: 3rem;" role="status">
			<span class="sr-only">Loading...</span>
		</div>
	</div>
	<!-- Spinner End -->
	<!-- Page Header Start -->
	<!-- Page Header End -->
	<!-- Page content-->
	<div class="container">
		<div class="row">
		
			<div  style="margin:auto ;">
				<article>
					<section>
						<!-- 주문 상세정보 -->
						<h3 class="text">주문 상세정보</h3>
						<div class="orderPage">
							<div class="orderPageTitle d-flex justify-content-around">
								<div class="orderPageSub">
									<strong>주문일자 ｜ <strong>${opd.inserted }</strong></strong>
								</div>
								<div class="orderPageSub">
									주문번호 ｜ <strong>2022062359064601 </strong>
								</div>
								<div class="orderPageButton ">
									<a href="${getMarketUrl }"><button type="button" class="btn btn-warning">재구매</button></a>
								</div>
							</div>
						</div>
					</section>
					<br />
					<section>
						<!-- 상품 정보 -->
						<table class="productProfile">
							<thead>
								<tr>
									<th scope="col">상품번호</th>
									<th scope="col">상품정보</th>
									<th class="table-left" scope="col">가격(수량)</th>
									<th class="table-left" scope="col">배송비</th>
									<th scope="col">판매자</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td style="width: 200px; font-size: 12px">2022062359064601</td>
									<td><img class="mainImg" width="180px" height="auto"
										src="${imageUrl }/market/${market.marketId }/${market.thumbNailImage}"
										alt="" /></td>
									<td class="table-left">${opd.finalPayment}
										<p>(${opd.amount})개</p>
									</td>

									<td class="table-left">무료</td>
									<td class="table-left">꿀비</td>

								</tr>
							</tbody>
						</table>
					</section>
					<br /> <br />
					<section>
						<!-- 구매/거래 정보 -->
						<h3>주문/결제 금액 정보</h3>
						<table class="productProfile">
							<thead>
								<tr>
									<th scope="col">최초 주문금액</th>
									<th scope="col">포인트 적립</th>
									<th class="table-left" scope="col">주문금액</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<div class="main_left_btn">
											<div>상품금액:</div>
											<div>배송비:</div>
											<div>포인트 할인:</div>
										</div>
										<div class="main_right_btn">
											<div>50000원</div>
											<div>무료</div>
											<div>꿀비</div>
										</div>
									</td>
									<td style="border: 1px solid #444444; width: 180px">구매적립
										｜포인트</td>
									<td class="table-left" style="width: 160px">${opd.finalPayment}원</td>
								</tr>
							</tbody>
						</table>
					</section>
					<br /> <br />
					<section>
						<div>
							<!-- 배송지 정보-->
							<h3>배송지 정보</h3>
							<table class="jh-table">
								<tr>
									<td style="text-align: center;">수령인</td>
									<td>Ipsum</td>
									<td style="text-align: center;">주문자 정보</td>
								</tr>
								<tr>
									<td style="vertical-align: top; text-align: center;">연락처</td>
									<td style="vertical-align: top;">Lorem Ipsum Dolor Lorem
										Ipsum Dolor</td>
									<td rowspan="3">
										<p style="text-align: center;">이름</p>
										<p style="text-align: center;">휴대폰번호</p>
										<p style="text-align: center;">이메일</p>

									</td>
								</tr>
								<tr style="height: 90px;">
									<td style="vertical-align: top; text-align: center;">배송지</td>
									<td style="vertical-align: top;">Lorem Ipsum Dolor Lorem
										Ipsum Dolor</td>

								</tr>
								<tr>
									<td style="text-align: center;">배송메모</td>
									<td>Lorem Ipsum Dolor Lorem Ipsum Dolor</td>

								</tr>
							</table>
						</div>
					</section>
				</article>
			</div>
		</div>
		<!-- Back to Top -->
		<a href="#"
			class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i
			class="bi bi-arrow-up"></i></a>
		<!-- JavaScript Libraries -->
		<!--Jquery -->
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
			referrerpolicy="no-referrer"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
		<script src="${appRoot }/resources/webContents/lib/wow/wow.min.js"></script>
		<script
			src="${appRoot }/resources/webContents/lib/easing/easing.min.js"></script>
		<script
			src="${appRoot }/resources/webContents/lib/waypoints/waypoints.min.js"></script>
		<script
			src="${appRoot }/resources/webContents/lib/counterup/counterup.min.js"></script>
		<script
			src="${appRoot }/resources/webContents/lib/owlcarousel/owl.carousel.min.js"></script>
		<script
			src="${appRoot }/resources/webContents/lib/isotope/isotope.pkgd.min.js"></script>
		<script
			src="${appRoot }/resources/webContents/lib/lightbox/js/lightbox.min.js"></script>
		<!-- Template Javascript -->
		<script src="${appRoot }/resources/webContents/js/main.js"></script>
		<script>
			$(document).ready(function() {
				/*버튼 */

			});
		</script>
</body>
</html>