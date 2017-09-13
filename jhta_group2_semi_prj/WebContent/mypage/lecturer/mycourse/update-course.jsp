	<%@page import="pro.mypage.dao.MypageCourseDao"%>
<%@page import="pro.utils.StringUtils"%>
<%@page import="pro.course.vo.Course"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int courseNo = StringUtils.changeIntToString(request.getParameter("cno"));
	String summary = request.getParameter("coursesummary");
	String detail = request.getParameter("coursedetail");
	
	MypageCourseDao courDao = MypageCourseDao.getInstance();
	
	Course course = courDao.getCourseByCourseNo(courseNo);
	course.setSummary(summary);
	course.setDetail(detail);
	
	courDao.updateCourseInfo(course);
	
	response.sendRedirect("course-info.jsp?cno=" + courseNo);
%>