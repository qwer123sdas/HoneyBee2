<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--font-awesome  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!--bootstrap  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css"
	integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Bulma  -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
<title>Insert title here</title>
</head>
<style>
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 18px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 400px;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 250px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.001);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}
</style>
<body>
	<form onsubmit="return checks()">
		<div class="tr_oneLine">
			<div>카테고리 분류</div>
			<div style="width: 40%;">
				<label> <input type="radio" id="fund" name="cate"
					value="fund" onclick="showTopicSelect()">같이기부
				</label> <br /> <select id="topic" name="topic" class="topic" id="topic"
					onclick="showSubTopicSelect()">
					<option value="">카테고리 선택</option>
					<option value="1">하루 무료 특강</option>
					<option value="2">재능 판매</option>
				</select> <br /> <select id="subtopic" name="subtopic" class="subtopic">
					<option value="0">주제 선택</option>
					<option value="A">어린이</option>
					<option value="B">지구촌</option>
				</select>
			</div>
			<br />
		</div>
		<label for="">제목</label> 
		<input type="text" name="title" id="title"/> <br /> 
		
		<label for="">내용</label> 
		<input type="text" name="content" id="content"/> <br />
		
		<div>
			<label><input type="radio" name="cate" id="prom" value="prom"
				>가격</label>
		</div>
		<div>
			<label>
				<input type="radio" name="cate" id="prom" value="prom" >무료
			</label>
		</div>
		<label for="">가격</label> 
		<input type="number" name="price" id="price"/> <br />
		<label for="">종료기간</label>
		<input type="date" name="expired" id="expired"/> <br />
		
		<br /> 
		<label for="">지도</label>
		<div class="map_wrap">
			<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
			<div id="clickLatlng"></div>
			<div id="menu_wrap" class="bg_white">
		        <div class="option">
			        <div>
						<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
					</div>
				</div>
			</div>
		</div>
		<br />
		<br />
		<label for="">주소</label>
		<p id="address"></p>
		<br />
		
		​ <br /> <br /> 
		<label for="">인원제한</label> 
		<input type="number" />
		<br /> 
		<label for="">태그</label> 
		<input type="text" name="hashTag" />
		<br /> 
		<button id="insertTalent"  type="submit" value="저장">저장</button>
	</form>
	
	
	<!--Jquery -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
	<!-- 다음 지도 api -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=db07c80911dd129fb861fb567a80ab0c&libraries=services"></script>
	<script>
	
		var latitude;
		var longitude;
		var mapLevel;
		var address;
		$(document).ready(function(){
			// 값 불러오기  // value 불러오기

			
			function checks() {
				var title = document.getElementById("title").value;
				var content = document.getElementById("content").value;
				var topic = document.getElementById("topic").value;
				var price = document.getElementById("price").value;
				
				//var hashTag = document.getElementById("").value;
				if (title != "" && content != "" && topic != "" && price != "") {
					console.log("1 : " + title);
					return true;
				} else {
					alert("전부 입력해야 합니다..");
					console.log("2 " + title);
					return true;
				}
			}
			function constructTalentData(){
				const data = {'title' : document.getElementById("title").value,
							  'content' : document.getElementById("content").value,
							  'topic' : document.getElementById("topic").value,
							  'price' : document.getElementById("price").value,
							  'expired' : document.getElementById("expired").value,
							  'latitude' : latitude,
							  'longitude' : longitude,
							  'mapLevel' : mapLevel,
							  'address' : address
							  }
				
				return data;
			}
			$("#insertTalent").click(function(e) {
				console.log("여기까지 옴");
				console.log(document.getElementById("address").value);
				e.preventDefault();
				if(checks()){
					var data = constructTalentData();
					console.log("이프");
					$.ajax({
						url : '${appRoot }/talent/write',
						type : 'POST',
						data : JSON.stringify(data),
						dataType: "JSON", //응답받을 데이터 타입 (XML,JSON,TEXT,HTML,JSONP) 
						contentType: "application/json; charset=utf-8",//헤더의 Content-Type을 설
						success : function(){
							console.log("성공");
						}
					})
				}

			});
		})
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
			center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
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
		    
		    // 클릭한 위도, 경도 정보를 가져옵니다 
		    var latlng = mouseEvent.latLng; 
		    
		    // 마커 위치를 클릭한 위치로 옮깁니다
		    marker.setPosition(latlng);
		    
		    latitude = latlng.getLat();
		    longitude = latlng.getLng();
		    // 지도의 현재 레벨을 얻어옵니다
		    mapLevel = map.getLevel();
		    
		    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
		    message += '경도는 ' + latlng.getLng() + ' 입니다';
		    message += '또 지도 레벨은' + mapLevel + '입니다.';
		    
		    var resultDiv = document.getElementById('clickLatlng'); 
		    resultDiv.innerHTML = message;
		   
		    
		});
		
		// 지도 검색 표시---------------------------------------------------------------
		function sample5_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var fullAddr = data.address; // 최종 주소 변수
							var extraAddr = ''; // 조합형 주소 변수

							// 기본 주소가 도로명 타입일때 조합한다.
							if (data.addressType === 'R') {
								//법정동명이 있을 경우 추가한다.
								if (data.bname !== '') {
									extraAddr += data.bname;
								}
								// 건물명이 있을 경우 추가한다.
								if (data.buildingName !== '') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
								fullAddr += (extraAddr !== '' ? ' ('
										+ extraAddr + ')' : '');
								document.getElementById("address").innerHTML = fullAddr; // 주소 넣기
								address= fullAddr;
							}

							
							// 주소로 상세 정보를 검색
							geocoder
									.addressSearch(
											data.address,
											function(results, status) {
												// 정상적으로 검색이 완료됐으면
												if (status === daum.maps.services.Status.OK) {

													var result = results[0]; //첫번째 결과의 값을 활용

													// 해당 주소에 대한 좌표를 받아서
													var coords = new daum.maps.LatLng(
															result.y,
															result.x);
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
	</script>
</body>

</html>