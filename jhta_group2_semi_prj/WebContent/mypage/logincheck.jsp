<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	session.setAttribute("loginType", "s");
	
	String loginType = (String) session.getAttribute("loginType");
	if("s".equals(loginType)) {
		response.sendRedirect("mypage/student/index.jsp");
		return;
	}
	if("t".equals(loginType)) {
		response.sendRedirect("mypage/lecturer/index.jsp");
		return;
	}
%>