<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ attribute name="current"%>

   		<div class="col-3 mt-5">
				<h1>마이 페이지</h1>
				<ul class="list-group">
					<li class="list-group-item list-group-item-action"><a
						href="${memberInfoUrl }">회원 정보 변경</a></li>
						<li class="list-group-item list-group-item-action"><a
						href="#">기부 목록</a></li>
					<li class="list-group-item list-group-item-action"><a
						href="#">기부 리뷰</a></li>
					<li class="list-group-item list-group-item-action"><a
						href="faqList">상담내역</a></li>
				</ul>
			</div>