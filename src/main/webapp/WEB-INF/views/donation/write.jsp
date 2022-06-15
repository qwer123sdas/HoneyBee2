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
<title>Insert title here</title>
</head>
<body>
	<table class="main">
		<tr>
			<td colspan="3">
				<div class="top_title">
					<span class="light">
						<c:if test="${mode =='insert'}">글 등록하기</c:if>
						<c:if test="${mode =='update'}">글 수정하기</c:if>
					</span>
				</div>
			</td>
		</tr>
		<tr class="tr_oneLine">
			<th><span>제목</span></th>
			<td colspan="2"><div class="bottom_line"><input type="text" id="title" name="title" placeholder="제목을 입력해주세요" value="${title}"></div></td>
		</tr>
		<tr class="tr_oneLine">
			<th><span>작성자</span></th>
			<td colspan="2"><div class="bottom_line"><input readonly="readonly" id="agency" name="agency" value="${login.username}"></div></td>
		</tr>
	
		<tr class="tr_oneLine">
			<th>카테고리 분류</th>
			<td style="width: 40%;">
				<label>
					<input type="radio" id="fund" name="cate" value="fund" onclick="showTopicSelect()">같이기부
				</label>
				<!-- 모음중/모음후기/나눔캠페인 관련 카테고리 -->
	 			<select id="topic" name="topic" class="topic" onclick="showSubTopicSelect()">
					<option value="0">카테고리 선택</option>
					<option value="1">모금중</option>
					<option value="2">모금후기</option>
				</select> 
				<!-- '모금중'일 경우 주제 선택 -->
				<select id="subtopic" name="subtopic" class="subtopic">
					<option value="0">주제 선택</option>
					<option value="A">어린이</option>
					<option value="B">지구촌</option>
				</select>
			</td>
			<td>
				<label><input type="radio" name="cate" id="prom" value="prom" onclick="showTopicSelect()">프로모션</label>
			</td>
		</tr>
		<tr class="tr_oneLine" id="price" style="display:<c:if test="${cate != 'fund'}">none</c:if>">
			<th><span>목표 금액</span></th>
			<td colspan="2"><div class="bottom_line"><input type="text" name="price" placeholder="단위를 제외한 숫자를 적어주세요 (ex. 1000000)" value="${price}" autocomplete="off"></div></td>
		</tr>
		<tr class="tr_oneLine" id="pricestate" style="display:<c:if test="${cate != 'fund' && topic != '2'}">none</c:if>">
			<th><span>기부 받은 금액</span></th>
			<td colspan="2"><div class="bottom_line"><input type="text" name="pricestate" placeholder="단위를 제외한 숫자를 적어주세요 (ex. 1000000)" value="${pricestate}" autocomplete="off"></div></td>
		</tr>
		<tr class="tr_oneLine">
			<th>썸네일 등록</th>
			<td colspan="2"><div class="bottom_line"><input type="file" id="image0" name="image0" value="${image0}">${image0}</div></td>
		</tr>
		<tr class="tr_oneLine">
			<th>주제1</th>
			<td colspan="2"><div class="bottom_line"><input type="text" id="head1" name="head1" placeholder="주제를 입력해주세요" value="${head1}"></div></td>
		</tr>
		<tr>
			<th>본문1</th>
			<td colspan="2"><textarea name="body1" placeholder="내용을 입력해주세요">${body1}</textarea></td>
		</tr>
		<tr>
			<th class="tr_oneLine">이미지1</th>
			<td colspan="2"><div class="bottom_line"><input type="file" id="image1" name="image1" value="${image1}">${image1}</div></td>
		</tr>
		<tr class="tr_oneLine">
			<th>첨부영상</th>
			<td colspan="2"><div class="bottom_line"><input type="text" id="youtube1" name="youtube1" value="${youtube1}" placeholder="유튜브 url을 입력해주세요"></div></td>
		</tr>
		<tr id="tag_wrap">
			<th class="tr_oneLine">태그 설정</th>
			<td colspan="2">
				<div class="input_tag"><input type="text" name="tag1" value="${tag1}" placeholder="태그1 (필수)"></div>
				<div class="input_tag"><input type="text" name="tag2" value="${tag2}" placeholder="태그2 (선택)"></div>
				<div class="input_tag"><input type="text" name="tag3" value="${tag3}" placeholder="태그3 (선택)"></div>
			</td>
		</tr>
		<tr class="tr_oneLine" id="enddate_wrap">
			<th>종료일</th>
			<td colspan="2"><div class="bottom_line"><input type="text" id="enddate" name="enddate" placeholder="종료일을 선택해주세요" value="${enddate}" autocomplete="off"></div></td>
		</tr>
	
	</table>
	<form action="${appRoot }/donation/board_write" method="POST" enctype="multipart/form-data">
		<label for="">제목</label>
		<input type="text" name="title"/>
		<br />
		<label for="">테그 내용</label>
		<!-- '모금중'일 경우 주제 선택 -->
		<select id="subtopic" name="subtopic" class="subtopic">
			<option value="0">주제 선택</option>
			<option value="A">어린이</option>
			<option value="B">지구촌</option>
		</select>
		<br />
		
		<label for="">내용</label>
		<input type="text" name="content"/>
		<br />
		<label for="">마감날짜</label>
		<input type="date" name="expired"/>
		<br />
		<label for="">목표금액</label>
		<input type="number" name="goal"/>

		<br />
		<label for="">메인사진 등록</label>
		<input type="file" name="mainPhoto" accept="image/*" /> 
		
		
		
		<button>제출</button>
	</form>
</body>
</html>