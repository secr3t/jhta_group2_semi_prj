<%@page import="pro.lecturer.vo.Lecturer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Lecturer lecturer = (Lecturer) session.getAttribute("loginedUser");
	if(lecturer == null) {
		response.sendRedirect("../index.jsp");
		return;
	}
%>