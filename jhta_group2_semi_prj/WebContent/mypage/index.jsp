<%@page import="pro.mypage.dao.MypageLecturerDao"%>
<%@page import="pro.lecturer.vo.Lecturer"%>
<%@page import="pro.student.vo.Student"%>
<%@page import="pro.mypage.dao.MypageStudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="temp-login.jsp"%>
<%
	if(session.getAttribute("loginedUser") == null) {
		response.sendRedirect("#");
		return;
	}
	
	String userType = (String) session.getAttribute("userType");
	
	if("s".equals(userType)) {
		response.sendRedirect("/jhta_group2_semi_prj/mypage/student/index.jsp");
		return;
	}

	if("t".equals(userType)) {
		response.sendRedirect("/jhta_group2_semi_prj/mypage/lecturer/index.jsp");
		return;
	}
%>