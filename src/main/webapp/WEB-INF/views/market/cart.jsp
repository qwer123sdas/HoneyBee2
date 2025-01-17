<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--font-awesome  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!--bootstrap  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css"
	integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!--Jquery -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	referrerpolicy="no-referrer"></script>
<!-- Bulma  -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
<title>Insert title here</title>
</head>
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
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- bootstrap - JS -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script>
	function execution_daum_address(){
 		console.log("동작");
	   new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            
	        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
 
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
 
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                 	// 추가해야할 코드
                    // 주소변수 문자열과 참고항목 문자열 합치기
                      addr += extraAddr;
                
                } else {
                	addr += ' ';
                }
 
             	// 제거해야할 코드
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $(".address1_input").val(data.zonecode);
                $(".address2_input").val(addr);				
                // 커서를 상세주소 필드로 이동한다.
                $(".address3_input").attr("readonly", false);
                $(".address3_input").focus();	 
	            
	            
	        }
	    }).open();  	
	
}
	</script>
<style>
.mainImg {
	display: block;
	width: 120px;
	height: 90px;
	border: 1px;
}

.cart {
	width: 80%;
	margin: auto;
	padding: 30px;
}

.cart ul {
	background-color: whitesmoke;
	padding: 30px;
	margin-bottom: 50px;
	border: whitesmoke solid 1px;
	border-radius: 5px;
	font-size: 13px;
	font-weight: 300;
}

.cart ul :first-child {
	color: #fbc02d;
}

table {
	border: 0;
	border-collapse: collapse;
	width: 100%;
	font-size: 14px;
}

thead {
	border-bottom: 1.5px solid lightgrey;
	font-weight: bold;
}

tbody {
	font-size: 16px;
}

th {
	padding: 15px 0px;
}

td {
	padding: 15px 0px;
}

.price {
	font-weight: bold;
}

.cart__bigorderbtn {
	width: 200px;
	height: 50px;
	font-size: 16px;
	margin: auto;
	border-radius: 5px;
}
/* .cart__bigorderbtn.left {
  background-color: white;
  border: 1px lightgray solid;
}
.cart__bigorderbtn.right {
  background-color: #fbc02d;
  color: white;
  border: none;
} */
.cart__bigorderbtn.middle {
	background-color: #fbc02d;
	color: white;
	border: none;
	width: 380px;
	height: 50px;
	margin-top: 3px;
}

.OrderInfo {
	padding: 24px;
}

.OrderHeadr {
	margin-top: 0px;
}

.OrderHeadr-Text {
	font-weight: bold;
	font-size: 24px;
}

.OrderTitle {
	font-size: 18px;
	font-weight: bold;
}

.Order-wrapper {
	margin-bottom: 38px;
}

.OrderSummary {
	padding: 32px 24px;
}

.OrderSummary-divider {
	border-bottom: 2px solid lightgrey;
	margin-bottom: 20px;
}

.Checkbox-text {
	font-size: 14px;
	font-weight: bold;
	margin-bottom: 10px;
}

.OrderSummary-price-wrapper {
	margin-bottom: 30px;
}

.btn_c {
	overflow: hidden;
	position: relative;
	width: 80px;
	height: 30px;
	line-height: 30px;
	border-radius: 7px 0 0 7px;
	cursor: pointer;
	margin: auto;
}

.btn_c .ico_button {
	display: inline-block;
	width: 18px;
	height: 18px;
	margin: 0px;
	color: #fbc02d;
}

.btn_c .ico_button img {
	width: 100%;
}

.container2 {
	position: relative;
	top: 30px;
}

.container3 {
	position: relative;
	top: 120px;
}

.modalPopArea {
	position: relative;
	height: 800px;
}

.modalPopContent {
	width: 100%;
	height: 100%;
}
</style>
<body>
	<my:mainNavBar></my:mainNavBar>
	<!-- Page content-->
	<div class="container container2">

		<div class="OrderHeadr">
			<h1 class="OrderHeadr-Text">결제하기</h1>
		</div>

		<div class="row">
			<!-- Blog entries-->
			<div class="col-lg-8">
				<!-- Featured blog post-->
				<div class="card mb-4">
					<section class="OrderInfo">
						<!-- 주문 INFO  -->
						<div>
							<h3 class="OrderTitle mb-4">주문 내역</h3>
							<div class="row Order-wrapper">
								<div class="col-2">
									<img class="mainImg" width="80px" height="auto"
										src="${imageUrl }/market/${market.marketId }/${market.thumbNailImage}"
										alt="" />
								</div>
								<div class="col-10">
									<h4>${market.title }</h4>

								</div>
							</div>
						</div>



						<!-- 주문 옵션 테이블 I-->
						<table class="cart__list">
							<colgroup>
								<col width="400px">
								<col width="104px">
								<col width="104px">
								<col width="128px">
							</colgroup>
							<thead>
								<tr>
									<th>기본항목</th>
									<th class="text-center">수량선택</th>
									<th class="text-center">환불가능기한</th>
									<th class="text-end">가격</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<div class="">
											<div>상품 이름 : ${market.title }</div>
										</div>
									</td>
									<td class="text-center">
										<div class="btn_c">
											<span class="ico_button" id="minusButton"> <i
												class="fa-solid fa-circle-minus"></i>
											</span> <span id="amount">1</span> <span class="ico_button"
												id="plusButton"> <i class="fa-solid fa-circle-plus"></i>
											</span>
										</div>
									</td>
									<td class="text-center">
										<div class="">7 일</div>
									</td>
									<td class="text-end">
										<div class="priceTotal">${market.price }</div>원
									</td>
								</tr>
							</tbody>
						</table>
					</section>

				</div>
			</div>


			<!-- Side widgets-->
			<div class="col-lg-4">
				<!-- Side widget-->
				<div class="card mb-4">

					<div class="OrderSummary">
						<h5
							class="OrderSummary-price-wrapper d-flex justify-content-between">
							<span>총 금액</span> <span class="priceTotal" id="priceTotal">${market.price }</span>원

						</h5>
						<h5
							class="OrderSummary-price-wrapper d-flex justify-content-between">
							<span class="me-auto">포인트 할인</span> <span class="me-1"
								id="pointTotal">0</span>원
						</h5>

						<div class="OrderSummary-divider"></div>

						<h5
							class="OrderSummary-price-wrapper d-flex justify-content-between">
							<span>총 결제 금액</span> <span id="finalPayment">${market.price }</span>원
						</h5>

						<div>
							<div>
								<label class="d-flex justify-content-start"> <input
									class="me-2" id="taxApplyCheckbox" type="checkbox"
									style="zoom: 1.5;">
									<div class="Checkbox-text">주문 내용을 확인하였으며, 결제에 동의합니다. (필수)</div>
								</label>
							</div>
						</div>
						<div class="d-flex cart__mainbtns">
							<button id="btn-kakaopay" data-bs-toggle="modal"
								data-bs-target="#modal1" class="cart__bigorderbtn middle">
								결제하기</button>
						</div>


					</div>
				</div>
			</div>


			<!-- 구매자 정보 -->
			<div class="col-lg-8">
				<!-- Featured blog post-->
				<div class="card mb-4"></div>
			</div>
			<!-- 포인트 사용 -->
			<div class="col-lg-8">
				<!-- Featured blog post-->
				<div class="card mb-4">

					<section class="OrderInfo">
						<!-- 주문 INFO  -->
						<div>
							<h3 class="OrderTitle mb-4">포인트 사용</h3>
							<div class="row">
								<div class="col-2">
									<h5>포인트</h5>
								</div>
								<div class="col-10">
									<div class="input-group mb-2" style="width: 400px">
										<input class="form-control" type="number" value=""
											id="usePoint" />
										<button class="btn btn-outline-dark" id="usePointButton">사용하기</button>
									</div>
									<p style="font-size: 13px;">꿀비 보유포인트 : ${memberPoint }</p>
								</div>
							</div>
						</div>
					</section>

				</div>
			</div>

			<div class="col-lg-8">
				<!-- Featured blog post-->
				<div class="card mb-4">
					<section class="OrderInfo">
						<h3>주문자 정보</h3>
						<table class="type05">
							<tr>
								<th scope="row">받으시는 분</th>
								<td><label class="form-label" for="input1"></label> <input
									class="form-control" type="text" id="orderName" /></td>
							</tr>
							<th>주소</th>
							<td><input size="50" class="address1_input" id="postCode"
								readonly="readonly"> <a class="address_search_btn"
								onclick="execution_daum_address()"
								style="background-color: #fbc02d; color: black; border: 1px solid #444444;">주소찾기</a><br>
								<input size="50" class="address2_input" id="address"
								readonly="readonly"><br> <input size="50"
								class="address3_input" id="detailAddress" readonly="readonly">
							</td>
							<tr>
								<th scope="row">휴대폰 번호</th>
								<td><label class="form-label" for="input1"></label> <input
									class="form-control" type="text" id="phone" required /> <br /></td>
							</tr>
							<tr>
								<th scope="row">요청사항</th>
								<td><label class="form-label" for="input1"></label> <input
									class="form-control" type="text" id="comment" required /> <br /></td>
							</tr>
						</table>
					</section>

				</div>
			</div>



		</div>
	</div>


	<section class="cart container3">
		<div class="cart__information">
			<ul>
				<li>장바구니 상품은 최대 30일간 저장됩니다.</li>
				<li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
				<li>오늘출발 상품은 판매자 설정 시점에 따라 오늘출발 여부가 변경될 수 있으니 주문 시 꼭 다시 확인해 주시기
					바랍니다.</li>
			</ul>
		</div>
	</section>

	<!-- 모달 -->

	<div class="modal fade " id="modal1" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modalPopArea">
					<iframe class="modalPopContent" src="" frameborder="0"
						scrolling="no" id="chat_iframe"></iframe>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<script>
    /* 최종 금액 */	
	let payment = function(){
        var finalPayment = $('#finalPayment').text();
        var priceTotal = $('#priceTotal').text();
        var point = document.getElementById('usePoint').value;
        console.log(finalPayment);
        console.log(priceTotal);
       // console.log(point);
       var result = (Number(priceTotal) - Number(point));
        $("#finalPayment").text(result);
    }
    
	/* 포인트 */
    /*버튼 누르면 포인트 적용*/
    $('#usePointButton').click(function(){
    	var point = document.getElementById('usePoint').value;
    	 document.getElementById('pointTotal').innerText = point;
    	 payment();
    })
    
    /*물품 수량 증감*/
		var sellPrice = ${market.price};
		var sum = sellPrice;

		$(document).ready(function() {
			$('#plusButton').click(function() {
				var amount = Number($('#amount').text());
				var plusAmount = amount + 1;
				var priceTotal = sellPrice * plusAmount;

				if (amount > 13) {
					$("#amount").text(amount);
				} else {
					$("#amount").text(plusAmount);
					$(".priceTotal").text(priceTotal);
				}
				payment();
			});

			$('#minusButton').click(function() {
				var amount = Number($('#amount').text());
				var minusAmount = amount - 1;
				var priceTotal = sellPrice * minusAmount;

				if (amount > 1) {
					$("#amount").text(minusAmount);
					$(".priceTotal").text(priceTotal);
				} else {
					$("#amount").text(amount);
				}
				payment();
			});
		});
		 /* 카카오 페이 ajax  */
	    let index = {
	    		init:function(){
	    	        $("#btn-kakaopay").on("click", ()=>{ 
	    	        	// function(){}를 사용안하고 , ()=>{}를 사용하는 이유는 this를 바인딩하기 위해서
	    	        	var x = document.getElementById('orderName').value;
	    	        	console.log(x);
	    				this.kakaopay();
	    			});
	    		},
	    	  // 카카오페이 결제
	    		kakaopay:function(){
	    			
	    			var data = {'productName':'${market.productName}',
	    					    'quantity':$('#amount').text(),
	    					    'totalAmount':Number($('#finalPayment').text()),
	    					    'orderName' :$('#orderName').val(),
	    					    'postCode':$('#postCode').val(),
	    					    'address' :$('#address').val(),
	    					    'detailAddress':$('#detailAddress').val(),
	    					    'phone' :$('#phone').val(),
	    					    'comment' :$('#comment').val(),
	    					    'point' : $('#pointTotal').text(),
	    					    'boardType' : 'M',
	    					    'productCode' :'${market.productCode}'
	    					  }
	    			//강사님 이걸 로그로 찍었을 때 값이나오게 하라는데
	    			//이거 어떻게 하나요?!@#!@#!$@#@!%$@
	    		    //SOS
	    		   	console.log(data)
	    			$.ajax({
	    				url:"${appRoot}/kakaopay",
	    				data: JSON.stringify(data),
	    				contentType : 'application/json',
	    				dataType:"text",
	    				type : "POST"
	    			}).done(function(resp){
	   					console.log("일단응답:", resp);
	    				if(resp.status === 500){
	    					alert("카카오페이결제를 실패하였습니다.")
	    				} else{
	    					console.log("성공>>????")
	    					 // alert(resp.tid); //결제 고유 번호
	    					 
	    					//window.open(box); // 새창 열기
	    					$("#chat_iframe").attr("src", resp);
	    					//location.href = resp;
	    				}
	    			
	    			}).fail(function(error){
	    				console.log("error2");
	    				alert(JSON.stringify(error));
	    			}); 
	    			
	    		},
	   	}
	    index.init();
	    
		
	</script>
	<nav:footbar_kim></nav:footbar_kim>
</body>
</html>