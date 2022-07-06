<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
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

<meta charset="utf-8" />
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
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">

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
	
<!-- flatpickr 달력 api -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_orange.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/flatpickr.min.js"></script><script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>

<!-- daum 주소검색 api 추가 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
.is-invalid ~.invalid-feedback, .is-invalid ~.invalid-tooltip,
.was-validated :invalid ~.invalid-feedback, .was-validated :invalid ~.invalid-tooltip {
	display: block;
}
.outer {
  display: flex;
}

.inner {
  margin: 0 auto;
}

.g-3, .gy-3 {
	bs-gutter-y: 1rem;
}
*, ::after, ::before {
    box-sizing: border-box;
    
.row {
    bs-gutter-x: 1.5rem;
}

.bg-light {
    bs-bg-opacity: 1;
}
.invalid-feedback {
	display: none;
	width: 100%;
	margin-top: 0.25rem;
	font-size: .875em;
	color: #dc3545;
}

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

.outer-div {
  display: flex;
  justify-content : center;
}

.inner-div {
  margin: 600px;
}

@media ( min-width : 1000px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.classContent{
	widows: 80px;
}
.map_wrap {
	position: relative;
	width: 100%;
	height: 400px;
}


</style>

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


	<!-- Nav bar -->
	<my:mainNavBar current="meetingMain"></my:mainNavBar>

	<!-- Page Header Start -->
	<div class="container-fluid bg-warning bg-gradient py-5">
		<div class="container bg-warning bg-gradient text-dark ">
			<h1 class="display-2 text-dark mt-5 animated slideInDown text-center" >모두의행동을 제안해주세요!</h1>
			<nav aria-label="breadcrumb animated slideInDown"></nav>
		</div>
	</div>
	<!-- Page Header End -->


		<div class="container col-15">
			<div class="py-5 text-center">
				<h3 class="lead">
					<i class="fa-brands fa-forumbee"></i>
					꿀비팀은 이용자에게 다양한 모두의행동을 알리고,
					<br />
					더 많은 분들이 관심을 갖고 참여할 수 있도록 제안 캠페인을 진행하고 있습니다.
				</h3>
			</div>
		<div id="meetingContentInfo" style="margin-left: 220px;">
			<form class="needs-validation" action="${appRoot}/meeting/modify" method="post" enctype="multipart/form-data" novalidate >
				<div class="col-10">
						<h3 class="col-10 text-center ">
							모두의행동 제안서 스토리 변경
							<i class="fa-solid fa-feather"></i>
						</h3>

					<br />
					<br />

					<div class="row gy-3">
						<div class="col-md-3">
							<label for="country" class="form-label">
								<h3 class="lead">
									<i class="fa-solid fa-1"></i>
									.행동 주제 선택
								</h3>
							</label>
							<select class="form-select" id="subtopic" name="topic" required>
								<option value="0">전체</option>
								<option value="1">어린이</option>
								<option value="2">장애인</option>
								<option value="3">어려운 이웃</option>
								<option value="4">환경</option>
							</select>
							<div class="invalid-feedback">필수 입력사항 입니다.</div>
						</div>

						<br />

						<div class="col-10">
							<label for="firstName" class="form-label col-15">
								<h3 class="lead">
									<i class="fa-regular fa-2"></i>
									.모두의행동 제목 짓기
								</h3>
							</label>
							<!-- maxlength : 글자수 제한  -->
							<input type="text" class="form-control" name="title" value="${meeting.title }"
								placeholder="최대 30자까지 작성 가능합니다." maxlength="30" onfocus="this.value=''" required>
							<div class="invalid-feedback">필수 선택사항 입니다.</div>
						</div>
						
						<br />

						<div class="input_tag col-10">
							<label for="tag" class="form-label">
								<h3 class="lead">
									<i class="fa-regular fa-3"></i>
									.태그로 모두의행동 표현하기
								</h3>
							</label>
							<input type="text" class="form-control" id="address1" value="${hashTags }"
								name="hashTagRaw" placeholder="#을 붙여 해시테그를 입력해주세요" onfocus="this.value=''" required>
							<!-- <input type="hidden" id="folderName" name="folderName" / -->
							<div class="invalid-feedback">필수 입력사항 입니다.</div>
						</div>

						<br />

						<div class="col-10">
							<label for="formFile" class="form-label">
								<h3 class="lead">
									<i class="fa-regular fa-4"></i>
									.메인 이미지로 모두의행동을 보여주세요
								</h3>
							</label>
							
							<a href="javascript:void(0);" onclick="$('#imgUpload').trigger('click')" class="imgUploadBtn">
								<img id="imgChange" 
									src="https://bucket0207-4885.s3.ap-northeast-2.amazonaws.com/meeting/${meeting.folderName }/${meeting.MPhoto}"  
									alt="메인 사진 업로드"  style="width: 600px;">
							</a>
							<input type="file" id="imgUpload"  name="mainPhoto" style="display:none" accept="image/*" onchange="readURL(this);">
							<div id="image_container"></div>
							<div class="invalid-feedback">메인 사진 등록은 필수입니다.</div>
						</div>
						
						<!-- 사진관련 hiden 넘기기 -->
						<input type="hidden" name="meetingId" value="${meeting.meetingId }"/>
						<input type="hidden" name="folderName" id="folderName" value="${meeting.folderName}"/>
						<input type="hidden" name="oldMainPhoto" id="oldMainPhoto" value="${meeting.MPhoto}"/>
						<br />
						<br />
					
						<div class="col-15">
							<label for="lastName" class="form-label">
								<h3 class="lead">
									<i class="fa-regular fa-5"></i>
									.꿀비들의 마음을 움직이는 모두의행동 스토리를 작성해 보세요
								</h3>
								<small class="text-muted">*꿀비들에게 보여줄 사진은 드래그로 추가하세요!</small>
							</label>
							<textarea class="textarea" id="summernote" name="content"
								required>${meeting.content } </textarea>
							<div class="invalid-feedback">필수 입력사항 입니다.</div>
						</div>

					</div>
		
			<hr class="my-4 " style="width: 100%">

					<h4 class="mb-3">
						<i class="fa-solid fa-star"></i>
						모두의행동 중요 입력사항입니다!
					</h4>

					<br />

					<div class="row gy-3">
						<div class="col-md-3">
							<label for="guestNum" class="form-label">
								<h3 class="lead">
									<i class="fa-regular fa-6"></i>
									.모집 인원
								</h3>
							</label>
							<input type="number" class="form-control" name="guestNum" id="guestNum" value="${meeting.guestNum }" placeholder="명" required/>
							<small class="text-muted">인원을 입력하세요</small>
							<div class="invalid-feedback">필수 입력 사항입니다.</div>
						</div>
					
						<div class="col-md-5" style="margin-left: 155px;">
							<label for="expired" class="form-label">
								<h3 class="lead">
									<i class="fa-regular fa-7"></i>
									.모임 날짜
								</h3>
							</label>
							<input type="text" class="form-control" id="meetingDate" value="${meeting.meetingDate }" 
								pattern="|d{4}-|d{2}-|d{2}" name="meetingDate" required
								th:field="*{meetingDate}" value="">
							<small class="text-muted">모두의행동 시작일 확인</small>
							<div class="invalid-feedback">필수 입력 사항입니다.</div>
						</div>
						
						<br/>
						
						<div class="col-md-5">
							<label for="expired" class="form-label">
								<h3 class="lead">
									<i class="fa-regular fa-8"></i>
									.모집 시작일
								</h3>
							</label> <!-- type="date가 아님" -->
							<input type="text" class="form-control" id="startDate" value="${meeting.startDate }" 
								pattern="|d{4}-|d{2}-|d{2}" name="startDate" required
								th:field="*{startDate}" >
							<small class="text-muted">모집 시작 입력일 확인</small>
							<div class="invalid-feedback">필수 입력 사항입니다.</div>
						</div>
						
						<div class="col-md-5">
							<label for="expired" class="form-label">
								<h3 class="lead">
									<i class="fa-regular fa-9"></i>
									.모집 종료일
								</h3>
							</label>
							<input type="text" class="form-control" id="endDate" value="${meeting.endDate }" 
								pattern="|d{4}-|d{2}-|d{2}" name="endDate" required
								th:field="*{endDate}" >
							<small class="text-muted">모임 종료 입력일 확인</small>
							<div class="invalid-feedback">필수 입력 사항입니다.</div>
						</div>
						
						<!-- 카카오 지도 api -->
						<div class="border mb-3 container shadow p-3 mb-3 bg-body rounded">
							<div id="map"
								style="width: 690 px; height: 400px; margin: auto; margin-top: 10px;"></div>
						</div>
						
						<div class="col-md-6">
							<label for="expired" class="form-label">
								<h3 class="lead">
									<i class="fa-regular fa-1"></i>
									<i class="fa-solid fa-0"></i>
									.모임 장소
								</h3>
							</label>
							<div class="input-group">
								<input class="form-control " type="text" name="postcode" id="postcode" value="${meeting.postcode }" onfocus="this.value=''" placeholder="우편번호" required>
								<input class="form-control" type="button" onclick="daumPostCode()" value="우편번호 찾기"><br/>
							</div>
								<small class="text-muted">검색한 우편번호를 확인해주세요.</small>
								<div class="invalid-feedback">필수 입력 사항입니다.</div>
						</div>
						
						<div class="col-md-10">
							<input class="form-control" type="text" id="address" name="address" value="${meeting.address }" onfocus="this.value=''" placeholder="주소" required>
							<input class="form-control" type="text" id="detailAddress" name="detailAddress"  value="${meeting.detailAddress }" onfocus="this.value=''"
								placeholder="상세주소" required>
							<small class="text-muted">입력된 주소를 확인해주세요</small>
							<div class="invalid-feedback">필수 입력 사항입니다.</div>
						</div>
					</div>
				</div>

					<hr class="my-4 " style="width: 83%">
				
					<div class="form-check">
						<input type="checkbox" class="form-check-input" id="save-info">
						<label class="form-check-label" for="same-address">
						모두의행동 모집 수정사항을 꼼꼼하게 입력하셨나요?</label>
					</div>
					
					<div class="form-check">
						<input type="checkbox" class="form-check-input" id="save-info">
						<label class="form-check-label" for="same-address">
						모두의행동 시작일이 얼마 남지 않은 경우 불편함이 있을 수 있습니다.</label>
					</div>

				
					<div class="form-check">
						<input type="checkbox" class="form-check-input" id="save-info">
						<label class="form-check-label" for="save-info">수정하신 내용은
							꿀비 요정이 검토 후 바로 등록됨을 확인하셨나요?</label>
					</div>



				<br>
				<div style="margin-left: 450px">
					<button class="w-40 btn btn-primary btn-lg" type="submit" style="center">
						모두의행동 수정!
						<i class="fa-solid fa-hands-clapping"></i>
					</button>
				</div>
			
			</form>
		</div>
	</div>


	<!-- foot bar -->
	<nav:footbar_kim></nav:footbar_kim>

	<!-- summernote  -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
		
	<!-- JavaScript Libraries -->
	<!--Jquery -->
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
	
	<!-- 카카오지도 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=85d045c455e66b45c873d8a3ab36b2ed&libraries=services"></script>
	
</body>
<script>
/* 폴더명 */
$('#folderName').val('${meeting.folderName}');
$('#oldMainPhoto').val('${meeting.MPhoto}');

//메인 사진 이미지
function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      document.getElementById('imgChange').src = e.target.result;
    };
    reader.readAsDataURL(input.files[0]);
  } else {
    document.getElementById('imgChange').src = "";
  }
}


//다음 주소검색
console.log(2)
function daumPostCode() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수

			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}

			// 우편번호와 주소 정보를 해당 input에 넣는다.
			document.getElementById('postcode').value = data.zonecode;
			document.getElementById("address").value = addr;
			// 커서를 상세주소 입력 포커스
			document.getElementById("detailAddress").focus();
		}
	})
	
	.open();
}

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
	}); 
	
	/* 카카오 지도 api 끝남 */

		//서머노트
		// 서머노트 파일명 랜덤값으로
		//여기 아래 부분
//		const randomNum = Math.floor(Math.random() * 1000000000);
//		$('#folderName').val('padding-' + randomNum); 기존 난수값 가져오기
		$('#summernote').summernote({
			  height: 700,                 // 에디터 높이
			  minHeight: null,             // 최소 높이
			  maxHeight: null,             // 최대 높이
			  focus: true,       
			  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
			  placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
			  callbacks: {	//여기 부분이 이미지를 첨부하는 부분
					onImageUpload : function(images, editor, welEditable) {
			            // 파일 업로드(다중업로드를 위해 반복문 사용)
						for (let i = 0; i < images.length; i++) {
							console.log(images[i]);
               		 		uploadImageToS3ForSummerNote(images[i]);
            			}
					}
			  }
		});
		
        function uploadImageToS3ForSummerNote(image) {
            data = new FormData(); // file를 담을 객체
            data.append("image", image); // file를 담고 ajax에서 넘겨줌
            data.append("folderId", "${meeting.folderName}"); // 폴더 난수 넘기기
            $.ajax({
                url: '${appRoot}/uploadImageToS3ForSummerNote/meeting',
                data: data,
                type: "POST",
                cache: false,
                contentType: false,
                processData: false,
                enctype: 'multipart/form-data',
                success: function(data) {
                	console.log(data);
                	console.log(data.fileUrl);
                	
                    // aws s3에 저장한 이미지 url을 넘기므로 summernote에서 보이게 됨
                    $('#summernote').summernote('editor.insertImage', data.url);  
                },
                error: function (data) {
                    alert(data.responseText);
                }
            });
        }
	});
	
	//  flatpickr 달력 기본 설정
	var fp = flatpickr(document.getElementById("meetingDate"), {
		'monthSelectorType' : 'static',
		"locale" : "ko"
	});
	
	var fp = flatpickr(document.getElementById("startDate"), {
				'monthSelectorType' : 'static',
				"locale" : "ko"
		});
	
	var fp = flatpickr(document.getElementById("endDate"), {
		'monthSelectorType' : 'static',
		"locale" : "ko"
	});
	

(function () {
  'use strict'
// forms 입력 유효성 검사 : 특정 항목을 다 입력하지 못하면 submit 이벤트가 발생되지 않는다. 
  var forms = document.querySelectorAll('.needs-validation')

  Array.prototype.slice.call(forms)
    .forEach(function (form) {
      form.addEventListener('submit', function (event) {
        if (!form.checkValidity()) {
          event.preventDefault()
          event.stopPropagation()
        }

        form.classList.add('was-validated')
      }, false)
    })
})()
</script>
</html>