<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url value="/main" var="mainPageUrl"></c:url>
<c:url value="/member/about" var="aboutUrl"></c:url>
<c:url value="/faq/question" var="questionUrl"></c:url>
<c:url value="/faq/insert" var="faqInsertUrl"></c:url>

<!-- Footer Start -->
<div class="container">
  <footer class="py-3 my-4">
    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
      <li class="nav-item"><a href="${mainPageUrl }" class="nav-link px-2 text-muted">홈</a></li>
      <li class="nav-item"><a href="${aboutUrl }" class="nav-link px-2 text-muted">꿀비</a></li>
      <li class="nav-item"><a href="${faqInsertUrl }" class="nav-link px-2 text-muted">FAQ</a></li>
      <li class="nav-item"><a href="${questionUrl }" class="nav-link px-2 text-muted">고객센터</a></li>
    </ul>
    <br />
    <p class="text-center text-muted">서울특별시 강남구 테헤란로7길 7</p>
    <p class="text-center text-muted">Copyright &copy; 2022 Honeybee</p>
  </footer>
</div>
    <!-- Footer End -->