<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Blog Post - Start Bootstrap Template</title>

<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap"
	  rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap"
	   rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
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
/* 
		body {
		  margin: 0;
		  font-size: var(--bs-body-font-size);
		  font-weight: var(--bs-body-font-weight);
		  line-height: var(--bs-body-line-height);
		  color: var(--bs-body-color);
		  text-align: var(--bs-body-text-align);
		  background-color: var(--bs-body-bg);
		  -webkit-text-size-adjust: 100%;
		  -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
		}
	    
 */
.container, .container-fluid, .container-xxl, .container-xl,
	.container-lg, .container-md, .container-sm {
	width: 100%;
	padding-right: var(- -bs-gutter-x, 0.75rem);
	padding-left: var(- -bs-gutter-x, 0.75rem);
	margin-right: auto;
	margin-left: auto;
}

.mt-5 {
	margin-top: 3rem !important;
}

.mb-4 {
	margin-bottom: 1.5rem !important;
}

.mb-5 {
	margin-bottom: 3rem !important;
}

.bg-light { -
	-bs-bg-opacity: 1;
	background-color: rgba(var(- -bs-light-rgb), var(- -bs-bg-opacity))
		!important;
}

.card-body {
	flex: 1 1 auto;
	padding: 1rem 1rem;
}

.input-group {
	position: relative;
	display: flex;
	flex-wrap: wrap;
	align-items: stretch;
	width: 100%;
}

.input-group-lg>.form-control, .input-group-lg>.form-select,
	.input-group-lg>.input-group-text, .input-group-lg>.btn {
	padding: 0.5rem 1rem;
	font-size: 1.25rem;
	border-radius: 0.3rem;
}

/* 대댓글 */
.replyForm {
	height: auto;
}

.d-flex {
	display: flex !important;
}

.flex-shrink-0 {
	flex-shrink: 0 !important;
}

.rounded-circle {
	border-radius: 50% !important;
}

.ms-3 {
	margin-left: 1rem !important;
}

.fw-bold {
	font-weight: 700 !important;
}

.card {
	box-sizing: content-box;
}

/* 게스트 모집 모달창 */
#insertGuestModal1.modal-overlay {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	display: none;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

#insertGuestModal1 .modal-window {
	background: #ffd54f;
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(13.5px);
	-webkit-backdrop-filter: blur(13.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	width: 500px;
	height: 330px;
	position: relative;
	top: -100px;
	padding: 10px;
}

#insertGuestModal1 .title hr {
	padding-left: 10px;
	display: block;
	text-shadow: 1px 1px 2px white;
	color: white;
	text-align: center;
	height: 5px;
}

#insertGuestModal1 .title h4 {
	display: block;
}

#insertGuestModal1 .content p li {
	margin-top: 20px;
	padding: 0px 10px;
	text-shadow: 1px 1px 2px gray;
	color: white;
	text-align: center;
}


/* 대댓글 토글버튼 */
.dropbtn {
	color: black;
	padding: 3px;
	font-size: 20px;
	border: none;
	cursor: pointer;
	display: flex;


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

/* 답글 입력창 슬라이드 */
#panel {
	display: none;
}
/* 댓글 수정 입력창*/
#replyUpdateContent {
	height: auto;
	word-break: keep-all; /* 단어 기준으로 줄바꿈 */
}


</style>


<!-- JavaScript Libraries -->
<!--Jquery -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	referrerpolicy="no-referrer"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<!-- jQuery Modal -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script src="${appRoot }/resources/webContents/lib/wow/wow.min.js"></script>
<script src="${appRoot }/resources/webContents/lib/easing/easing.min.js"></script>
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

</head>
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


	<!-- Page Header Start -->
	<div class="container-fluid page-header py-5 mb-5">
		<div class="container py-5">
			<h1 class="display-3 text-white mb-3 animated slideInDown">기부 모임</h1>
			<nav aria-label="breadcrumb animated slideInDown"></nav>
		</div>
	</div>
	<!-- Page Header End -->
	<!-- Page content-->
	<div class="container mt-4">
		<div class="row">
			<div class="col-lg-8">

				<!-- Post content Start -->
				<article>
					<!-- Post title Start -->
					<header class="mb-4">
						<!-- Post title-->
						<h1 class="fw-bolder mb-1">${meeting.title }</h1>
						<!-- Post meta content-->
						<div class="text-muted fst-italic mb-2">${meeting.startDate }
							~ ${meeting.endDate }</div>
						<!-- 해쉬 태그 -->
						<div class="">
							<c:forEach items="${meeting.hashTag }" var="hashTag">
								<a href="${appRoot}/meeting/tags/${hashTag}">
									<span class="badge rounded-pill bg-warning text-dark">#
										${hashTag }</span>
								</a>
							</c:forEach>
							<!-- 해쉬태그 -->
							<a class="badge bg-secondary text-decoration-none link-light"
								href="#!">${meeting.tag }</a>
							<p class="fs-5 mb-4">host by. ${meeting.memberId }</p>
						</div>
					</header>
					<!-- Post title End -->

					<!-- Preview image -->
					<figure class="mb-4">
						<img class="img-fluid rounded"
							src="${imageUrl }/meeting/${meeting.folderName}/${meeting.MPhoto}" alt="..." />
					</figure>
					<!-- 화면 분활용 네브탭 -->
					<ul class="nav nav-tabs nav-fill justify-content-center ">
					  <li class="nav-item">
					    <a class="nav-link flex-md-fill text-sm-center active" id="meetingMainContentNav" aria-current="page">모두의행동</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link flex-md-fill text-sm-center" id="meetingInfoNav">모임정보</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link flex-md-fill text-sm-center" id="meetingReplyNav">커뮤니티</a>
					  </li>
					</ul>
				
				</article>
				
					<!-- Post content-->
					<section class="mb-5 " id="meetingMainContent">
						<p class="fw-bolder fs-5 mb-4" style="margin-top: 30px;">${meeting.content }</p>
					</section>
					
					<section class="mb-5 d-none" id="meetingInfo" style="margin-top: 30px;" >
						<h4 class="fw-bolder border mb-2 mt-2 shadow-none 
									p-2 mb-2 bg-light rounded text-center" >*꿀비
							모임 장소 : ${meeting.address } ${meeting.detailAddress }</h4>
						<!-- 카카오 지도 api -->
						<div class="border mb-3 container shadow p-3 mb-3 bg-body rounded">
							<div id="map"
								style="width: 700 px; height: 700px; margin: auto; margin-top: 10px;"></div>
						</div>
					</section>

				<!-- 댓글, 대댓글 -->
				<section class="mb-5 replyForm d-none" id="meetingReply">
					<h4 style="margin-top: 30px;">커뮤니티</h4>
					<p>*모임에 대해 궁금한 사항이나 다양한 스토리를 나누고 싶다면 작성해주세요!</p>
					<div class="card bg-light">
						<div class="card-body">
							<!-- 댓글 입력 form 출력 ajax 처리-->
								<div class="input-group mb-4">
									<input type="hidden" name="meetingId" value="${meeting.meetingId }" />
									<input id="insertReplyParentsInput" class="form-control"
										type="text" name="content" placeholder="댓글을 작성하시려면 로그인 해주세요." />
									<button class="btn btn-primary" id="insertReplyParentsButton" > <!-- style="display: none" -->
										<i class="fa-solid fa-circle-check"></i>
									</button>

								</div>
								
							<!-- 댓글 대댓글 출력 ajax 처리 -->

							<div id="parentsReplyList" class="parentsReplyList"></div>
						</div>
					</div>
				</section>
			</div>

			<!-- 모임신청 진행 상태 -->
			<div class="col-lg-3 ms-4 ">
				<!-- Search widget-->
				<div class="guestWiget">
					<div class="guestWiget-header d-flex justify-content-center align-middle"
						style="margin-top: 180px;">
						<hr />
						<h4 style="margin-top: 15px;">
							<i class="fa-solid fa-address-card"></i>
							꿀비 모임
							<span id="numOfGuest"></span>
							명 등록
						</h4>
					</div>
					<hr />
					<div class="guestWigetBody">
						<div class="row">
							<div class="col">
								<!-- 게스트 목록 출력 -->
								<ul id="guestList" class="list-group list-group-flush">
									<!-- select 내용이 1개 뿐이다. -->
									<%--  <c:forEach items="${meetingGuest }" var="guest">
										  <li class="list-group-item d-flex justify-content-between">
										  	<i class="fa-solid fa-user-check"></i>${guest}
										  	<a class="small fw-medium" href="${appRoot }/meeting/board/deleteGuest">
										 	 <i id="deleteGuest" class="fa-solid fa-calendar-xmark">취소</i></a>
										  </li> 
									</c:forEach> 
									--%>
								</ul>
								<%-- 신청자만 신청완료 버튼 보임 
								<sec:authorize access="isAuthenticated()">
									<sec:authentication property="principal" var="principal"/>
										<c:if test="${principal.username == meeting.guest }" >
											<button type="button" id="insertGuestBtn1"
												class="btn btn-lg btn-primary mt-5 w-100">
											<i class="fa-solid fa-heart-circle-check"></i>
												신청했어요!
											</button>
										</c:if>
								</sec:authorize>
								--%>
								<c:if test="${not empty message }">
									<div class="alert alert-primary">${message }</div>
								</c:if>
								<button type="button" id="insertGuestBtn1"
									class="btn btn-lg btn-primary mt-5 w-100">
									<i class="fa-solid fa-heart-circle-check"></i>
									함께할께요!
								</button>
								
								<hr>
								
								<h5 style="text-align: center;">모두의행동 안내</h5>
								<ul class="meetingGuestInfo ">
									<li>주최자 : ${meeting.memberId }</li>
									<li>모임일시 : ${meeting.meetingDate }</li>
									<li>모임장소 : <br>
										${meeting.address }<br>${meeting.detailAddress }</li>
								</ul>
								
								<hr>
								
								<h5 style="text-align: center;">참여신청/취소 안내</h5>
								<ul class="guestInfo ">
									<li>모임의 신청/취소는<br/>참여신청 기간 내에만 가능합니다.</li>
									<li>모임 또는 그룹의 설정,<br/>모집정원 초과 여부에 따라<br/>대기자로 선정될 수 있습니다.</li>
									<li>꿀비는 참여신청 기능을 제공하는 회사로 모임개설자(주최측)이 아닙니다.</li>
									<li>모임 내용과 관련한 사항은<br/>모임 개설자에게 문의 바랍니다.</li>
								</ul>
								
								<hr>
								
								<!-- 게시글 수정버튼 추가 -->
								<%-- <c:if test="${meeting.own == 1 }">
				            	</c:if> --%>
						           <form action="${appRoot }/meeting/modify/${meeting.meetingId}" method="post">
						            	<input type="hidden" name="meetingId" value="meetingId" />
						            	<input type="hidden" name="memberId" value="memberId" />
										<button type="submit" id="modifyBtn1" class="btn btn-light mt-5 w-100" >
										 <i class="fa-solid fa-list-ul">모두의행동 수정</i>
										</button>
						            </form> 
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
		<!-- page contents end -->
	</div>

	<!-- foot bar -->
	<nav:footbar_kim></nav:footbar_kim>

<!-- 카카오지도 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=85d045c455e66b45c873d8a3ab36b2ed&libraries=services"></script>


<script>
$(document).ready(function() {

	/* 카카오 지도 api 시작 */
	var Container = document.getElementById('map'), // 지도를 표시할 div 
		Option = {
			center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level: 3 // 지도의 확대 레벨
		};  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(Container, Option); 
	console.log("111111111111111111111111111111111111")
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	console.log('${meeting.address}')
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${meeting.address}', function(result, status) {
		console.log("22222222222222222222222222222222222222")
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	    	 console.log("33333333333333333333333333333333333333")
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	        
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">꿀비모여!</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	}); /* 카카오 지도 api 끝남 */
	
	
	/* 메인 컨텐츠 */
	$("#meetingMainContentNav").click(function(){
		/* 네브바 이벤트*/
		$('#meetingMainContentNav').addClass('active');
		$("#meetingInfoNav").removeClass("active");
		$("#meetingReplyNav").removeClass("active");
		/* 아이디 이벤트*/
		$('#meetingMainContent').removeClass("d-none");
		$("#meetingInfo").addClass("d-none");
		$("#meetingReply").addClass("d-none");
	});
	
	/* 모임정보 */
	$("#meetingInfoNav").click(function(){
		/* 네브바 이벤트*/
		$('#meetingInfoNav').addClass('active');
		$("#meetingMainContentNav").removeClass("active");
		$("#meetingReplyNav").removeClass("active");
		/* 아이디 이벤트*/
		$('#meetingInfo').removeClass("d-none");
		$("#meetingMainContent").addClass("d-none");
		$("#meetingReply").addClass("d-none");
	});
	
	/* 대댓글 커뮤니티 */
	$("#meetingReplyNav").click(function(){
		/* 네브바 이벤트*/
		$('#meetingReplyNav').addClass('active');
		$("#meetingMainContentNav").removeClass("active");
		$("#meetingInfoNav").removeClass("active");
		
		$('#meetingReply').removeClass("d-none");
		$("#meetingMainContent").addClass("d-none");
		$("#meetingInfo").addClass("d-none");
	});
		 
	/* 게스트 입출력 부분 시작 */
	var modal = document.getElementById("insertGuestModal1");
	var btnModal = document.getElementById("insertGuestBtn1");
	
	 // 함께 할께요 버튼 누르면 모달창 뜸
	 btnModal.addEventListener("click", function(e) {
		 e.preventDefault();
		 e.stopPropagation();
		 modal.style.display = "flex";
		 fadeDuration: 500;
	 })
	 
	 // 취소 누르면 모달창 닫힘
	 const closeBtn = modal.querySelector(".btn.btn-secondary")
		closeBtn.addEventListener("click", function(e) {
			e.preventDefault();
		    modal.style.display = "none";
		});
	 
	 // 다른 창 눌러도 모달창 닫힘
	 modal.addEventListener("click", function(e) {
		 e.preventDefault();
		 const eventTarget = e.target;
		    if(eventTarget.classList.contains("modal-overlay")) {
		        modal.style.display = "none"
		    }
		})
		
	// 로그인 하지 않은 회원 댓글 입력시 로그인 창으로 이동
	$("#insertReplyPContentInput1").click(function(e) {
		e.preventDefault();
		if('${meeting.memberId}' == null) {
			$("#insertReplyPContentInput1").attr("disabled");
			alert("로그인 후 작성하세요") // 나중에 로그인창 경로로 이동해야함
			
		} 
	});
	

		
	// guestList 가져오는 ajax 요청
	const guestList = function() {
		 const data = {meetingId : '${meeting.meetingId}'};
		 console.log("111111111111111")
		 $.ajax({
			 
			 url : "${appRoot}/meeting/board/guest/list",
			 type : "get",
			 data : data,
			 success :function(list) {
				 console.log(list);
				 
				 const guestListElement = $("#guestList");
				 
				 // 초기화
				 guestListElement.empty();
				 
				 // 신청인원 표시
				 $("#numOfGuest").text(list.length);
				 
				 for (let i = 0; i < list.length; i++) {
					 const guestElement = $('<li class="list-group-item d-flex justify-content-between"/>')
					 guestElement.html(`
								 <i class="fa-solid fa-user-check"></i>\${list[i]}
								 	<a href="#" class="deleteGuest">
							  			<i class="fa-solid fa-calendar-xmark">취소</i></a>
							 `);
					 
					 guestListElement.append(guestElement);
				 } // for end
				 
				 // 모임 취소 누르면 submit
				 $(".deleteGuest").click(function(e) {
					 e.preventDefault();
					 console.log("여기까지");
					const data = {meetingId : '${meeting.meetingId}'}; //리스트의 벨류값으로 넣기 int 아님 
			
					$.ajax({ 
						url : "${appRoot}/meeting/board/guest/deleteGuest",
						type : "post",
						data : data,
						success : function(data) {
							alert("꿀비 모임을 취소하셨습니다.");
							console.log("취소 성공");
							guestList();
						},
						error :function() {
							console.log("취소 실패");
						}
					
					
				 	}); // ajax end 
				
				});
				 
			 }
			 
		 });
		 console.log("22222222222222222222")
		
	 }
	// 모임 신청버튼 누르면 submit
	$("#guestSubmitBtn1").click(function(e) {
		e.preventDefault();
		
		const data = {meetingId : '${meeting.meetingId}'};
		
		$.ajax({ 
			url : "${appRoot }/meeting/board/guest/addGuest",
			type : "post",
			data : data,
			success : function(data) {
				alert("꿀비 모임 신청 성공");
				console.log("신청성공");
				guestList();
				modal.style.display = "none";
				
				// $("#guestWiget").load("${appRoot }/meeting/board/addGuest #guestWiget");
			},
			error :function() {
				console.log("신청실패");
			}
			
			
		}); // ajax end
		
			
	});
	
	 // 게스트 리스트 가져오는 함수 실행
	 guestList();
	 /*
	 // 게스트 인원 다 차면 버튼 비활성화
	 let guestNum = ${meeting.guestNum};
	 let guestCnt = guestList.length;
	 // console.log(guestNum);
	 //console.log(guestCnt);
	 
	 ${"#insertGuestBtn1"}.click(function(e) {
		 e.preventDefault();
		 
		 if(guestNum == guestCnt) {
			 document.getElementById('insertGuestBtn1').attr('disabled');
			 
			 alert("꿀비 모임신청이 마감되었습니다.")
		 } 
	 });*/
	 
	 
	 /* 게스트 입출력 부분 끝남 */


				console.log("333333333333333333333")
				// 댓글 처리
				const parentsReplyList = function() {
					
					const data = {meetingId : '${meeting.meetingId}'};
					
					$.ajax({ // 댓글 출력
						url : "${appRoot}/meeting/reply/list",
						type : "get",
						data : data,
						success : function(list) {
							const replyListElement = $('#parentsReplyList');
							replyListElement.empty(); // 초기화
							
							// 댓글 갯수
							console.log("1111= "+list.length);
							
							for (let i = 0; i < list.length; i++) {
								const leftMargin = 40 * list[i].step + "px";
								
								// 댓글 삭제시 변경요소 컨텐츠따로 빼기
								let replyContent = `
									<div class="ms-3 replyContent\${list[i].meetingReplyId}">
									\${list[i].content }</div>
								`;
								
								// 댓글 삭제시 답글달기 비활성화
								let replyTextClassName="replyText";
								
								if (list[i].deleteInfo === "Y") {
									replyContent = `<div class="ms-3 replyContentDelete\${list[i].meetingReplyId}"><i class="fa-solid fa-circle-exclamation"></i>삭제된 댓글입니다!</div>`;
									// 댓글 삭제시 답글달기 비활성화
									replyTextClassName="";
								}			
								
								
								const replyElement = $(`<div class='d-flex mb-4 replyForm1\${list[i].meetingReplyId }' style='margin-left: \${leftMargin}'/>`);
								replyElement.html(`
									<div class="flex-shrink-0" >
										<!-- 프로필사진 -->
										<img class="rounded-circle"
											src="${appRoot}/resources/webContents/img/user_profile.png"
											alt="..." />
										<!-- 프로필사진 -->
									</div>
									<div id="replyForm" class="replyForm flex-fill">
										<div class="ms-3">
											<div class="fw-bold d-flex">
												<span class="me-auto">
													\${list[i].nickname }
													<span style="font-weight: normal; font-size: 14px;">
													\${list[i].inserted }</span>
												</span>
												<div class="dropdown moreReplySelect\${list[i].meetingReplyId}" >
												  <span class="dropbtn"><i class="fa-solid fa-ellipsis-vertical"></i></span>
												  <div class="dropdown-content" style="position: z-index: 2;">
												    <a href="#!" class="replyUpdate"><span>수정</span></a>
												    <a href="#!" class="replyDelete" 
												    	data-reply-id="\${list[i].meetingReplyId}" 
												    	data-reply-status="\${list[i].deleteInfo}"><span>삭제</span></a>
												    <a href="#!">신고</a>
												  </div>
												</div>
											</div>
										</div>
										
										\${replyContent}
										
										<div class="replyUpdateArea d-none" >
											<form class="replyUpdateAreaForm">
												<div class="input-group">
													<input type="hidden" name="meetingReplyId" value="\${list[i].meetingReplyId }" />
													<input type="hidden" name="meetingId" value="\${list[i].meetingId }" />
													<input class="form-control ms-3 replyUpdateContent" 
				      									type="text" name="content" placeholder="수정 내용을 입력하세요" />
				      								<span class="btn btn-primary replyUpdateButton"style="position: z-index: 1;">
						      							<i class="fa-solid fa-circle-check "></i>
						      						</span>
						      					</div>
					      					</form>
										</div>
										
										<div class="ms-3 replyTextContainer">
											<div class="fw-bold d-flex justify-content-between">
												<a class="small fw-medium" href="#!">
													<span id="flip" class="\${replyTextClassName}">답글 작성</span>
														<span class="replyCnt" style=""></span>
												</a>
												<a class="replyLike" href="#!">
													<i class="fa-regular fa-heart"></i>
													<em class="replyLikeCnt">0</em>
												</a>
											</div>
										</div>
										
										<div id="panel" class="childReplyArea">
											<form class="childReplyAreaForm">  
												<div class="input-group">
			      									<input type="hidden" name="meetingReplyId" value="\${list[i].meetingReplyId }" />
			      									<input type="hidden" name="refNum" value="\${list[i].refNum }" />
			      									<input type="hidden" name="refOrder" value="\${list[i].refOrder }" />
			      									<input type="hidden" name="meetingId" value="\${list[i].meetingId }" />
				      								<input id="insertReplyChildInput" class="form-control ms-3"
					      									type="text" name="content" placeholder="답글을 작성해주세요" /><br>
					      							<div type="button" class="btn btn-primary insertReplyChildButton">
					      								<i class="fa-solid fa-circle-check"></i>
					      							</div>
			      								</div>
			      							</form>
	      								</div>
	      							</div>
							
              							`); // end for html 
			
								
								// 자식댓글(답글) 등록
								// replyElement 안에 있는 class이므로 find로 요소 찾기
								replyElement.find(".insertReplyChildButton").click(function() {
									console.log("5555555555555555555555555555544");
									
									const data = $(this).closest(".childReplyAreaForm").serialize();
									
										$.ajax({ // 자식댓글(답글) 출력
											url : "${appRoot }/meeting/reply/insertReplyC",
											type : "post",
											data : data,
											success : function(data) {
													alert("댓글 등록성공!");
													console.log("댓글 등록성공");
													// 등록 완료후 초기화
													$("#insertReplyChildInput").val("");
													parentsReplyList();

											},
											error : function() {
												console.log("댓글 등록 실패");
											}
											
																	
									});// 자식댓글(답글) 등록 ajax end
									
								});// 자식댓글(답글) 등록 end
								
								// .append : 선택된 요소의 마지막에 새로운 요소나 콘텐츠를 추가
                           		replyListElement.append(replyElement);
                           	
                    			
                                // 자식 댓글창 슬라이드 : 자식, 손자 댓글에도 적용되어야 함으로 댓글 리스트 for문 안에서 실행
                                // replyElement 안에 있는 class이므로 find로 부모찾고 on("click" 으로, 
                                // 클릭이벤트가 발생될 class를 선택해줘야한다.
                    			replyElement.find(".replyTextContainer").on("click", ".replyText", function(e) {
                    				e.preventDefault();
                    				// closest(selector) 셀렉터로 잡히는 상위 요소중 가장 근접한 하나를 반환한다.
                    				// 그안에 요소인 childReplyArea를 찾기위해 .next 사용(선택한 요소의 다음 요소를 선택)
                    				// 이렇게 작성해줘야 각각의 요소의 클릭 이벤트 발생시 slideToggle 실행된다.
                    				$(this).closest(".replyTextContainer").next(".childReplyArea").slideToggle("slow");
                    				//console.log(this);
                    			}); // end of slideToggle
                    			
                    			// 댓글 수정 form 보이기
                    			replyElement.find(".replyUpdate").click(function(e) {
                    				e.preventDefault();
                    				console.log("982793857297")
                    				$(".replyContent").addClass("d-none");
                    				$(".replyUpdateContent").removeClass("d-none");
                    				$(this).closest(".replyForm").find(".replyUpdateArea").removeClass("d-none");
                    			
                    			}); // end of replyUpdate
                    			
                    			// 댓글 수정 update
                    			replyElement.find(".replyUpdateButton").click(function() {
                    				
                    				const data = $(this).closest(".replyUpdateAreaForm").serialize();
                    					
                    					$.ajax({
                    						url : "${appRoot}/meeting/reply/updateReply",
                    						type : "post",
                    						data : data,
                    						success : function(data) {
                    							alert("댓글 수정이 완료되었습니다!");
                    	        				console.log("댓글 수정 성공");
                    	        				// 댓글 목록 실행 
                    	        				parentsReplyList(); 
                    						},
                    						error : function() {
                    							alert("댓글을 수정할 수 없습니다.");
                    							console.log("댓글 수정 실패");
                    						}
                    					}); // 댓글 수정 ajax end 
                    				
                    			}); // 댓글 수정 update end
								
                    			console.log("여기가 삭제야");
                    	
								// 댓글 삭제 
								replyElement.find(".replyDelete").click(function() {
									
									
									const data = { meetingId : '${meeting.meetingId}',
													meetingReplyId : $(this).attr("data-reply-id"),
													deleteInfo : $(this).attr("data-reply-status")};
					
									console.log(data);	
									if(confirm("삭제하시겠습니까?")) {
										
										console.log("삭제까지 오고있니?");
										$.ajax({
	                						url : "${appRoot}/meeting/reply/deleteReply",
	                						type : "post",
	                						data : data,
	                						async : false, // 순차적인 데이터 통신
	                						success : function(data) {
	                	        				parentsReplyList(); 
	                							alert("댓글이 삭제되었습니다!");
	                				
	                	        				console.log("댓글 수정 성공");
	                	        				// 댓글 목록 실행 
	                						},
	                						error : function() {
	                							alert("댓글을 삭제할 수 없습니다.");
	                							console.log("댓글 수정 실패");
	                						},
	                						complete : function() {
	        									console.log("댓글 삭제 요청 끝");
	                						
	        								}
	                						
	                					}); // 댓글 삭제 ajax end 
										
									} // 댓글 삭제 confirm end 
                					
								}); // 댓글 삭제 end
							
							} // end of for
                           	
							console.log("aaaaa");
						},// success end
						
						error : function() {
							console.log("댓글 가져오기 실패");
						}
						
						
						
						
					}); // 댓글 목록 ajax end
					
					
					console.log("zzzzzz");
				
				
			 }
			 // 댓글 목록 실행
			 parentsReplyList();
			 

            
			 console.log("5555555555555555555");
			 
		// 부모 댓글 등록
		$("#insertReplyParentsButton").click(function(e) {
			e.preventDefault();
			
			const data = { meetingId : '${meeting.meetingId}',
							 content : $('#insertReplyParentsInput').val() };
				
				$.ajax({ // 댓글 출력
					url : "${appRoot }/meeting/reply/insertReplyP",
					type : "post",
					data : data,
					success : function(data) {
							console.log("댓글 등록성공");
							$("#insertReplyParentsInput").val("");
							parentsReplyList();
					},
					error : function() {
						console.log("댓글 등록 실패");
					}
											
					});// 부모 댓글 등록 ajax end
	
			});
		 console.log("666666666666666");
		
});
	    
</script>

	<!-- 모임신청 모달창 -->
	<div id="insertGuestModal1" class="modal-overlay" >
		<div class="modal-window">
			<div class="title" style="text-align: center; margin-top: 15px;">
				<h4><i class="fa-solid fa-paper-plane"></i>꿀비 모임을 신청하시겠습니까?</h4>
				<hr />
			</div>
			<div class="content">
				<ul style="color: #000000;">
					<li>모임에 적극적인 참여 부탁드립니다!</li>
					<li>모임 장소를 잘 확인하시고 늦지않게 오세요!</li>
					<li>문의 사항은 댓글을 남겨주세요</li>
					<li>꿀비들이 모여 아름다운 세상을 만듭니다.</li>
				</ul>
				<p style="color: #000000;">모임일시:${meeting.meetingDate }</p>
				<p style="color: #000000;">모임장소:${meeting.address } ${meeting.detailAddress }</p>
				<form id="guestInsertForm1"
					action="${appRoot }/meeting/board/addGuest" method="post">
					<span class="d-flex flex-row-reverse">
						<button type="button" class="btn btn-secondary"
							style="margin-left: 10px;">취소</button>
						<input type="hidden" name="meetingId"
							value="${meeting.meetingId }" />
						<button class="btn btn-primary" id="guestSubmitBtn1" style="background-color: #09ab60;">신청</button>
					</span>
				</form>
			</div>
		</div>
	</div>
</body>
</html>