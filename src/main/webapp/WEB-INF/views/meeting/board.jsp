<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
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
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap"
	rel="stylesheet">

<!-- google font 추가함 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap"
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
	width: 600px;
	height: 400px;
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
  background-color: #04AA6D;
  color: white;
  padding: 16px;
  font-size: 12px;
  border: none;
  cursor: pointer;
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
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #f1f1f1;}
.dropdown:hover .dropdown-content {display: block;}
.dropdown:hover .dropbtn {background-color: #3e8e41;}

</style>

<!-- 카카오지도 라이브러리 불러오기 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=85d045c455e66b45c873d8a3ab36b2ed&libraries=services"></script>


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
						<c:forEach items="${meeting.hashTag }" var="hashTag">
							<a href="${appRoot}/meeting/tags/${hashTag}">
								<span class="badge rounded-pill bg-warning text-dark">#
									${hashTag }</span>
							</a>
						</c:forEach>
						<!-- 해쉬태그 -->
						<a class="badge bg-secondary text-decoration-none link-light"
							href="#!">${meeting.tag }</a>
					</header>
					<!-- Post title End -->

					<!-- Preview image -->
					<figure class="mb-4">
						<img class="img-fluid rounded"
							src="https://dummyimage.com/900x400/ced4da/6c757d.jpg" alt="..." />
					</figure>

					<!-- Post content-->
					<section class="mb-5">
						<p class="fw-bolder fs-5 mb-4">${meeting.content }</p>
						<p class="fs-5 mb-4">host by. ${meeting.nickname }</p>
						<h4
							class="fw-bolder border mb-2 mt-2 shadow-none p-2 mb-2 bg-light rounded text-center">*꿀비
							모임 장소 : ${meeting.address } ${meeting.detailAddress }</h4>
						<!-- 카카오 지도 api -->
						<div class="border mb-3 container shadow p-3 mb-3 bg-body rounded">
							<div id="map"
								style="width: 690 px; height: 400px; margin: auto; margin-top: 10px;"></div>
						</div>
					</section>
				</article>


				<!-- 댓글, 대댓글 -->
				<section class="replyForm">
					<h4>커뮤니티</h4>
					<div class="card bg-light">
						<div class="card-body">
							<!-- 댓글 입력 form -->
							<form class="mb-4" id="insertReplyForm1"
								action="${appRoot }/meeting/reply/insertReplyP" method="post">
								<div class="input-group">
									<input type="hidden" name="meetingId"
										value="${meeting.meetingId }" />
									<input id="insertReplyContentInput1" class="form-control"
										type="text" name="content" placeholder="아름다운 발걸음을 함께해요!" />
									<button class="btn btn-primary" id="insertReplyButton1" > <!-- style="display: none" -->
										<i class="fa-solid fa-circle-check"></i>
									</button>

								</div>
							</form>
							<!-- 댓글 대댓글 출력 ajax 처리 -->

							<div id="parentsReplyList" class="parentsReplyList"></div>

						</div>
					</div>
				</section>
			</div>

			<!-- 모임신청 진행 상태 -->
			<div class="col-lg-4">
				<!-- Search widget-->
				<div class="guestWiget">
					<div
						class="guestWiget-header d-flex justify-content-center align-middle">
						<h4>
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
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
		<!-- page contents end -->
	</div>



	<!-- foot bar -->
	<nav:footbar></nav:footbar>


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
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${meeting.address}', function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
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
	}); 
	
	/* 카카오 지도 api 끝남 */
		 
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
		
	// guestList 가져오는 ajax 요청
	const guestList = function() {
		 const data = {meetingId : '${meeting.meetingId}'};
		 
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
		 
		// 모임 신청버튼 누르면 submit
		$("#guestSubmitBtn1").click(function(e) {
			e.preventDefault();
			
			const data = {meetingId : '${meeting.meetingId}'};
			
			$.ajax({ 
				url : "${appRoot }/meeting/board/guest/addGuest",
				type : "post",
				data : data,
				success : function(data) {
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
		
	 }
	
	 // 게스트 리스트 가져오는 함수 실행
	 guestList();
	 
	 /* 게스트 입출력 부분 끝남 */

				
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
								const replyElement = $("<div class='d-flex mb-4' />");
								replyElement.html(`
									<div class="flex-shrink-0">
										<!-- 프로필사진 -->
										<img class="rounded-circle"
											src="${appRoot}/resources/webContents/img/user_profile.png"
											alt="..." />
										<!-- 프로필사진 -->
									</div>
									<div class="">
										<div class="ms-3" >
											<div class="fw-bold ">
												<div class="dropdown" style="float:right;">
												  <span class="dropbtn"><i class="fa-solid fa-ellipsis-vertical"></i></span>
												  <div class="dropdown-content">
												    <a href="#">Link 1</a>
												    <a href="#">Link 2</a>
												  </div>
												</div>
												\${list[i].nickname }
												<br>
												\${list[i].inserted }
											</div>
										</div>
										<div class="ms-3">\${list[i].content }</div>
										
											
										<div class="ms-3">
											<div class="fw-bold d-flex justify-content-between">
												<a class="small fw-medium" href="#">
													<strong class="replyTxt">답글 작성</strong>
														<span class="replyCnt" style="">0</span>
												</a>
												<a class="replyLike" href="#">
													<i class="fa-regular fa-heart"></i>
													<em class="replyLikeCnt">0</em>
												</a>
											</div>
											<div class="replyIcon"> <!-- 좋아요 -->
										</div>
									</div>	
												
		             
              							`);
								
                           		replyListElement.append(replyElement);
							} // end of for
						},// success end
						
						error : function() {
							console.log("댓글 가져오기 실패")
						}
						
						
					}); // 댓글 목록 ajax end
					
					
					
				}
					
			// 댓글 목록 실행
			parentsReplyList();
			
			
			
		
		

});
	    
</script>

	<!-- 모임신청 모달창 -->
	<div id="insertGuestModal1" class="modal-overlay">
		<div class="modal-window">
			<div class="title">
				<h4>꿀비 모임을 신청하시겠습니까?</h4>
				<hr />
			</div>
			<div class="content">
				<ul>
					<li>모임에 적극적인 참여 부탁드립니다!</li>
					<li>모임 장소를 잘 확인하시고 늦지않게 오세요!</li>
					<li>문의 사항은 댓글을 남겨주세요</li>
					<li>꿀비들이 모여 아름다운 세상을 만듭니다.</li>
				</ul>
				<h1>${meeting.meetingId }</h1>
				<p>모임일시:${meeting.meetingDate }</p>
				<p>모임장소:${meeting.address } ${meeting.detailAddress }</p>
				<form id="guestInsertForm1"
					action="${appRoot }/meeting/board/addGuest" method="post">
					<span class="d-flex flex-row-reverse">
						<button type="button" class="btn btn-secondary">취소</button>
						<input type="hidden" name="meetingId"
							value="${meeting.meetingId }" />
						<button class="btn btn-primary " id="guestSubmitBtn1">신청</button>
					</span>
				</form>
			</div>
		</div>
	</div>
</body>
</html>