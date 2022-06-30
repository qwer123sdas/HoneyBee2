<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>결제 목록</title>
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
	<!-- bootstrap - JS -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
	
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
.modalPopArea{
	position: relative; 
	height: 800px;
}
.modalPopContent{
	width : 100%;
	height : 100%;
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
							                    <div>상품 이름 : ${board.productName } </div>
							                    <c:forEach items="${classContentList }" var="classContent">
				                					<p class="ms-3 my-2"><i class="fa-solid fa-check me-2"></i>${classContent}</p>
				                				</c:forEach>
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
							            	<div class="">${board.workDate } 일</div>
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
                        	<h5 class="OrderSummary-price-wrapper d-flex" style="text-align: justify;">
				                <span class="me-auto">총 가격 금액</span>
				                <span class="priceTotal me-1" id="priceTotal">${board.price }</span> 원
				                
				            </h5>
				            <h5 class="OrderSummary-price-wrapper d-flex">
					            <span class="me-auto">포인트 할인</span>
					            <span class="me-1" id="pointTotal">0</span>원
					        </h5>
				            
				            <div class="OrderSummary-divider"></div>
                        	
		                    <h5 class="OrderSummary-price-wrapper d-flex">
					            <span class="me-auto">총 결제금액</span>
					            <span class="finalPayment me-1" id="finalPayment">${board.price } </span>원
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
					            <button id="btn-kakaopay" data-bs-toggle="modal" data-bs-target="#modal1"  class="cart__bigorderbtn middle">
						        </button>
					        </div>
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
	                    		<div class="row">
	                    			<div class="col-2">
	                    				<h5>포인트</h5>
	                    			</div>
	                    			<div class="col-10">
	                    				<div class="input-group mb-2" style="width: 400px">
											<input class="form-control" type="number" value="" id="usePoint"/> 
											<button class="btn btn-outline-dark" id="usePointButton">사용하기</button>
										</div>
										<p style="font-size: 13px;">꿀비 보유포인트 : ${memberPoint }</p>
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
                <li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
                <li>수업에 참여한 상품은 시작 시점에 따라 환불 여부가 변경될 수 있으니 주문 시 꼭 재능판매내용을 다시 확인해 주시기 바랍니다.</li>
            </ul>
        </div>
    <!-- Modal --></section>
    
    <!-- 모달 -->
	  
	<div class="modal fade " id="modal1" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				
				<div class="modalPopArea">
					<iframe class="modalPopContent" src="" frameborder="0" scrolling="no" id="chat_iframe"></iframe>
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
        console.log(point);
        var result = (Number(priceTotal) - Number(point));
        $("#finalPayment").text(result);
    }
    
    
    /* 판매 금액 */
    var sellPrice = ${board.price};
    
    /* 상품 갯수 선택 */
    $(document).ready(function(){
		$('#plusButton').click(function(){
			var amount = Number($('#amount').text());
			var plusAmount = amount + 1;
			var priceTotal = sellPrice * plusAmount;
			
			if(amount > 13){
				$("#amount").text(amount);
			}else{
				$("#amount").text(plusAmount);
				$(".priceTotal").text(priceTotal);
			}
			payment();
		});
		
		$('#minusButton').click(function(){
			var amount = Number($('#amount').text());
			var minusAmount = amount - 1;
			var priceTotal = sellPrice * minusAmount;
			
			if(amount > 1){
				$("#amount").text(minusAmount);
				$(".priceTotal").text(priceTotal);
			}else{
				$("#amount").text(amount);
			}
			payment();
		});
    });
    
    /* 포인트 */
    /*버튼 누르면 포인트 적용*/
    $('#usePointButton').click(function(){
    	var point = document.getElementById('usePoint').value;
    	 document.getElementById('pointTotal').innerText = point;
    	 payment();
    })
    /* 최대 포인트 사용 가능 금액 */
    var totalDiscount = Number(sellPrice) * 50 / 100; 
    console.log("최대 할인 " + totalDiscount);
    
    
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
    			var data = {'productName' : '${board.productName}',
    						'quantity' : $('#amount').text(),
    						'totalAmount' : Number($('#finalPayment').text()),
    						'point' : $('#pointTotal').text()
    					  }
    			payment();
    			$.ajax({
    				url:"${appRoot}/kakaopay",
    				data: data,
    				dataType:"text",
    				type : "GET"
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
</body>
</html>