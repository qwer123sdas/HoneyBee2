<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ attribute name="current"%>

<style>
#toggleButton.btn.btn-primary {
	float: right;
	background-color: rgba(0,0,0,0);
	border: 0;
	font-size: 30px;
}
.offcanvasLeft {
	text-align: center;
	font-family: "Apple SD Gothic Neo", "Malgun Gothic", sans-serif;
	font-weight: 500;
	color: #fff !important;
}

</style>

<button class="btn btn-primary" type="button" data-bs-toggle="offcanvas"
	data-bs-target="#offcanvasRight" aria-controls="offcanvasRight" id="toggleButton">
	<i class="fa-solid fa-bars"></i></button>

<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight"
	aria-labelledby="offcanvasRightLabel">
	<div class="offcanvas-header">
		<h3 id="offcanvasRightLabel">마이페이지</h3>
		<button type="button" class="btn-close text-reset"
			data-bs-dismiss="offcanvas" aria-label="Close"></button>
	</div>
	<div class="offcanvas-body">
		<a href="${memberInfoUrl }">회원 정보 변경</a>
		<hr />
		<a href="myBoard">내가 쓴 글</a>
		<hr />
		<a href="myReview">내가 쓴 후기</a>
		<hr />
		<a href="faqList">상담내역</a>
	</div>
</div>















