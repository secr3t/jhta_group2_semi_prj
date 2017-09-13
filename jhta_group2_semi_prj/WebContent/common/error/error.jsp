<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html lang="ko">
<%@include file="../header.jsp" %>
<body>
<%@include file="../nav.jsp" %>
<div class="container">
  <div class="panel panel-danger">
    <div class="panel-body">
    <%
    String error = null;
    switch(response.getStatus()) {
    case 400 : error = "잘못된 요청 입니다."; break;
    case 401 : error = "접근 권한이 없는 페이지 입니다."; break;
    case 402 : error = "결제가 필요합니다.."; break;
    case 403 : error = "접근이 금지된 페이지 입니다."; break;
    case 404 : error = "존재하지 않는 페이지 입니다."; break;
    case 500 : error = "내부적 오류가 발생하였습니다. 관리자에게 문의해주세요."; break;
    case 503 : error = "서버가 다운되었습니다."; break;
    }
    %>
    <%=error%></div>
  </div>
</div>
<%@include file="../footer.jsp" %>
</body>
</html>