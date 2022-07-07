<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:url value="/resources/admin" var="resources" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="${resources }/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<link href="${resources }/css/sb-admin-2.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<script>
$(document).ready(function() {
	$("#deleteButton1").click(function(e) {
		e.preventDefault();
		if(confirm("정말 삭제하시겠습니까?")) {
			let form1 = $("#form1");
			let actionAttr = "${appRoot}/admin/removeTalent";
			form1.attr("action", actionAttr);
			
			form1.submit();
		}
	});
});
</script>

<title>재능판매게시판 내용(관리자)</title>
</head>
<body>
	<div id="wrapper">
		
		<nav:sidebar current="board"></nav:sidebar>
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			
			<!-- Main Content -->
			<div id="content">
				
				<nav:topbar></nav:topbar>
				<form id="form1" action="${appRoot }/admin/registerTalent" method="post">
					<input type="hidden" name="talentId" value="${talent.talentId }" />
				    <div class="container mt-5">
				        <div class="row">
				            <div class="col-lg-7">
				                <!-- Post content-->
				                <article>
				                    <!-- 메인사진-->
				                   	<!-- 대표 이미지-->
									<c:if test="${empty talent.MPhoto }">
										<figure class="img_ico mb-4">
											<img class="img-fluid rounded" src="https://dummyimage.com/900x400/ced4da/6c757d.jpg" alt="..." />
										</figure>
									</c:if>
									<c:if test="${not empty talent.MPhoto }">
										<figure class="mb-4">
											<img class="img-fluid" src="${imageUrl }/talent/${talent.folderName }/${talent.MPhoto}" alt="">
										</figure>
									</c:if>
				                    <!-- 메인 컨텐츠-->
				                    <section class="mb-5" id="mainContentContainer">
				                    	<p class="fs-5 mb-4">${talent.content }</p>
				                        
					                        <div class="map_wrap">
												<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
												<p>주소 : ${talent.address }</p>							</div>
					                        <!--Jquery -->
											<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
					                        <!-- 지도api -->
											<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
											<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=db07c80911dd129fb861fb567a80ab0c&libraries=services"></script>
					                        <script>
					                		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
						                		mapOption = {
						                			center : new daum.maps.LatLng(37.55324495357845, 126.97270338940449), // 지도의 중심좌표
						                			level : ${talent.mapLevel} // 지도의 확대 레벨
						                		};
					
					                		//지도를 미리 생성
					                		var map = new daum.maps.Map(mapContainer, mapOption);
					                		// 주소-좌표 변환 객체를 생성합니다
					                		var geocoder = new kakao.maps.services.Geocoder();
					                		// 행정도 주소로 좌표 검색
					                		geocoder.addressSearch('${talent.address}', function(results, status) {
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
				                    </section>
				                </article>
				                <div style="display: flex; justify-content: flex-end;">
					                <c:if test="${talent.enable == 0 }">
					                	<button id="registerButton1" class="btn btn-primary">등록허용</button>
					                </c:if>
					                <button id="deleteButton1" class="btn btn-danger">삭제</button>
				                </div>
				            </div>
				            
				            
				            <!-- Side widgets-->
				            <div class="col-lg-4">
				                <!-- Categories widget-->
				                <div class="card border-0 mb-4">
				                    <div class="card-body">
				                    	<div class="mx-3 mb-1">
				                    		<!-- Post tag--><!-- 
				                    		<div class="mb-3">
						                    	<span class="badge rounded-pill bg-warning text-dark ">태그1</span>
						                    	<span class="badge rounded-pill bg-warning text-dark">태그2</span>
					                    	</div> -->
					                    	<!-- Post title-->
				                        	<h4 class="fw-bolder mb-3">${talent.title }</h4>
				                        	<!-- Post progressbar-->
											<div class="mb-5">
											</div>
											${talent.price }원
				                    	</div>
				                    </div>
				                </div>
				                <!-- Side widget-->
				                <div class="card border-1 mx-4 mb-4">
				                	<div>
				                		<div class="card-body pb-0">
				                			<p>작성자 : ${talent.nickname }</p>
				                			<p>소개</p>
				                			<p> ${talent.selfIntroduction }</p>
				                		</div>
				                	</div>
				                </div>
				            </div>
				        </div>
			     	</div>
		     	</form>
			</div>
		</div>
	</div>
	
	
	<!-- Bootstrap core JavaScript-->
    <script src="${appRoot }/resources/admin/vendor/jquery/jquery.min.js"></script>
    <script src="${appRoot }/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${appRoot }/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${appRoot }/resources/admin/js/sb-admin-2.min.js"></script>
</body>
</html>