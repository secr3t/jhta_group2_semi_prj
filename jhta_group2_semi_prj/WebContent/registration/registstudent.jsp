<%@page import="pro.student.dao.StudentDao"%>
<%@page import="pro.student.vo.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("user-name");
	String email = request.getParameter("user-email");
	String pwd = request.getParameter("user-pwd");
	String phone = request.getParameter("user-phone");
	
	Student student = new Student();
	student.setName(name);
	student.setEmail(email);
	student.setPwd(pwd);
	student.setPhone(phone);
	
	StudentDao studentDao = StudentDao.getInstance();
	Student registeredStudent = studentDao.getStudentByEmail(email);
	
	if (registeredStudent != null) {
		response.sendRedirect("");
		return;
	}
	
	studentDao.getInstance().addStudent(student);
	
	response.sendRedirect("registsuccessform.jsp");
%>