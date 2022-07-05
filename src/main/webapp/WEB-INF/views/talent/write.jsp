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
<!-- summernote  -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">


<title>재능 공유 게시글 작성</title>
</head>
<style>
.map_wrap {
	position: relative;
	width: 80%;
	height: 400px;
}


</style>
<body>
	<form id="talentWriteForm" method="POST" onsubmit="return checks()" enctype="multipart/form-data">
		<div class="tr_oneLine">
			<div>카테고리 분류</div>
			<div style="width: 40%;">
				<select id="topic" class="topic" name="mainCategory">
					<option class="selectTopic" value="">카테고리 선택</option>
					<option class="selectTopic" value="1">문서, 취업</option>
					<option class="selectTopic" value="2">생활, 레슨</option>
					<!-- <option class="selectTopic" value="3">IT, 프로그래밍</option>
					<option class="selectTopic" value="4">콘텐츠 제작</option>
					<option class="selectTopic" value="5">핸드메이드</option>
					<option class="selectTopic" value="6">마켓팅</option>
					<option class="selectTopic" value="7">기타</option> -->
				</select> 
				<select id="subtopic" class="subtopic">
					<option value="0">주제 선택1</option>
				</select>
				
			</div>
			<br />
		</div>
		<label for="">메인사진</label> 
		<br />
		<a href="javascript:void(0);" onclick="$('#imgUpload').trigger('click')" class="imgUploadBtn">
			<img src="${appRoot }/resources/600x400image.jpg" id="imgChange" alt="메인 사진 업로드" >
		</a>
		<input type="file" id="imgUpload"  name="mainPhoto" style="display:none"  accept="image/*">
		<br />
		
		<label for="">게시글 제목</label> 
		<input type="text" id="title"/> <br /> 
		
		<label for="">내용</label>
		<textarea class="textarea"  id="summernote"> </textarea>
		<br />
		<label for="">판매 물품 이름</label>
		<input type="text" id="productName"/>
		<div>
			<label>
				<input type="radio" id="pay" name="pay" value="pay" onclick="showPriceSelect()">유료
			</label>
			<label>
				<input type="radio" id="free" name="pay" value="free" onclick="showPriceSelect()">무료
			</label>
		</div>
		<label for="">가격</label> 
		<input class="d-none" type="number" id="price" value="0"/> <br />
		<br />
		<label for="">수업& 작업 내용</label><br />
		<textarea id="" cols="30" rows="10"></textarea>
		<br />
        <div id="box">
            <input type="text" class="classContent"> <input type="button" value="추가" onclick="add_textbox()">
        </div>
		<input type="button" onclick="add_click()">


		<label for="">지도</label>
		<input type="text" class="form-control" id="keyword"/>
		<button type="button" onclick="keywordSearch()">검색</button>
		<div class="map_wrap">
			<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
			<p>주소 : </p><div id="clickLatlng"></div>  <!-- 주소 기록 -->
		</div>
		<br />
		
		​<br /> <br /> 
		<p>옵션 선택</p>
		<div>
			<label>
				<input type="radio" name="option" value="workDateFrom" onclick="showOptionSelect()">작업기간
			</label>
			<label>
				<input type="radio" name="option" value="numberOfPeopleForm" onclick="showOptionSelect()">인원수
			</label>
		</div>
		<div id="workDateFrom"   style="visibility: hidden;">
			<label for="">작업기간</label>
				<input type="number" id="workDate" />
			</div>
		<br />
		<div id="numberOfPeopleForm"  style="visibility: hidden;">
			<label for="">인원수</label> 
				<input type="number" id="numberOfPeople"/>
			</div>
		<br /> 
		
		
		<label for="">태그</label> 
		<input type="text" name="hashTag" />
		<br /> 
		<label for="">자기소개</label> <br />
		<textarea id="selfIntroduction" cols="30" rows="10"></textarea>
		<br />
		<input type="hidden" id="jsonByTalent" name="jsonByTalent"/>
		<input type="hidden" id="folderName" name="folderName" />
		<button id="insertTalent"  type="submit" value="저장">저장</button>
	</form>
	
	
	<!--Jquery -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
	<!-- summer note  -->
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<!-- 다음 지도 api -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=db07c80911dd129fb861fb567a80ab0c&libraries=services"></script>
	<script>
		/* 폴더명 */
		const randomNum = Math.floor(Math.random() * 1000000000);
		$('#folderName').val('padding-' + randomNum);
		//메인 카테고리 셋팅
	    
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
				$('#free').css("visibility", "visible");
				$('#pay').css("visibility", "hidden");
				$('#price').attr('readonly', true);
				document.getElementById("price").value=0;
			}else{
				$('#pay').css("visibility", "visible");
				$('#free').css("visibility", "hidden");
				$("#price").attr('readonly', false);
			}
		}
		
		// 옵션 선택(작업일 & 인원수)
		function showOptionSelect(){
			var nameVal = $('input:radio[name=option]:checked').val();
			console.log(nameVal);
			if(nameVal == 'workDateFrom'){
				$('#workDateFrom').css("visibility", "visible");
				$('#numberOfPeopleForm').css("visibility", "hidden");
			}else{
				$('#numberOfPeopleForm').css("visibility", "visible");
				$('#workDateFrom').css("visibility", "hidden");
			}
		}
		
		// 항목 생성
		const add_textbox = () => {
            const box = document.getElementById("box");
            const newP = document.createElement('p');
            newP.innerHTML = "<input type='text' class='classContent'> <input type='button' value='삭제' onclick='remove(this)'>";
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
	            data.append("folderId", 'padding-'+randomNum); // 폴더 난수 넘기기
	            $.ajax({
	                url: '${appRoot}/uploadImageToS3ForSummerNote/talent',
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
						  'workDate' : document.getElementById("workDate").value,
						  'numberOfPeople' : document.getElementById("numberOfPeople").value,
						  'selfIntroduction' : document.getElementById("selfIntroduction").value,
						  'classContent' : classContentList
						  }
				console.log(data);
				// json으로 바꿔줌
				$('#jsonByTalent').val(JSON.stringify(data));
				
				let form1 = $("#talentWriteForm");
				let actionAttr = "${appRoot }/talent/write";
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
		
		
	</script>
</body>

</html>