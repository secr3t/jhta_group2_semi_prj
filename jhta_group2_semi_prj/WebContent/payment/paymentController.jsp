<%@page import="pro.point.dao.PointDao"%>
<%@page import="java.util.Date"%>
<%@page import="pro.point.vo.Point"%>
<%@page import="pro.student.dao.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../common/nav.jsp" %>
<% 

	StudentDao studentDao = StudentDao.getInstance();
	Student student = (Student)loginUser;
	PointDao pointDao = PointDao.getInstance();
	
	int paymentpoint = Integer.parseInt(request.getParameter("paymentpoint"));
	int newpoint = student.getPoint()+paymentpoint;
	
	student.setPoint(newpoint);
	Point point = new Point();
	point.setDate(new Date());
	point.setHistory("충전");
	point.setPayment(paymentpoint);
	point.setStudent(student);
	System.out.println(student);
	System.out.println(point);
	
	pointDao.addPoint(point);
	
	studentDao.updateStudent(student);
	
	response.sendRedirect("/jhta_group2_semi_prj/index.jsp");

%>