<%@page import="pro.utils.StringUtils"%>
<%@page import="pro.dept.vo.Dept"%>
<%@page import="pro.course.vo.Course"%>
<%@page import="pro.mypage.dao.MypageLecturerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/mypage/lecturer/logincheck.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("coursename");
	if("".equals(name)) {
		response.sendRedirect("applyform.jsp?fail=1");
		return;
	}
	
	int deptNo = StringUtils.changeIntToString(request.getParameter("coursedept"));
	if(deptNo == 0) {
		response.sendRedirect("applyform.jsp?fail=2");
		return;
	}
	
	int point = StringUtils.changeIntToString(request.getParameter("coursepoint"));
	if(point >= 1000) {
		response.sendRedirect("applyform.jsp?fail=3");
		return;
	}

	String summary = request.getParameter("coursesummary");
	if("".equals(summary)) {
		response.sendRedirect("applyform.jsp?fail=4");
		return;		
	}
	
	String detail = request.getParameter("courseinfo");
	
	Dept dept = new Dept();
	dept.setNo(deptNo);
	
	Course course = new Course();
	course.setName(name);
	course.setPoint(point);
	course.setSummary(summary);
	course.setDetail(detail);
	course.setDept(dept);
	course.setLecturer(lecturer);
	
	MypageLecturerDao.getInstance().addCourse(course);
	
	response.sendRedirect("applyform.jsp?success");
%>