<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags"%>

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
	
<!-- flatpickr 달력 api -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_orange.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/flatpickr.min.js"></script><script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>

<!-- daum 주소검색 api 추가 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- summernote  -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
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

.bd-placeholder-img {
  font-size: 1.125rem;
  text-anchor: middle;
  -webkit-user-select: none;
  -moz-user-select: none;
  user-select: none;
}
@media (min-width: 768px) {
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



	<!-- Page Header Start -->
	<div class="container-fluid bg-warning bg-gradient py-5 mt-4">
		<div class="container bg-warning bg-gradient text-dark ">
			<h1 class="display-2 text-dark mt-5 animated slideInDown text-center" >꿀벌 재능 나눔&판매를 제안해주세요!</h1>
			<nav aria-label="breadcrumb animated slideInDown"></nav>
		</div>
	</div>
	<!-- Page Header End -->

	<!-- Nav bar -->
	<nav:navbar></nav:navbar>

		<div class="container col-15">
			<div class="py-5 text-center">
				<h3 class="lead">
					<i class="fa-brands fa-forumbee"></i>
					꿀비팀은 이용자에게 다양한 재능 나눔&판매활동을 알리고,
					<br />
					더 많은 분들이 관심을 갖고 참여할 수 있도록 제안 캠페인을 진행하고 있습니다.
				</h3>
			</div>
		<div id="tr_oneLine" style="margin-left: 220px;">
			<form class="needs-validation" novalidate id="talentWriteForm" onsubmit="return checks()"
				action="" method="POST"
				enctype="multipart/form-data">
				<div class="col-10">
						<h3 class="col-10 text-center ">
							프로젝트 재능 나눔&판매 작성
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
							<select class="form-select topic" id="topic" name="mainCategory">
								<option class="selectTopic" value="">카테고리 선택</option>
				            	<option class="selectTopic" value="1">문서, 취업</option>
				            	<option class="selectTopic" value="2">생활, 레슨</option>
				            	<option class="selectTopic" value="3">IT</option>
				            	<option class="selectTopic" value="4">콘텐츠</option>
				            	<option class="selectTopic" value="5">핸드메이드</option>
				            	<option class="selectTopic" value="6">마켓팅</option>
				            	<option class="selectTopic" value="7">번역</option>
							</select>
							<div class="invalid-feedback">필수 입력사항 입니다.</div>
						</div>

						<br />

						<div class="col-10">
							<label for="firstName username" class="form-label col-15">
								<h3 class="lead">
									<i class="fa-regular fa-2"></i>
									.재능 나눔&판매 제목 짓기
								</h3>
							</label>
							<!-- maxlength : 글자수 제한  -->
							<input type="text" class="form-control" name="title"
								placeholder="최대 30자까지 작성 가능합니다." maxlength="25" required>
							<div class="invalid-feedback">필수 선택사항 입니다.</div>
						</div>

						<br />

						<div class="col-10">
							<label for="formFile " class="form-label">
								<h3 class="lead">
									<i class="fa-regular fa-3"></i>
									.메인이미지로 좋은 인상 주기
								</h3>
							</label>
							<a href="javascript:void(0);" onclick="$('#imgUpload').trigger('click')" class="imgUploadBtn">
								<img id="imgChange" src=""  alt="메인 사진 업로드" >
							</a>
							<input type="file" id="imgUpload"  name="mainPhoto" style="display:none"  accept="image/*" onchange="readURL(this);">
							<div id="image_container"></div>
							<div class="invalid-feedback">메인 사진 등록은 필수입니다.</div>
						</div>
					
						<br />
					
						<div class="col-15">
							<label for="title" class="form-label">
								<h3 class="lead">
									<i class="fa-regular fa-4"></i>
									.재능 나눔&판매 스토리 텔링
								</h3>
							</label>
							<br>
							<textarea class="textarea" id="summernote" name="content"
								required>${board.content } </textarea>
							<div class="invalid-feedback">필수 입력사항 입니다.</div>
						</div>

						<br />

						<div class="col-md-6">
							<label for="cc-number" class="form-label">
								<h3 class="lead">
									<i class="fa-solid fa-5"></i>
									.강사님을 한줄로 소개해주세요.
								</h3>
							</label>
							<input type="text" class="form-control" id="selfIntroduction"placeholder="꿀비들에게 강사님을 소개해주세요." required>
							<div class="invalid-feedback">필수 입력 사항입니다.</div>
						</div>
						
						<br />
						
						<div class="col-md-8">
							<label for="title" class="form-label">
								<h3 class="lead">
									<i class="fa-regular fa-6"></i>
									.같이 할 수업&작업 내용 소개하기
								</h3>
							</label>
							<br>
							<div id="box">
								<div class="input-group"> <!-- input-group으로 버튼 합쳤어요  -->
									<input type="text" class="form-control" id="classContent" placeholder="" required>
				            		<input class="btn btn-outline-secondary" type="button" value="추가" onclick="add_textbox()">
								</div>
			            		<c:forEach items="${classContent }" var="classContent">
				            		<p>	
				            			<div class="input-group">
					            			<input type="text" class="form-control" id="classContent" placeholder="">
					            			<input type="button" value="삭제" class="btn btn-outline-secondary" onclick="remove(this)"/>
				            			</div>
				            		</p>
			            		</c:forEach>
								<div class="invalid-feedback">필수 입력사항 입니다.</div>
			        		</div>
						</div>
					</div>
				</div> 

				<br/>
				<br/>
				
					<h4 class="mb-3 ">
						<i class="fa-solid fa-star"></i>
						중요 입력사항!
					</h4>

					<br />
					
						<div class="col-md-6">
							<label for="cc-number" class="form-label">
								<h3 class="lead">
									<i class="fa-solid fa-7"></i>
									.판매 물품이름
								</h3>
							</label>
							<input type="text" class="form-control" id="productName" value="${board.productName }" placeholder="정확한 이름을 입력해주세요" required>
							<div class="invalid-feedback">필수 입력 사항입니다.</div>
						</div>
						
						<br/>

					<div class="row gy-3">
						<div class="col-10">
							<label for="expired" class="form-label">
								<h3 class="lead">
									<i class="fa-regular fa-8"></i>
									.재능 나눔&판매 금액 정하기
								</h3>
							</label>
							<div class="col-10">
					            <div class="form-check">
					              <input type="radio" class="form-check-input"  id="free" name="pay" value="free" onclick="showPriceSelect()" required>
					              <label class="form-check-label" for="credit">무료 재능</label>
					            </div>
					            <div class="form-check">
					              <input type="radio" class="form-check-input" id="pay" name="pay" value="pay" onclick="showPriceSelect()" checked required>
					              <label class="form-check-label" for="debit">유로 재능</label>
					            </div>
					             <div class="col-6">
						       		<input type="number" class="form-control" id="price" value="${board.price }" placeholder="금액을 입력하세요">
					            	<div class="invalid-feedback">필수 입력 사항입니다.</div>
					            </div>
							</div>
						</div>
							
					</div>

				
				<br/>

				<div class="col-md-4">
					<label for="expired" class="form-label">
						<h3 class="lead">
							<i class="fa-regular fa-9"></i>
							.작업&수업일을 알려주세요
						</h3>
					</label>
					<!-- type="date가 아님" -->
					<input type="number" class="form-control" id="workDate"
						name="workDate" value="${board.workDate }" required>
					<small class="text-muted">작업&수업일 확인하세요</small>
					<div class="invalid-feedback">필수 입력 사항입니다.</div>
				</div>

				<br/>
				<br/>
				
				
				<h4 class="mb-3">
					<i class="fa-solid fa-map-location"> 추가 정보를 알려주세요</i>
				</h4>
				
				<div class="col-6">
					<label class="form-label"><i class="fa-solid fa-plus"></i> 지도 검색</label>
					<div class="input-group has-validation">
						<input type="text" class="form-control" id="username"
							placeholder="" required>
						<button class="btn btn-outline-secondary" onclick="keywordSearch()" type="button">검색</button>
					</div>
				</div>

				<div class="col-12">
					<div class="map_wrap my-3">
						<div id="map"
							style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
						<label class="form-label my-2" id="clickLatlng">주소 :</label>
						<!-- 주소 기록 -->
					</div>
				</div>
				
				<div class="col-7 my-2">
					<label class="form-label">상세 주소 : </label>
					<!-- 주소 기록 -->
					<input type="text" class="form-control" id="detailAddress"
						value="" placeholder="" required>
					<div class="invalid-feedback">Please enter a valid address.</div>
				</div>
				
				<hr class="my-4 " style="width: 80%">

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

					
					<br >
					
				<div style="margin-left: 600px">
					<input type="hidden" id="jsonByTalent" name="jsonByTalent"/>
					<input type="hidden" id="folderName" name="folderName" />
					<input type="hidden" id="oldMainPhoto" name="oldMainPhoto" />
					<button class="w-40 btn btn-primary btn-lg" type="submit" style="center">
						꿀비팀에게 제안하기
						<i class="fa-solid fa-hands-clapping"></i>
					</button>
				</div>
			</form>
		</div>
	</div>



	<!-- foot bar -->
	<nav:footbar></nav:footbar>


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
$('#folderName').val(${board.folderName});

$('#oldMainPhoto').val(${board.MPhoto});

/*
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
*/

const add_click = () => {
	var classContentList = '';
	var size = $("input[class='classContent']").length;
	for(i = 0; i < size; i++){
		console.log($("input[class='classContent']").eq(i).val());
		classContentList += '/' + $("input[class='classContent']").eq(i).val();
	}
};

// 유료 & 무료 선택
function showPriceSelect(){
	$('#price').removeClass('d-none')
	var nameVal = $('input:radio[name=pay]:checked').val();
	console.log(nameVal);
	if(nameVal == 'free'){
		$('#price').attr('readonly', true);
		document.getElementById("price").value=0;
	}else{
		$("#price").attr('readonly', false);
	}
}

// 항목 생성
const add_textbox = () => {
    const box = document.getElementById("box");
    const newP = document.createElement('p');
    newP.innerHTML = "<input type='text' class='form-control classContent mb-3'> <input type='button' value='삭제' class='btn btn-secondary mb-3' onclick='remove(this)'>";
    box.appendChild(newP);
    
}
const remove = (obj) => {
	document.getElementById('box').removeChild(obj.parentNode);
}


var mapLevel;
var address;

function checks() {
	var title = document.getElementById("title").value;
	var content = document.getElementById("summernote").value;
	var topic = document.getElementById("topic").value;
	var price = document.getElementById("price").value;
	//var hashTag = document.getElementById("").value;
	if (title != "" && content != "" && topic != "" && price != "") {
		console.log("1 : " + title);
		return true;
	} else {
		alert("전부 입력해야 합니다..");
		console.log("2 " + title);
		return false;
	}
}

$(document).ready(function(){
	//서머노트---------------------------------------------------------------------------------
	$('#summernote').summernote({
		  height: 500,                 // 에디터 높이
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
        data.append("folderId", 'padding-'+randomNum); // 폴더 난수 넘기기
        $.ajax({
            url: '${appRoot}/uploadImageToS3ForSummerNote/talent',
            data: data,
            type: "POST",
            cache: false,
            contentType: false,
            processData: false,
            enctype: 'multipart/form-data',
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
	// 서머노트 끝----------------------------------------------------------------------
	
	// json 직렬화
	$("#insertTalent").click(function(e) {
		e.preventDefault();
		console.log("여기까지 옴");
		var classContentList = '';
		var size = $("input[class='classContent']").length;
		for(i = 0; i < size; i++){
			console.log($("input[class='classContent']").eq(i).val());
			classContentList += '/' + $("input[class='classContent']").eq(i).val();
		}
		console.log(classContentList);
		
		var data = {'title' : document.getElementById("title").value,
				  'content' : document.getElementById("summernote").value,
				  'topic' : document.getElementById("topic").value,
				  'productName' : document.getElementById("productName").value,
				  'price' : $('#price').val(),
				  'mapLevel' : mapLevel,
				  'address' : address,
				  'detailAddress' : document.getElementById("detailAddress").value,
				  'workDate' : document.getElementById("workDate").value,
				  'selfIntroduction' : document.getElementById("selfIntroduction").value,
				  'classContent' : classContentList
				  }
		console.log(data);
		// json으로 바꿔줌
		$('#jsonByTalent').val(JSON.stringify(data));
		
		let form1 = $("#talentWriteForm");
		let actionAttr = "${appRoot }/talent/modify";
		form1.attr("action", actionAttr);
		
		form1.submit();

	});
});



		// 다음 지도 api 시작-----------------------------------------------------------------------------------------
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
			center : new daum.maps.LatLng(37.55324495357845, 126.97270338940449), // 지도의 중심좌표
			level : 5
		// 지도의 확대 레벨
		};
		//지도를 미리 생성
		var map = new daum.maps.Map(mapContainer, mapOption);
		
		//주소-좌표 변환 객체를 생성
		var geocoder = new daum.maps.services.Geocoder();
		
		// 마커표시----------------------------------------------------
		// 지도를 클릭한 위치에 표출할 마커입니다
		var marker = new kakao.maps.Marker({ 
		    // 지도 중심좌표에 마커를 생성합니다 
		    position: map.getCenter() 
		}); 
		// 지도에 마커를 표시합니다
		marker.setMap(map);
		
		// 지도에 클릭 이벤트를 등록합니다
		// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {     
		    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
		        if (status === kakao.maps.services.Status.OK) {
		            var detailAddr = !!result[0].road_address ?  result[0].road_address.address_name  : '';
		            detailAddr += result[0].address.address_name;
		            
				    // 클릭한 위도, 경도 정보를 가져옵니다 
				    var latlng = mouseEvent.latLng; 
				    
				    // 마커 위치를 클릭한 위치로 옮깁니다
				    marker.setPosition(latlng);
				    
				    // 지도의 현재 레벨을 얻어옵니다
				    mapLevel = map.getLevel();
				    
				    var  message = '또 지도 레벨은' + mapLevel + '입니다.';
				    message += '상세주소는 ' + detailAddr + '입니다';
				    address= detailAddr;
				    var resultDiv = document.getElementById('clickLatlng'); 
				    resultDiv.innerHTML = message;
				   
		        }
		    })
		    
		});
		    
    	// 좌표로 법정동 상세 주소 정보를 요청합니다
    	function searchDetailAddrFromCoords(coords, callback) {
    		geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
    	}
		
		// 지도 검색 표시---------------------------------------------------------------
		function searchDaumPostcode() {
			new daum.Postcode({
						oncomplete : function(data) {
							// 주소로 상세 정보를 검색
							geocoder.addressSearch(data.address, function(results, status) {
								// 정상적으로 검색이 완료됐으면
								if (status === daum.maps.services.Status.OK) {
									var result = results[0]; //첫번째 결과의 값을 활용
									// 해당 주소에 대한 좌표를 받아서
									var coords = new daum.maps.LatLng(result.y, result.x);
									// 지도를 보여준다.
									mapContainer.style.display = "block";
									map.relayout();
									// 지도 중심을 변경한다.
									map.setCenter(coords);
								}
							});
						}
					}).open();
		}
		
		
		function keywordSearch(){
			var keyword = $('#keyword').val();
		    var places = new kakao.maps.services.Places(map);
		    
		    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		    places.keywordSearch(keyword,callBack);
		    
			
			// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		    function callBack(keyword, status) {
		        if (status === kakao.maps.services.Status.OK) {
		        	// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		            // LatLngBounds 객체에 좌표를 추가
		            let bounds = new kakao.maps.LatLngBounds();
		            bounds.extend(new kakao.maps.LatLng(keyword[0].y, keyword[0].x));
		        	
		            map.setBounds(bounds);  // 검색된 장소 위치를 기준으로 지도 범위를 재설정
		            map.setLevel(5); 		// 검색 후 level설정
		        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
		            alert('검색 결과가 존재하지 않습니다.');
		            return;
		        } else if (status === kakao.maps.services.Status.ERROR) {
		            alert('검색 결과 중 오류가 발생했습니다.');
		            return;
		        }
		    }
		}
		
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