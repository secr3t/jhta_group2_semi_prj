<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@include file="../common/header.jsp" %>
<body>
<%@include file="../common/nav.jsp" %>
<!--  왼쪽 메뉴 부분은 상의하여 각 페이지마다 메뉴를 불러올 것인지 각 페이지의
 left-menu.jsp를 만들어서 사용할 것인지 논의가 필요함.(사실 상 mypage 부분을 제외하고는 거의 겹친다고 보면됨.)
 -->
 <%@include file="left-menu.jsp" %>
<div class="container">
<%@include file="../main/body.jsp" %>
</div>
<%@include file="../common/footer.jsp" %>
</body>
</html>