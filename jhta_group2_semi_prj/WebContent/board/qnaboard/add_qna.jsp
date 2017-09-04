<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	
	
	response.sendRedirect("/jsp-practice/board/form.jsp");
	
%>