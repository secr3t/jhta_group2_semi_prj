<%@page import="pro.student.vo.Student"%>
<%@page import="pro.student.dao.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String id = request.getParameter("user-id");
	String pwd = request.getParameter("user-pwd");
	
	StudentDao studentDao = new StudentDao();
	Student student = studentDao.getStudentByEmail(id);
	
	
%>