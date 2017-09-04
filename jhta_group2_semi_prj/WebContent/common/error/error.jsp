<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html lang="ko">
<%@import file="../header.jsp" %>
<body>
<%@include file="../nav.jsp" %>
<div class="container">
		<%=response.getStatus() %> error has occurred.
</div>
<%@include file="../footer.jsp" %>
</body>
</html>