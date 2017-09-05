<%@page import="pro.student.vo.Student"%>
<%@page import="pro.mypage.dao.MypageStudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Student student = new Student();
	student.setType("s");
	student.setEmail("gildong@gmail.com");
	student.setPwd("zxcv1234");
	MypageStudentDao stuDao = MypageStudentDao.getInstance();
	
	Student loginedUser = stuDao.getStudentByEmail(student.getEmail());
	session.setAttribute("userType", student.getType());
	session.setAttribute("loginedUser", loginedUser);
%>
