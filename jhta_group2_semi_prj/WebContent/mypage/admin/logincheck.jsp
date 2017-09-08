<%@page import="pro.user.vo.User"%>
<%@page import="pro.lecturer.vo.Lecturer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	User user = (User) session.getAttribute("loginedUser");
	if(user == null) {
		response.sendRedirect("../index.jsp");
		return;
	}
%>