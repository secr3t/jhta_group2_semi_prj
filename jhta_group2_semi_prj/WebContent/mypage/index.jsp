<%@page import="pro.user.vo.User"%>
<%@page import="pro.mypage.dao.MypageLecturerDao"%>
<%@page import="pro.lecturer.vo.Lecturer"%>
<%@page import="pro.student.vo.Student"%>
<%@page import="pro.mypage.dao.MypageStudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/loginCheck.jsp" %>
<%

	User loginUser = (User) session.getAttribute("loginUser");
	String userType = loginUser.getType();
	
	if("S".equals(userType)) {
		response.sendRedirect("/jhta_group2_semi_prj/mypage/student/index.jsp");
		return;
	}

	if("T".equals(userType)) {
		response.sendRedirect("/jhta_group2_semi_prj/mypage/lecturer/index.jsp");
		return;
	}
	if("a".equals(userType)) {
		response.sendRedirect("/jhta_group2_semi_prj/mypage/admin/index.jsp");
		return;
	}
%>