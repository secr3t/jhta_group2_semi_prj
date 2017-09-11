<%@page import="pro.course.vo.Course"%>
<%@page import="pro.mypage.dao.MypageCourseDao"%>
<%@page import="pro.utils.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int courseNo = StringUtils.changeIntToString(request.getParameter("cno"));
	String changeNo = request.getParameter("change");
	MypageCourseDao courDao = MypageCourseDao.getInstance();
	Course course = courDao.getCourseByCourseNo(courseNo);
	
	final String CHANGE_CODE_ADMIT = "1";
	final String CHANGE_CODE_CANCEL = "2";
	
	if(CHANGE_CODE_ADMIT.equals(changeNo)) {
		course.setPermit("Y");
	} else {
		course.setPermit("N");
	}
	
	courDao.updateCourseInfo(course);
	
	response.sendRedirect("course-detail.jsp?cno=" + courseNo);
%>