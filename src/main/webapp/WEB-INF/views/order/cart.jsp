<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--font-awesome  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!--bootstrap  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!--Jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
<!-- Bulma  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
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
<style>

.mainImg {
  display: block;
  width : 120px;
  height: 90px;
  border : 1px;
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
  border : 0;
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
th{
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
  width : 380px;
  height : 50px;
  margin-top : 3px;
}

.OrderInfo{
	padding : 24px;
}
.OrderHeadr{
	margin : 32px 0px;
}
.OrderHeadr-Text{
	font-weight: bold;
	font-size : 24px;
}
.OrderTitle{
	font-size: 18px;
    font-weight: bold;
}
.Order-wrapper{
	margin-bottom : 38px;
}

.OrderSummary{
	padding : 32px 24px;
}

.OrderSummary-divider{
	border-bottom : 2px solid lightgrey;
	margin-bottom : 20px; 
}

.Checkbox-text{
	font-size: 14px;
    font-weight: bold;
    margin-bottom : 10px;
}

.OrderSummary-price-wrapper{
	margin-bottom : 30px;
}


.btn_c {
	overflow: hidden;
	position: relative;
	width: 80px;
	height: 30px;
	line-height: 30px;
	border-radius: 7px 0 0 7px;
	cursor: pointer;
	margin : auto;
}

.btn_c .ico_button {
	display: inline-block;
	width: 18px;
	height: 18px;
	margin: 0px;
	color : #fbc02d;
}

.btn_c .ico_button img {
	width: 100%;
}

.container2{
	position: relative;
	top: 120px;
}
.container3{
	position: relative;
	top: 120px;
}


</style>
<body>
 	<!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg fixed-top py-lg-0 px-lg-5" style="background-color: #c49000;">
        <a href="index.html" class="navbar-brand ms-4 ms-lg-0">
            <h1 class="text-primary m-0">Baker</h1>
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        
    </nav>

    	
        <!-- Page content-->
        <div class="container container2">
        
			<div class="OrderHeadr">
	        	<h1 class="OrderHeadr-Text">결제하기</h2>
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
	                    				<img class="mainImg" width="80px" height="auto" src="https://bucket0207-spring0520-teacher-test.s3.ap-northeast-2.amazonaws.com/talent/${board.folderName }/${board.MPhoto}" alt="" />
	                    			</div>
	                    			<div class="col-10">
	                    				<h4>${board.title }</h4>
	                    				<div>
	                    					<span>${board.nickname }</span>
	                    				</div>
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
								    	<th class="text-center">작업기간</th>
								    	<th class="text-end">가격</th>
							    	</tr>
							    </thead>
							    <tbody>
							    	<tr>
							    		<td>
							    			<div class="">
							                    <div>상품 이름 : 최저 20,000계정 추출 광고노출 </div>
							                </div>
							    		</td>
							    		<td class="text-center">
							                <div class="btn_c">
							                    <span class="ico_button" id="minusButton">
							                       <i class="fa-solid fa-circle-minus"></i>
							                    </span>
							                    <span id="amount">1</span>
							                    <span class="ico_button" id="plusButton" >
							                       <i class="fa-solid fa-circle-plus"></i>
							                    </span>
							                </div>
							            </td>
							            <td class="text-center">
							            	<div class="">28 일</div>
							            </td>
							            <td class="text-end">
							           		<div class="priceTotal">${board.price }원</div>
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
                        	<h5 class="OrderSummary-price-wrapper d-flex justify-content-between">
				                <span>총 서비스 금액</span>
				                <span class="priceTotal">${board.price }원</span>
				                
				            </h5>
				            <h5 class="OrderSummary-price-wrapper d-flex justify-content-between">
					            <span >쿠폰 할인</span>
					            <span class="">0원</span>
					        </h5>
				            
				            <div class="OrderSummary-divider"></div>
                        	
		                    <h5 class="OrderSummary-price-wrapper d-flex justify-content-between">
					            <span>총 결제금액</span>
					            <span>28,000원</span>
					        </h5>
					        
				            <div>
				                <div>
				                    <label class="d-flex justify-content-start">
				                        <input class="me-2" id="taxApplyCheckbox" type="checkbox" style="zoom:1.5;">
				                        <div class="Checkbox-text">주문 내용을 확인하였으며, 결제에 동의합니다. (필수)</div>
				                    </label>
				                </div>
				            </div>
				            <div class="d-flex cart__mainbtns">
					            <button class="cart__bigorderbtn middle">결제하기</button>
					        </div>
					       <%--  <form action="${appRoot }/order/kakaoPay" method="Post"></form> --%>
							    <button id="btn-kakaopay" class="btn btn-primary">카카오페이로 결제하기</button>
							
				            
                        </div>
                    </div>
                </div>
                
                
                <!-- 포인트 사용 -->
                <div class="col-lg-8">
                    <!-- Featured blog post-->
                    <div class="card mb-4">
                    	<section class="OrderInfo">
	                    	<!-- 주문 INFO  -->
	                    	<div>
	                    		<h3 class="OrderTitle mb-4">포인트 사용</h3>
	                    		<div class="row mb-5">
	                    			<div class="col-2">
	                    				<h3>포인트</h3>
	                    			</div>
	                    			<div class="col-10">
										<input type="number" /> <button>전액사용</button>
	                    			</div>
	                    		</div>
	                    	</div>
	                    	
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
                <li>오늘출발 상품은 판매자 설정 시점에 따라 오늘출발 여부가 변경될 수 있으니 주문 시 꼭 다시 확인해 주시기 바랍니다.</li>
            </ul>
        </div>
    </section>
    
    <script>
    var sellPrice = ${board.price};
    var sum = sellPrice;
    
    $(document).ready(function(){
		$('#plusButton').click(function(){
			var amount = Number($('#amount').text());
			var plusAmount = amount + 1;
			var priceTotal = sellPrice * plusAmount;
			
			if(amount > 13){
				$("#amount").text(amount);
			}else{
				$("#amount").text(plusAmount);
				$(".priceTotal").text(priceTotal + '원');
			}
		});
		
		$('#minusButton').click(function(){
			var amount = Number($('#amount').text());
			var minusAmount = amount - 1;
			var priceTotal = sellPrice * minusAmount;
			
			if(amount > 1){
				$("#amount").text(minusAmount);
				$(".priceTotal").text(priceTotal + '원');
			}else{
				$("#amount").text(amount);
			}
		});
    });
    /*
    $(function(){
    	$('#btn-kakaopay').click(function(){
    		$.ajax({
    			url:'kakaopay',
    			dataType:'text',
    			success:function(data){
    				 // alert(resp.tid); //결제 고유 번호
    				var box = resp.next_redirect_pc_url;
    				//window.open(box); // 새창 열기
    				location.href = box;
    			},
    			error:function(error){
    				alert(error);
    			}
    		});
    	});
    });
    */
    /* 카카오 페이 ajax  */
    let index = {
    		init:function(){
    	        $("#btn-kakaopay").on("click", ()=>{ 
    	        	// function(){}를 사용안하고 , ()=>{}를 사용하는 이유는 this를 바인딩하기 위해서
    				this.kakaopay();
    			});
    		},

    	  // 카카오페이 결제
    		kakaopay:function(){
    			
    			$.ajax({
    				url:"${appRoot}/kakaopay?member_order_id${memberId}",
    				contentType : 'application/json;charset=utf-8',
    				dataType:"json",
    				type : "GET"
    			}).done(function(resp){
   					console.log("일단응답:", resp);
    				if(resp.status === 500){
    					alert("카카오페이결제를 실패하였습니다.")
    				} else{
    					console.log("성공>>????")
    					 // alert(resp.tid); //결제 고유 번호
    					var box = resp.next_redirect_pc_url;
    					//window.open(box); // 새창 열기
    					location.href = box;
    				}
    			
    			}).fail(function(error){
    				console.log("error2");
    				alert(JSON.stringify(error));
    			}); 
    			
    		},
    	}

    	index.init();

    </script>
</body>
</html>