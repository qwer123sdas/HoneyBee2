<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%request.setCharacterEncoding("utf-8");%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags" %>

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
<title>기부 제안하기 - 수정</title>

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

<!-- Customized Bootstrap Stylesheet -->
<link href="${appRoot }/resources/webContents/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Template Stylesheet -->
<link href="${appRoot }/resources/webContents/css/style.css"
	rel="stylesheet">
	
<!-- flatpickr 달력 api -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_orange.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/flatpickr.min.js"></script><script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>

<!-- daum 주소검색 api 추가 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- summernote  -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">

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
	<my:mainNavBar></my:mainNavBar>


	<!-- Page Header Start -->
	<div class="container-fluid bg-warning bg-gradient py-5">
		<div class="container bg-warning bg-gradient text-dark ">
			<h1 class="display-2 text-dark mt-5 animated slideInDown text-center" >꿀벌 기부를 제안해주세요!</h1>
			<nav aria-label="breadcrumb animated slideInDown"></nav>
		</div>
	</div>
	<!-- Page Header End -->

	

		<div class="container col-15">
			<div class="py-5 text-center">
				<h3 class="lead">
					<i class="fa-brands fa-forumbee"></i>
					꿀비팀은 이용자에게 다양한 기부활동을 알리고,
					<br />
					더 많은 분들이 관심을 갖고 참여할 수 있도록 제안 캠페인을 진행하고 있습니다.
				</h3>
			</div>
		<div id="donationContentInfo" style="margin-left: 220px;">
			<form class="needs-validation" novalidate action="${appRoot }/donation/board/write" method="POST" enctype="multipart/form-data">
				<div class="col-10">
						<h3 class="col-10 text-center ">
							프로젝트 모금함 작성
							<i class="fa-solid fa-feather"></i>
						</h3>

					<br />
					<br />

					<div class="row gy-3">
						<div class="col-md-3">
							<label for="country" class="form-label">
								<h3 class="lead">
									<i class="fa-solid fa-1"></i>
									.주제를 선택하세요
								</h3>
							</label>
							<select class="form-select" id="subtopic" name="topic">
								<option>전체</option>
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
									.기부 제목 짓기
								</h3>
							</label>
							<!-- maxlength : 글자수 제한  -->
							<input type="text" class="form-control" name="title" value=""
								placeholder="최대 30자까지 작성 가능합니다." maxlength="30" required>
							<div class="invalid-feedback">필수 선택사항 입니다.</div>
						</div>

						<br />

						<div class="col-10">
							<label for="formFile" class="form-label">
								<h3 class="lead">
									<i class="fa-regular fa-3"></i>
									.메인이미지로 좋은 인상 주기
								</h3>
							</label>
							<a href="javascript:void(0);" onclick="$('#imgUpload').trigger('click')" class="imgUploadBtn">
								<img id="imgChange" 
									src="${appRoot }/resources/600x400image.jpg"
									alt="메인 사진 업로드"  style="width: 800px;">
							</a>
							<input type="file" id="imgUpload"  name="mainPhoto" style="display:none"  accept="image/*" onchange="readURL(this);">
							<div id="image_container"></div>
							
							<%-- <input class="form-control" type="file" id="formFile" value="${board.MPhoto }" name="mainPhoto" accept="image/*" required> --%>
							<div class="invalid-feedback">메인 사진 등록은 필수입니다.</div>
						</div>
					
						<br />
					
						<div class="col-15">
							<label for="lastName" class="form-label">
								<h3 class="lead">
									<i class="fa-regular fa-4"></i>
									.기부 스토리 텔링
								</h3>
							</label>
							<textarea class="textarea" id="summernote" name="content"required></textarea>
							<div class="invalid-feedback">필수 입력사항 입니다.</div>
						</div>

						<br />

						<div class="input_tag col-10">
							<label for="tag" class="form-label">
								<h3 class="lead">
									<i class="fa-regular fa-5"></i>
									.태그로 기부자와 소통하기
								</h3>
							</label>
							<input type="text" class="form-control" id="hashTag" value=""  name="hashTagLump" placeholder="#을 붙여 해시테그를 입력해주세요" required>
							
							<!-- 숨겨진 부분 -->
							<input type="hidden" id="folderName" name="folderName" />
							
							
							<div class="invalid-feedback">필수 입력사항 입니다.</div>
						</div>
					</div>
		
			<hr class="my-4 " style="width: 83%">

					<h4 class="mb-3 ">
						<i class="fa-solid fa-star"></i>
						중요 입력사항!
					</h4>

					<br />

					<div class="row gy-3">
						<div class="col-md-4">
							<label for="expired" class="form-label">
								<h3 class="lead">
									<i class="fa-regular fa-6"></i>
									.마감날짜
								</h3>
							</label>
							<input type="text" class="form-control" id="expired" value="${board.expired }"
								pattern="|d{4}-|d{2}-|d{2}" name="expired" required
								th:field="*{expired}" value="">
							<small class="text-muted">선택한 날짜를 정확히 확인해 주세요.</small>
							<div class="invalid-feedback">필수 입력 사항입니다.</div>
						</div>

						<div class="col-md-6">
							<label for="cc-number" class="form-label">
								<h3 class="lead">
									<i class="fa-solid fa-7"></i>
									.모금 목표금액
								</h3>
							</label>
							<input type="text" class="form-control" id="cc-number" value="${board.goal }"
								name="goal" placeholder="정확한 금액을 입력해주세요." required>
							<div class="invalid-feedback">필수 입력 사항입니다.</div>
						</div>
					</div>
				</div>

					<hr class="my-4 " style="width: 70%">
				
					<div class="form-check">
						<input type="checkbox" class="form-check-input" id="save-info">
						<label class="form-check-label" for="same-address">위 입력사항이
							정확히 기록되었는지 확인하셨나요?</label>
					</div>

					<div class="form-check">
						<input type="checkbox" class="form-check-input" id="save-info">
						<label class="form-check-label" for="save-info">제안하신 내용은
							꿀비 요정이 검토 후 등록됨을 확인하셨나요?</label>
					</div>



				<br>
				<div style="margin-left: 420px">
					<button class="w-40 btn btn-primary btn-lg" type="submit" style="center">
						꿀비팀에게 제안하기
						<i class="fa-solid fa-hands-clapping"></i>
					</button>
				</div>
			
			</form>
		</div>
	</div>



	<!-- foot bar -->
	<nav:footbar_kim></nav:footbar_kim>

	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<!-- JavaScript Libraries -->
	<!--Jquery -->
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
</body>
<script>
 	/* 폴더명 */
	 const randomNum = Math.floor(Math.random() * 1000000000);
 	$('#folderName').val('padding-' + randomNum);
 	
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


$(document).ready(function() {
		//여기 아래 부분

		$('#summernote').summernote({
			  height: 300,                 // 에디터 높이
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
            data.append("folderId", 'padding-'+ randomNum); // 폴더 난수 넘기기
            $.ajax({
                url: '${appRoot}/uploadImageToS3ForSummerNote/donation',
                data: data,
                type: "POST",
                cache: false,
                contentType: false,
                processData: false,
                enctype: 'multipart/form-data',
                success: function(data) {
                	console.log(data);
                	console.log(data.fileUrl);
                	
                    $('#summernote').summernote('editor.insertImage', data.url);  // aws s3에 저장한 이미지 url을 넘기므로 summernote에서 보이게 됨
                },
                error: function (data) {
                    alert(data.responseText);
                }
            });
        }
	});
	
//  flatpickr 달력 기본 설정
var fp = flatpickr(document.getElementById("expired"), {
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
});
</script>
</html>