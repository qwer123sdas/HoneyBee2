<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>재능 공유 게시판</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    
    <!--font-awesome  -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${appRoot }/resources/webContents/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${appRoot }/resources/webContents/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${appRoot }/resources/webContents/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${appRoot }/resources/webContents/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${appRoot }/resources/webContents/css/style.css" rel="stylesheet">
</head>
<style>
.page-header-main {
    background: linear-gradient(rgba(0, 0, 0, .1), rgba(0, 0, 0, .1)), url(/honeybee/resources/webContents/img/carousel-2.jpg) center center no-repeat;
    background-size: cover;
    margin-top : 75px;
}
.map_wrap {
	position: relative;
	width: 80%;
	height: 400px;
}
.buyButton{
	width : 100%;
}

.modal_body_head{
	margin-top : 10px;
	margin-bottom : 26px;
}

/* 별점 */
.star-text{
    margin-top : 10px;
    margin-left : 3px;
	font-size: 20px;
}
@charset "UTF-8";
:root {
  --star-size: 30px;
  --subStar-size: 17px;
  --star-color: #F6F7F8;
  --star-background: #fc0;
  --subStar-color: #fff;
  --subStar-background: #fc0;
}

.Stars {
  --percent: calc(var(--rating) / 5 * 100%);
  display: inline-block;
  font-size: var(--star-size);
  font-weight: bold;
  font-family: Times;
  line-height: 1;
  display: flex;
	justify-content: center; 
}
.Stars::before {
  content: "★★★★★";
  letter-spacing: 3px;
  background: linear-gradient(90deg, var(--star-background) var(--percent), var(--star-color) var(--percent));
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}
.totalStars {
  --percent: calc(var(--rating) / 5 * 100%);
  display: inline-block;
  font-size: var(--subStar-size);
  font-weight: bold;
  font-family: Times;
  line-height: 1;
}
.totalStars::before {
  content: "★★★★★";
  letter-spacing: 3px;
  background: linear-gradient(90deg, var(--subStar-background) var(--percent), var(--subStar-color) var(--percent));
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}
.subStars {
  --percent: calc(var(--rating) / 5 * 100%);
  display: inline-block;
  font-size: var(--subStar-size);
  font-weight: bold;
  font-family: Times;
  line-height: 1;
  display: flex;
	justify-content: center; 
}
.subStars::before {
  content: "★★★★★";
  letter-spacing: 3px;
  background: linear-gradient(90deg, var(--subStar-background) var(--percent), var(--subStar-color) var(--percent));
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}


textarea {
	width: 100%;
	height: 200px;
	padding: 10px;
	box-sizing: border-box;
	border: solid 2px #1E90FF;
	border-radius: 5px;
	font-size: 16px;
	resize: none;
}

</style>

<body>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->

	<!-- Nav bar  -->
	<nav:navbar></nav:navbar>
	<!-- Page Header Start -->
	<div class="container-fluid page-header-main py-5 mb-5">
		<div class="container py-5">
			<h1 class="display-3 text-white mb-3 animated slideInDown">재능 공유 게시판</h1>
			<nav aria-label="breadcrumb animated slideInDown"></nav>
		</div>
	</div>
	<!-- Page Header End -->
    <!-- Page content-->
    <div class="container mt-5">
        <div class="row">
            <div class="col-lg-7">
                <!-- Post content-->
                <article>
                    <!-- 메인사진-->
                   	<!-- 대표 이미지-->
					<c:if test="${empty board.MPhoto }">
						<figure class="img_ico mb-4">
							<img class="img-fluid rounded" src="https://dummyimage.com/900x400/ced4da/6c757d.jpg" alt="..." />
						</figure>
					</c:if>
					<c:if test="${not empty board.MPhoto }">
						<figure class="mb-4">
							<img class="img-fluid" src="https://bucket0207-spring0520-teacher-test.s3.ap-northeast-2.amazonaws.com/talent/${board.folderName }/${board.MPhoto}" alt="">
						</figure>
					</c:if>
					<!-- 별점 -->
		            <div class="Stars" style="--rating: 1.3;" aria-label="Rating of this product is 2.3 out of 5.">
		            	<div class="star-text">4.0 (몇개의 평가)</div>
		            </div>
                    <!-- 게시판 네비게이션 바 -->
                    <div class="my-4">
		                    <ul class="nav nav-tabs nav-fill justify-content-center ">
							  <li class="nav-item">
							    <button class="flex-sm-fill text-sm-center nav-link active" id="mainContentNav" aria-current="page">재능 소개</button>
							  </li>
							  <li class="nav-item">
							    <button class="flex-sm-fill text-sm-center nav-link" id="cancleAndRefundNav">취소 환불</button>
							  </li>
							  <li class="nav-item">
							    <button class="flex-sm-fill text-sm-center nav-link" id="replyNav">후기</button>
							  </li>
							</ul>
					</div>
                    <!-- 메인 컨텐츠-->
                    <section class="mb-5" id="mainContentContainer">
                    	<p class="fs-5 mb-4">${board.content }</p>
                        <p class="fs-5 mb-4">Science is an enterprise that should be cherished as an activity of the free human mind. Because it transforms who we are, how we live, and it gives us an understanding of our place in the universe.</p>
                        <p class="fs-5 mb-4">The universe is large and old, and the ingredients for life as we know it are everywhere, so there's no reason to think that Earth would be unique in that regard. Whether of not the life became intelligent is a different question, and we'll see if we find that.</p>
                        <p class="fs-5 mb-4">If you get asteroids about a kilometer in size, those are large enough and carry enough energy into our system to disrupt transportation, communication, the food chains, and that can be a really bad day on Earth.</p>
                        <h2 class="fw-bolder mb-4 mt-5">I have odd cosmic thoughts every day</h2>
                        <p class="fs-5 mb-4">For me, the most fascinating interface is Twitter. I have odd cosmic thoughts every day and I realized I could hold them to myself or share them with people who might be interested.</p>
                        <p class="fs-5 mb-4">Venus has a runaway greenhouse effect. I kind of want to know what happened there because we're twirling knobs here on Earth without knowing the consequences of it. Mars once had running water. It's bone dry today. Something bad happened there as well.</p>
                        	<c:if test="${not empty board.address }">
		                        <div class="map_wrap">
									<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
									<p>주소 : ${board.address }</p>							
								</div>
							</c:if>
	                        
                    </section>
                </article>
                
                <!-- 취소 환불 -->
                <section class="mb-5 d-none" id="cancleAndRefundConatiner">
                    <h2 class="fw-bolder mb-4 mt-5">취소 및 환불 규정</h2>
                    <p class="fs-5 mb-4">[환불 가이드라인]</p>
                    <p class="fs-5 mb-4">(1) 기획 단계에서 청약 철회: 총 결제 금액의 최대 80%까지 환불 가능</p>
                    <p class="fs-5 mb-4">(2) 작업 착수 후 청약 철회: 총 결제 금액의 최대 20%까지 환불 가능</p>
                    <p class="fs-5 mb-4">(3) 작업 50% 완료 후 청약 철회: 총 결제 금액의 최대 10%까지 환불 가능</p>
                    <p class="fs-5 mb-4">(4) 작업 100% 완료 후 청약 철회 : 환불 불가</p>
                    <p class="fs-5 mb-4"></p>
                </section>
                
                <!-- 댓글-->
                <section class="mb-5 d-none" id="replyContainer">
                    <div class="card bg-light">
                        <div class="card-body">
                            <!-- Comment form-->
                            <form class="mb-4">
                            	<div>                            	
                            		<div>후기 평가</div>
                            		<div>실제 꿀비를 이용한 구매자들이 남긴 평가입니다.</div>

                            		<span class="d-flex flex-row-reverse" data-bs-toggle="modal" data-bs-target="#modal1">나도 평점 주기</span>
                            	</div>
                            </form>
                            <hr />
                            <!-- Single comment-->
                            <container> 
                            	<div>
                            		<div class="d-flex justify-content-start">서비스 후기</div>
                            		<div class="d-flex justify-content-end">
                            			<div>최신순</div>
                            			<div>별점 높은 순</div>
                            			<div>별점 낮은 순</div>
                            		</div>
                            	</div>
                            	<div id="replyList"></div>
								<!-- 리뷰 출력-->
                            </container>
                            
                            
                            <!-- Comment with nested comments-->
                            <div class="d-flex mb-4">
                                <!-- Parent comment-->
                                <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                <div class="ms-3">
                                    <div class="fw-bold">Commenter Name</div>
                                    If you're going to lead a space frontier, it has to be government; it'll never be private enterprise. Because the space frontier is dangerous, and it's expensive, and it has unquantified risks.
                                    <!-- Child comment 1-->
                                    <div class="d-flex mt-4">
                                        <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                        <div class="ms-3">
                                            <div class="fw-bold">Commenter Name</div>
                                            And under those conditions, you cannot establish a capital-market evaluation of that enterprise. You can't get investors.
                                        </div>
                                    </div>
                                    <!-- Child comment 2-->
                                    <div class="d-flex mt-4">
                                        <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                        <div class="ms-3">
                                            <div class="fw-bold">Commenter Name</div>
                                            When you put money directly to a problem, it makes a good headline.
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 댓글 끝 -->
                        </div>
                    </div>
                </section>
                
                
            </div>
            
            
            <!-- Side widgets-->
            <div class="col-lg-4">
                <!-- Categories widget-->
                <div class="card border-0">
                    <div class="card-body">
                    	<div class="mx-3 mb-1">
                    		<!-- Post tag-->
                    		<div class="mb-3">
		                    	<span class="badge rounded-pill bg-warning text-dark ">찜하기</span>
	                    	</div>
	                    	<!-- Post title-->
                        	<h4 class="fw-bolder">${board.title }</h4>
							<h4 class="fw-bolder d-flex flex-row-reverse">${board.price } 원</h4>
                    	</div>
                    </div>
                </div>
                <!-- Side widget-->
                <div class="card border-1 mx-4 mb-4">
                	<div>
                		<div class="card-body pb-0">
                			<p>${board.productName }</p>
                			<p>작업 세부 내용</p>
                			<p>작업일이나 인원수</p>
                		</div>
                		<div class="card-body pt-1">
	                		<div class="d-grid gap-2">
								<form action="${appRoot }/order/cart/${board.talentId}" method="Get">
									<button type="submit" class="btn btn-warning buyButton" >구매하기</button>
								</form>
							</div>
						</div>
                	</div>
                </div>
                <!-- Side widget-->
                <div class="card border-1 mx-4 mb-4">
                	<div>
                		<div class="card-body pb-0">
                			<p>작성자 : ${board.nickname }</p>
                			<p>작성자 어필?</p>
                		</div>
                	</div>
                </div>
            </div>
        </div>
     </div>
     
     
	<!-- 모달 -->
	<div class="modal fade " id="modal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				 <div class="modal-header">
			        <h5 class="modal-title">내 평점 등록</h5>
			     </div>
				<div class="modal-body">
					<div class="modal_body_head">
						<h5 class="d-flex justify-content-center">${board.title }</h5>
						<div class="d-flex justify-content-center">
							<span class="ico_button" id="minusButton">
		                       <i class="fa-solid fa-circle-minus"></i>
		                    </span>
		                    <div>
								<i class="fa-regular fa-star" id="image1"></i>
								<i class="fa-regular fa-star" id="image2"></i>
								<i class="fa-regular fa-star" id="image3"></i>
								<i class="fa-regular fa-star" id="image4"></i>
								<i class="fa-regular fa-star" id="image5"></i>
							</div>
							<span class="ico_button" id="plusButton" >
		                       <i class="fa-solid fa-circle-plus"></i>
		                    </span>
						</div>
					</div>
					<hr />
					<textarea name="" id="content" cols="30" rows="10"></textarea>
				</div>
				
				<div class="modal-footer">
					<form action="" method="POST" id="talentReviewForm">
						<input type="hidden" id="reviewJson" name="reviewJson"/>
						<button type="button" class="btn btn-primary" id="submitReview">평점 작성하기</button>
					</form>
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


	<!-- foot bar -->
	<nav:footbar></nav:footbar>
    


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>
	<!--Jquery -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
                   <!-- 지도api -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=db07c80911dd129fb861fb567a80ab0c&libraries=services"></script>
                   <script>
           			var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            		mapOption = {
            			center : new daum.maps.LatLng(37.55324495357845, 126.97270338940449), // 지도의 중심좌표
            			level : ${board.mapLevel} // 지도의 확대 레벨
            		};

           		//지도를 미리 생성
           		var map = new daum.maps.Map(mapContainer, mapOption);
           		// 주소-좌표 변환 객체를 생성합니다
           		var geocoder = new kakao.maps.services.Geocoder();
           		// 행정도 주소로 좌표 검색
           		geocoder.addressSearch('${board.address}', function(results, status) {
           			if (status === daum.maps.services.Status.OK) {
						var result = results[0]; //첫번째 결과의 값을 활용
						// 해당 주소에 대한 좌표를 받아서
						var coords = new daum.maps.LatLng(result.y, result.x);
			
             			// 지도를 클릭한 위치에 표출할 마커입니다
             			var marker = new kakao.maps.Marker({ 
             				map: map,
                         	position: coords
             			}); 
             		
                     	// 인포윈도우로 장소에 대한 설명을 표시합니다
                     	var infowindow = new kakao.maps.InfoWindow({
                         	content: '<div style="width:150px;text-align:center;padding:6px 0;">꿀비 재능 공유</div>'
                     	});
                     	infowindow.open(map, marker);

                    	 // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                     	map.setCenter(coords);
			

           			}
           		})

           		// 지도에 마커를 표시합니다
           		marker.setMap(map);
                </script>

    <!-- JavaScript Libraries -->
    <!--Jquery -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
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
    <script>
	$(document).ready(function(){
		/* 메인 게시글 목록 보기 */
		$("#mainContentNav").click(function(){
			$('#mainContentNav').addClass('active');
			$("#cancleAndRefundNav").removeClass("active");
			$("#replyNav").removeClass("active");
			
			$('#mainContentContainer').removeClass("d-none");
			$("#cancleAndRefundConatiner").addClass("d-none");
			$("#replyContainer").addClass("d-none");
		});
		/* 취소 환불 목록 보기*/
		$("#cancleAndRefundNav").click(function(){
			$('#cancleAndRefundNav').addClass('active');
			$("#mainContentNav").removeClass("active");
			$("#replyNav").removeClass("active");
			
			$('#cancleAndRefundConatiner').removeClass("d-none");
			$("#mainContentContainer").addClass("d-none");
			$("#replyContainer").addClass("d-none");
		});
		/* 후기 목록 보기 */
		$("#replyNav").click(function(){
			$('#replyNav').addClass('active');
			$("#mainContentNav").removeClass("active");
			$("#cancleAndRefundNav").removeClass("active");
			
			$('#replyContainer').removeClass("d-none");
			$("#mainContentContainer").addClass("d-none");
			$("#cancleAndRefundConatiner").addClass("d-none");
		});
		
		
		/* 별점 주기 */
		var star = 0;
		$('#plusButton').click(function(){
			if(star < 5){
				star++;
				var image;
				var el;
				for(var i = 1 ; i <= star; i++){
					image = 'image' + i;
					el = document.getElementById(image);
					el.className = 'fa-solid fa-star';
					console.log(star);
					console.log(image);
				}
			}
			
		});
		$('#minusButton').click(function(){
			if(star >= 1){
				star--;
				var image;
				var el;
				for(var i = 5 ; i > star; i--){
					image = 'image' + i;
					el = document.getElementById(image);
					el.className = 'fa-regular fa-star';
					console.log(star);
					console.log(image);
				}
			}
		});
		/* 댓글 작성하기  */
		$("#submitReview").click(function(){
			if(confirm("작성하시겠습니까?")){
				var data={ 'starRating' : star,
						   'content' : document.getElementById("content").value,
						   'talentId' : ${board.talentId}
						}
				$('#reviewJson').val(JSON.stringify(data));
				let form1 = $("#talentReviewForm");
				let actionAttr = "${appRoot }/talent/review";
				form1.attr("action", actionAttr);
				
				form1.submit();
			}
		});
		
		/* 댓글 리스트 가져오기 */
		/* 댓글목록 */
		const reviewList = function(){
			const data = {talentId : ${board.talentId}};
			
			$.ajax({
				url :'${appRoot}/talent/reviewList',
				type : 'POST',
				data : data,
				success : function(list){
					const replyListElement = $('#replyList');
	    			replyListElement.empty();
	    			

	    			for(let i = 0; i < list.length; i++){
	    				const replyElement = $("<div class='d-flex mb-4' />");
	    				replyElement.html(`
	    					<div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                            <div class="ms-3">
                            	<div class="fw-bold" id="replyDiv">
                            	\${list[i].nickname }
                            	</div>
                            	
                            	<div class="subStars" style="--rating: 1.3;" aria-label="Rating of this product is 2.3 out of 5."></div>
                            		\${list[i].content}
                            	<div class="mt-3">\${list[i].inserted }</div>    
                            </div>
                                `);
	    				
	    				replyListElement.append(replyElement);
	    				
    	    			 
	    			} // for문 끝
				} // success 끝
			}); // ajax 끝
		}// ready 끝
		
		reviewList(); // 댓글 목록 리스트 함수 실행!
	});

</script>
</body>
</html>