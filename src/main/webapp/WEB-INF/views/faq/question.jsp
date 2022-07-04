<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/4.2.0/css/ionicons.min.css"
	integrity="sha256-F3Xeb7IIFr1QsWD113kV2JXaEbjhsfpgrKkwZFGIA4E="
	crossorigin="anonymous" />
<!-- Template Stylesheet -->
<link href="${appRoot }/resources/webContents/css/example1.css"
	rel="stylesheet">
<!-- question css 가져오는건데  -->
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
<script>
	$(documnet).ready(function() {
		$("#question").on("click", "", function() {
			alert("success");
		});
	});
</script>
</head>
<style>
h1 {
	color: #ffc107;
}

h2 {
	color: #ffc107;
}
</style>
<body>
	<my:navbar></my:navbar>
	<my:faq1tag></my:faq1tag>
	<div class="container">
		<!-- Row -->
		<div class="row">
			<my:faq></my:faq>
			<div class="col-8 mt-3 ms-5">
				<h1>고객 센터</h1>
				
				<!-- /Row -->
				<div class="my-4">
					<ul class="nav nav-tabs nav-fill justify-content-center ">
						<li class="nav-item">
							<button class="flex-sm-fill text-sm-center nav-link active"
								id="mainContentNav" aria-current="page">Donation FAQ</button>
						</li>
						<li class="nav-item">
							<button class="flex-sm-fill text-sm-center nav-link"
								id="cancleAndRefundNav">Market FAQ</button>
						</li>
					</ul>
				</div>
				
				
				
				<!-- 기부 관련-->
				<section class="mb-5" id="mainContentContainer">
					<h2 class="fw-bolder mb-4 mt-5">자주 묻는 질문</h2>
					<div class="accordion" id="accordionExample">
						<div class="accordion-item">
							<h2 class="accordion-header" id="headingOne">
								<button class="accordion-button" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseOne"
									aria-expanded="true" aria-controls="collapseOne">꿀비는
									어떤 사이트 인가요?</button>
							</h2>
							<div id="collapseOne" class="accordion-collapse collapse show"
								aria-labelledby="headingOne" data-bs-parent="#accordionExample">
								<div class="accordion-body">
									<strong>꿀비는 재능 거래 마켓</strong> 플랫폼으로서, 자신이 가지고 있는 재능을 판매할 수 있는
									사이트 입니다.
								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header" id="headingTwo">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseTwo"
									aria-expanded="false" aria-controls="collapseTwo">어떠한
									재능이여도 상관 없는건가요?</button>
							</h2>
							<div id="collapseTwo" class="accordion-collapse collapse"
								aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
								<div class="accordion-body">
									허니비는 자유롭게 자신의 재능을 판매할 수 있고, <strong>자신이 사소하다고 생각 하더라도</strong>
									자유롭게 판매할 수 있습니다.
								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header" id="headingThree">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseThree"
									aria-expanded="false" aria-controls="collapseThree">
									재능 거래는 어떻게 이루어 지나요?</button>
							</h2>
							<div id="collapseThree" class="accordion-collapse collapse"
								aria-labelledby="headingThree"
								data-bs-parent="#accordionExample">
								<div class="accordion-body">쇼핑몰과 같은 방식으로 진행됩니다.</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header" id="headingfour">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapsefour"
									aria-expanded="false" aria-controls="collapsefour">
									신고는 어떻게 할 수 있나요?</button>
							</h2>
							<div id="collapsefour" class="accordion-collapse collapse"
								aria-labelledby="headingfour" data-bs-parent="#accordionExample">
								<div class="accordion-body">직거래/추가결제요구, 연락두절등 판매가 원활하지 않는
									재능을 신고하게 되면 신고재능에 경고가 주어집니다. 재능넷 사이트 고객센터 > 1:1 문의하기로 신고사유와 함께
									자료를 보내주시면 확인하여 접수됩니다.</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header" id="headingfive">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapsefive"
									aria-expanded="false" aria-controls="collapsefive">
									메인페이지의 게이지 무엇인가요?</button>
							</h2>
							<div id="collapsefive" class="accordion-collapse collapse"
								aria-labelledby="headingfive" data-bs-parent="#accordionExample">
								<div class="accordion-body">메인페이지에 있는 게이지는 기부 게이지며 일정금액이
									달성될 경우 기부하게 됩니다.</div>
							</div>
						</div>

					</div>
				</section>
				</article>





				<!-- 마켓 -->
				<section class="mb-5 d-none" id="cancleAndRefundConatiner">
					<h2 class="fw-bolder mb-4 mt-5">자주 묻는 질문</h2>
					<div class="accordion" id="accordionExample1">
						<div class="accordion-item">
							<h2 class="accordion-header" id="headingOne">
								<button class="accordion-button" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseOne"
									aria-expanded="true" aria-controls="collapseOne">꿀비
									마켓은 무엇인가요?</button>
							</h2>
							<div id="collapseOne" class="accordion-collapse collapse show"
								aria-labelledby="headingOne" data-bs-parent="#accordionExample">
								<div class="accordion-body">
									<strong>꿀비 사이트의 마켓</strong> 플랫폼으로서, 각종 사이트의 상품을 판매합니다.
								</div>
							</div>
						</div>
						<div class="accordion" id="accordionExample1">
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingTwo">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseTwo"
										aria-expanded="false" aria-controls="collapseTwo">
										상품의 판매금은 어디에 사용되나요?</button>
								</h2>
								<div id="collapseTwo" class="accordion-collapse collapse"
									aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										판매된 금액은 사이트의 운영 및 여러가지에 이용되며, <strong>일정 금액은 기부</strong> 됩니다.
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingThree">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseThree"
										aria-expanded="false" aria-controls="collapseThree">
										환불은 어떻게 가능한가요?</button>
								</h2>
								<div id="collapseThree" class="accordion-collapse collapse"
									aria-labelledby="headingThree"
									data-bs-parent="#accordionExample">
									<div class="accordion-body">아직 환불절차는 미완성이기 때문에 1대1 문의를
										사용해 주시길 바랍니다.</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingfour">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapsefour"
										aria-expanded="false" aria-controls="collapsefour">
										배송지가 변경되었어요.</button>
								</h2>
								<div id="collapsefour" class="accordion-collapse collapse"
									aria-labelledby="headingfour"
									data-bs-parent="#accordionExample">
									<div class="accordion-body">
										아직 배송지 변경 기능을 구현하지 않았기 때문에 혹시 변경요청이 있을 경우 아래의 번호로 전화해주시길 바랍니다.
										<br />
										honey 서비스 <strong>010-xxxx-xxxx</strong>

									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingfive">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapsefive"
										aria-expanded="false" aria-controls="collapsefive">
										해외에서 주문할 수 있나요?</button>
								</h2>
								<div id="collapsefive" class="accordion-collapse collapse"
									aria-labelledby="headingfive"
									data-bs-parent="#accordionExample">
									<div class="accordion-body">해외 주문도 가능 합니다만, 기간이 좀 더 소요될 수
										있습니다.</div>
								</div>
							</div>

						</div>
				</section>

				<!-- 댓글-->




			</div>



		</div>
	</div>
	</div>



	<!-- foot bar -->







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
			/* 고객 관련 */
			$("#mainContentNav").click(function() {
				$('#mainContentNav').addClass('active');
				$("#cancleAndRefundNav").removeClass("active");

				$('#mainContentContainer').removeClass("d-none");
				$("#cancleAndRefundConatiner").addClass("d-none");

			});
			/* 마켓관련 */
			$("#cancleAndRefundNav").click(function() {
				$('#cancleAndRefundNav').addClass('active');
				$("#mainContentNav").removeClass("active");

				$('#cancleAndRefundConatiner').removeClass("d-none");
				$("#mainContentContainer").addClass("d-none");

			});

		});
	</script>

	<my:footbar></my:footbar>
</body>
</html>