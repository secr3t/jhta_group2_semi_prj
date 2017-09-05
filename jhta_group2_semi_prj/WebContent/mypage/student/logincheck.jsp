<%@page import="pro.student.vo.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Student student = (Student) session.getAttribute("loginedUser");
	if(student == null) {
		response.sendRedirect("../index.jsp");
		return;
	}
%>