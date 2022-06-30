<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>기부 게시판</title>

<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

 <!--font-awesome  -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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

<!-- Jquery -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	referrerpolicy="no-referrer"></script>

</head>
<style>

/* 게시글 폼 */
#wrap_cnt_prom {
	padding-top: 0px;
	margin-bottom: 100px;
}

#wrap_cnt_prom #body_cont {
	position: relative;
}

#wrap_cnt_prom #body_cont .cont_box {
	width: 700px;
	margin: 0 auto;
}

#wrap_cnt_prom #body_cont .cont_box .img_ico {
	display: block;
	width: 50px;
	height: 50px;
	margin: auto;
}

#wrap_cnt_prom #body_cont .cont_box .img_ico img {
	object-fit: cover;
	width: 100%;
}

#wrap_cnt_prom #body_cont .cont_box .img_main {
	display: block;
	width: 800px;
	height: 400px;
	margin: auto;
}

#wrap_cnt_prom #body_cont .cont_box .img_main img {
	object-fit: cover;
	width: 100%;
}

#wrap_cnt_prom #body_cont .cont_box .tit_head {
	display: block;
	font-weight: 400;
	font-size: 35px;
	font-family: KakaoBold;
	color: #444;
	margin: 30px auto 30px;
	text-align: center;
}

#wrap_cnt_prom #body_cont .cont_box .txt_body {
	display: block;
	margin: 15px auto;
	font-size: 17px;
	line-height: 30px;
	color: #444;
	white-space: pre-line;
	word-break: break-all;
	font-family: KakaoLight;
	line-height: 1.5;
	letter-spacing: -.5px;
	text-align: center;
}

#wrap_cnt_prom #body_cont .cont_box .img_body {
	display: block;
	height: 394px;
	background-repeat: no-repeat;
	background-position: 50% 50%;
	background-size: cover;
	margin: 30px auto;
}


/* 후기 바 */
.fund_float {
	z-index: 100;
	position: fixed;
	display: block;
	left: 50%;
	bottom: 10px;
	width: 700px;
	height: 60px;
	margin-left: -350px;
	background: none;
}

.fund_float .btn_c {
	float: left;
	overflow: hidden;
	position: relative;
	width: 25%;
	height: 60px;
	line-height: 60px;
	background: #434343;
	border-radius: 7px 0 0 7px;
	cursor: pointer;
}

.fund_float .btn_c .ico_cheer {
	display: inline-block;
	width: 22px;
	height: 20px;
	margin: 7px 4px 0 38px;
	float: left;
}

.fund_float .btn_c .ico_cheer img {
	width: 100%;
}

.fund_float .btn_c .txt_cheer {
	display: inline-block;
	margin-left: 7px;
	font-size: 20px;
	color: #fff;
	vertical-align: top;
	float: left;
}

.fund_float .btn_c .num_active {
	margin-left: 10px;
	display: inline-block;
	font-size: 16px;
	color: #d9d9d9;
	margin-top: 0px;
}

.fund_float .btn_c .after {
	position: absolute;
	top: 10px;
	right: 0px;
	width: 1px;
	height: 35px;
	background-color: #555;
}

.fund_float .btn_s {
	float: left;
	overflow: hidden;
	position: relative;
	width: 25%;
	height: 60px;
	line-height: 60px;
	background: #434343;
	cursor: pointer;
}

.fund_float .btn_s .ico_share {
	display: inline-block;
	width: 22px;
	height: 20px;
	margin: 5px 4px 0 50px;
	float: left;
}

.fund_float .btn_s .ico_share img {
	width: 100%;
}

.fund_float .btn_s .txt_share {
	display: inline-block;
	margin-left: 7px;
	font-size: 20px;
	color: #fff;
	vertical-align: top;
	float: left;
}

.fund_float .btn_d {
	float: left;
	overflow: hidden;
	position: relative;
	width: 50%;
	height: 60px;
	line-height: 60px;
	background: #ffc107;
	border-radius: 0 7px 7px 0;
	cursor: pointer;
	text-align: center;
}

.fund_float .btn_d span {
	display: inline-block;
	font-size: 20px;
	color: #fff;
	vertical-align: top;
}

/* 메인 사진 */
.page-header-main {
    background: linear-gradient(rgba(0, 0, 0, .1), rgba(0, 0, 0, .1)), url(https://bucket0207-spring0520-teacher-test.s3.ap-northeast-2.amazonaws.com/donation/${board.folderName }/${board.MPhoto}) center center no-repeat;
    background-size: cover;
    margin-top : 75px;
    opacity: 0.85;
}
.display-3{
	font-size: 40px;
}
.pageHeader{
	text-align: center;
    vertical-align: middle;
}
.backCircleImg{
	width : 70px;
	height : 70px;
	background-color: #444;
	border-radius: 100px;
	margin-top : 40px;
	display: flex;
	align-items: center;
    justify-content: center;
    
}
.headerTopImg{
	width: auto;
	height: auto;
	text-align: center;
	display: flex;
	justify-content: center;
	
}
.headerImg{
	width: 30px;
	height: 30px;
	text-align: center;
}
.donationWord{
	font-family:"Roboto",sans-serif;
    font-weight: 700;
    line-height: 1.2;
    font-size:17px;
    margin-top : 20px;
    margin-left : 3px;
    color: #1A2A36;
}

/* 대댓글 토글버튼 */

.mondy-wide{
 width: 100px;
}
.replyContent{
	background-color: white;
	border-radius: 10px;
	padding : 10px;
	width: 585px;
}

.dropbtn {
  color: black;
  padding: 3px;
  font-size: 20px;
  border: none;
  cursor: pointer;
  display: flex;
  margin-left: 428px;
}
.dropdown {
  position: relative;
  display: inline-block;
}
.dropdown-content {
  display: none;
  position: absolute;
  right: 0;
  background-color: #f9f9f9;
  min-width: 100px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
  text-align: center;
}
.dropdown-content a {
  color: black;
  padding: 12px 12px;
  text-decoration: none;
  display: block;
}
.dropdown-content a:hover {background-color: #f1f1f1;}
.dropdown:hover .dropdown-content {display: block;}
.dropdown:hover .dropbtn {background-color: #9B9B9B;}


</style>
<body>
	<!-- Spinner Start -->
	<div id="spinner"
		class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
		<div class="spinner-border text-primary"
			style="width: 3rem; height: 3rem;" role="status">
			<span class="sr-only">Loading...</span>
		</div>
	</div>
	<!-- Spinner End -->



	<!-- Nav bar  -->
	<nav:navbar></nav:navbar>


<%-- 	<!-- Page Header Start -->
	<div class="container-fluid page-header py-5 mb-5">
		<div class="container py-5">
			<h1 class="display-3 text-white mb-3 animated slideInDown">기부 게시판</h1>
			<nav aria-label="breadcrumb animated slideInDown"></nav>
		</div>
	</div>
	<!-- Page Header End --> --%>
	
	
	<!-- Page Header Start -->
	<div class="container-fluid page-header-main">
		<div class="container py-5 pageHeader">
			<h3 class="display-3 text-white mt-5 mb-3 animated slideInDown">${board.title }</h3>
			<span class="txt_body" style="font-weight: bold; color: #fff; opacity: 0.75;">by ${board.nickname }</span>
            <div class="headerTopImg">
            	<div class="backCircleImg">
            		<img class="headerImg" src="${appRoot}/resources/webContents/img/donation_${board.topic }.png">
            	</div>
            </div>
			<nav aria-label="breadcrumb animated slideInDown"></nav>
		</div>
	</div>
	
	<!-- Page content-->
	<div id="wrap_cnt_prom">
		<!-- Body Content -->
		<div id="body_cont">
			<div class="cont_box">
				<%-- <!-- 대표 이미지-->
				<c:if test="${empty board.MPhoto }">
					<figure class="img_ico mb-4">
						<img class="img-fluid rounded" src="https://dummyimage.com/900x400/ced4da/6c757d.jpg" alt="..." />
					</figure>
				</c:if>
				<c:if test="${not empty board.MPhoto }">
					<figure class="mb-4">
						<img class="img-fluid" src="https://bucket0207-spring0520-teacher-test.s3.ap-northeast-2.amazonaws.com/donation/${board.folderName }/${board.MPhoto}" alt="">
					</figure>
				</c:if> --%>
				<!-- <span class="img_ico"><img src=""></span> -->
				<span class="txt_body">${board.content }</span>

					
				<!-- 해쉬 태그 -->
				<div class="d-flex justify-content-center">
				<c:forEach items="${board.hashTag }" var="hashTag">
					<a class="mx-2 mb-3"href="${appRoot}/donation/tags/${hashTag}">
						<span class="badge rounded-pill bg-warning text-dark"># ${hashTag }</span>
					</a>
				</c:forEach>
				</div>
				
				<p class="mb-4"></p>
				<div class="d-flex justify-content-center">
					<h1 style="color: orange;">${board.currentAmountMakedDecimalFormat}</h1>
					<div class="donationWord" style="color: orange;">원</div>
				</div>
				<h5 class="donationWord d-flex justify-content-center" style="margin-top:5px">${board.goalMakedDecimalFormat}원 목표</h5>
				<div class="progress mb-2">
					<div class="progress-bar bg-warning" role="progressbar"
						style="width: ${board.achievementRate}%" aria-valuenow="${board.achievementRate}" aria-valuemin="0"
						aria-valuemax="100"></div>
				</div>

				<p>모금기간 : ${board.inserted} ~ ${board.expired}</p>
				
				<hr class="mt-5 mb-4" />
				
				<!-- 댓글 내용-->
				<section class="mt-5 mb-5">
					<div class="card bg-light">
						<div class="card-body">
							<!-- 댓글 등록-->
							<div class="d-flex mb-4">
								<div class="flex-shrink-0">
									<img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
								</div>
								<form class="ms-3" action="${appRoot }/donation/reply/add" method="POST">
									<input type="hidden" name="donationId"
										value="${board.donationId }" />
									<textarea class="form-control loginConfirm" rows="0" cols="80"
										name="content" placeholder="댓글만 써도 큰 힘이 됩니다. 같이 응원해요♥"></textarea>
									<button class="rounded loginConfirm">등록</button>
								</form>
							</div>
							<hr />
							<!-- 댓글 출력-->
							<container id="replyList"> </container>

						</div>
					</div>
				</section>
			</div>
			
		</div>
	</div>

	<div class="container mt-5" id="wrap_cnt_prom">
		<div class="row">
			<!-- 응원하기 하단바 -->
			<div class="fund_float loginConfirm">
				<a class="btn_c heart"> 
					<span class="ico_cheer">
						<img id="heart" src="${appRoot }/resources/heart.png" />
					</span> 
					<span class="txt_cheer">응원</span>
					<span class="num_active" id="countHeart">${count }</span>
					<div class="after"></div>
				</a> 
				<a class="btn_s" onclick="share()"> <span class="ico_share">
					<img src=""></span> 
					<span class="txt_share" data-bs-toggle="modal">공유</span>
				</a> 
				<a class="btn_d" data-bs-toggle="modal" data-bs-target="#modal1">
					<span>기부하기</span>
				</a>
			</div>
			<!-- 응원하기 하단바 END-->
		</div>
	</div>

	<!--ajax로 로그인에 따라 버튼누를 권한 처리하기!  -->
	<div class="modal fade" id="modal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">기부금 결제</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="donationModalForm" method="post">
						<input type="hidden" name="donationId" value="${board.donationId }" /> 
						<input type="hidden" value="${member.id }" name="id" /> 
							<label for="" class="form-label">결제금액</label> 
						<input class="form-control" id="" type="text" name="amount" />
						<div class="mb-3">
							<label for="message-text" class="col-form-label">응원 남기기</label>
							<textarea class="form-control" id="message-text" name="content"></textarea>
						</div>
						<div class="modal-footer">
							<button id="modalDonationButton"  type="submit" class="btn btn-danger">결제하기</button>
						</div>
					</form>
				</div>
	
			</div>
		</div>
	</div>
	<!-- foot bar -->
	<nav:footbar></nav:footbar>

	<!-- JavaScript Libraries -->
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
    	$(document).ready(function(){
    		// 좋아요가 있는지 확인한 값을 heartVal에 저장
    		var heartVal = ${heart};
    		var count = ${count};

    		// heartVal이 1이면 좋아요가 이미 되있는것이므로 heart_full출력
    		if(heartVal > 0){
    	         console.log(heartVal);
    	         $("#heart").prop("src", '${appRoot }/resources/heart_full.png');
    		}else{
                console.log(heartVal);
                $("#heart").prop("src", '${appRoot }/resources/heart.png');
    		}
    		
    		// 좋아요 버튼을 클릭 시 실행되는 코드
    		$(".heart").click(function () {
			    $.ajax({
			    	url :'${appRoot}/favorite/click',
			        type :'POST',
			        data : {'donationId' : '${board.donationId}', 
			        		'memberId' : '${principal.name}',
			        		'type' : "D"},
			    	success : function(data){
			    		
			    		var countHeart = data.count;
			    		var result = data.exit;
			    		console.log("cH" + countHeart);
			    		console.log(result);
			    		$('#countHeart').text(countHeart);
			        	if(result == 1) {
			            	$('#heart').prop("src", '${appRoot }/resources/heart_full.png');
			        	} else {
		                	$('#heart').prop("src", '${appRoot }/resources/heart.png');
			        	}
		             }
			    });
	        });
    		
    		
    		/* 댓글목록 */
    		const replyList = function(){
    			const data = {donationId : ${board.donationId}};
    			
    			$.ajax({
    				
    				url :'${appRoot}/donation/reply/list',
    				type : 'POST',
    				data : data,
    				success : function(list){
    					const replyListElement = $('#replyList');
    	    			replyListElement.empty();
    	    			
 
    	    			$('#countHeart').text(count);
    	    			
    	    			for(let i = 0; i < list.length; i++){
    	    				
    	    				const replyElement = $("<div class='d-flex mb-4' />");
    	    				replyElement.html(`
    	    					<div class="flex-shrink-0">
									<div class="" >
									<!-- 프로필사진 -->
									<img class="rounded-circle"
										src="${appRoot}/resources/user_profile_kim.png"
										alt="..." />
									</div>
    	    					</div>
                                
                                <div class="" style="width : auto;">
									<div class="ms-3" id="">
										<div class="fw-bold">
											<span class="d-flex">
												<div class="me-2">\${list[i].nickname }</div> 
												<div class="mondy-wide"> \${list[i].amountMakedDecimalFormat } 원 </div>
												<div class="dropdown" >
												  <span class="dropbtn"><i class="fa-solid fa-ellipsis-vertical"></i></span>
												  <div class="dropdown-content">
												    <a href="#">수정</a>
												    <a href="#">삭제</a>
												  </div>
												</div>
											</span>
										</div>
									</div>
									<div class="ms-3 replyContent">\${list[i].content }</div>
									<span class="ms-3 my-0"style="font-weight: normal; font-size: 14px;">\${list[i].inserted }</span>
								</div>
                                    `);
    	    				
    	    				replyListElement.append(replyElement);
    	    				
        	    			 
    	    			} // for문 끝
    				} // success 끝
    			}); // ajax 끝
    		}// ready 끝
    		
    		replyList(); // 댓글 목록 리스트 함수 실행!
    		
    		// 기부 결제 버튼
    		$("#modalDonationButton").click(function(e) {
    			e.preventDefault();
    			
    			if (confirm("기부해주셔서 감사합니다. 좋은 곳에 사용하겠습니다.")) {
    				let form = $("#donationModalForm");
    				let actionAttr = "${appRoot}/donation/give";
    				form.attr("action", actionAttr);
    				
    				form.submit();
    			}
    			
    		});
    		
    		// 로그인 여부 확인
/*     		$('.loginConfirm').click(function(e){
    			e.preventDefault();
    			
    			$.ajax({
    				url : '${appRoot}/memberTemp/loginConfirm',
    				type : 'POST',
    				success : function(data){
    					if(data == 0){
    						//로그인 안한 상태
    						confirm("로그인을 해야 합니다.");
    	  
    					}else{
    						// 로그인 한 상태
    					}
    				}
    			})
    		}); */
    		
    		
    		
    	});
    	
    	
    	</script>
</body>

</html>