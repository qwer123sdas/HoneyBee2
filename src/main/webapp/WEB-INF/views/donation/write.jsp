<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--font-awesome  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!--bootstrap  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!--Jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
<!-- Bulma  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
<!-- summernote  -->
 <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	
	<form action="${appRoot }/donation/board/write" method="POST" enctype="multipart/form-data">
		<label for="">제목</label>
		<input type="text" name="title"/>
		<br />
		<label for="">주제 내용</label>
		<!-- '모금중'일 경우 주제 선택 -->
		<select id="subtopic" name="topic" class="subtopic">
			<option value="0">주제 선택</option>
			<option value="1">어린이</option>
			<option value="2">장애인</option>
			<option value="3">어려운 이웃</option>
			<option value="4">환경</option>
		</select>
		<br />
		
		<label for="">내용</label>
		<textarea class="textarea"  id="summernote" name="content"> </textarea>
		<br />
		<label for="">마감날짜</label>
		<input type="date" name="expired"/>
		<br />
		<label for="">목표금액</label>
		<input type="number" name="goal"/>
		
		<br />
		<label for="">메인사진 등록</label>
		<input type="file" name="mainPhoto" accept="image/*" /> 
		<br />
		<label for="">태그</label>
		<div class="input_tag"><input type="text" name="hashTagLump" placeholder="태그All"></div>
		<input type="hidden" name="folderName" />
		<button>제출</button>
	</form>
</body>
<script>
//여기 아래 부분
const randomNum = Math.floor(Math.random() * 1000000000);
$('#folderName').val(randomNum);

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
	});
</script>
</html>