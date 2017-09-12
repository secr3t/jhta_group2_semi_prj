<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="pro.lecturer.dao.LecturerDao"%>
<%@page import="pro.lecturer.vo.Lecturer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("user-name");
	String email = request.getParameter("user-email");
	String pwd = request.getParameter("user-pwd");
	String phone = request.getParameter("user-phone");
	String career = request.getParameter("user-career");
	//String picture = request.getParameter("user-picture");
	
	Lecturer lecturer = new Lecturer();
	lecturer.setName(name);
	lecturer.setEmail(email);
	lecturer.setPwd(DigestUtils.sha256Hex(pwd));
	lecturer.setPhone(phone);
	lecturer.setCareer(career);
	//lecturer.setPicture(picture);
	
	LecturerDao lecturerDao = LecturerDao.getInstance();
	Lecturer registeredUser = lecturerDao.getLecturerByEmail(email);
	
	if (registeredUser != null) {
		response.sendRedirect("registlecturerform.jsp?fail=1");
		return;
	}
	
	lecturerDao.addLecturer(lecturer);
	
	response.sendRedirect("registsuccessform.jsp");
%>