<%@page import="pro.user.vo.User"%>
<%@page import="pro.mypage.dao.MypageLecturerDao"%>
<%@page import="pro.lecturer.vo.Lecturer"%>
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
	
	Student loginedUser1 = stuDao.getStudentByEmail(student.getEmail());
	
	Lecturer lecturer = new Lecturer();
	lecturer.setType("l");
	lecturer.setEmail("gamchan@naver.com");
	lecturer.setPwd("zxcv1234");
	MypageLecturerDao lecDao = MypageLecturerDao.getInstance();
	
	Lecturer loginedUser2 = lecDao.getLecturerByEmail(lecturer.getEmail());
	
	User user = new User();
	user.setName("운영자");
	user.setType("a");
	
	//session.setAttribute("userType", student.getType());
	//session.setAttribute("loginedUser", loginedUser1);
	//session.setAttribute("userType", lecturer.getType());
	//session.setAttribute("loginedUser", loginedUser2);
	session.setAttribute("userType", user.getType());
	session.setAttribute("loginedUser", user);
%>
