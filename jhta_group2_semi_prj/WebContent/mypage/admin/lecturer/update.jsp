<%@page import="pro.mypage.dao.MypageLecturerDao"%>
<%@page import="pro.lecturer.vo.Lecturer"%>
<%@page import="pro.utils.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int lecturerNo = StringUtils.changeIntToString(request.getParameter("lno"));
	String changeNo = request.getParameter("change");
	MypageLecturerDao lecDao = MypageLecturerDao.getInstance();
	Lecturer lecturer = lecDao.getLecturerByNo(lecturerNo);
	
	final String CHANGE_CODE_ADMIT = "1";
	final String CHANGE_CODE_CANCEL = "2";
	
	if(CHANGE_CODE_ADMIT.equals(changeNo)) {
		lecturer.setPermit("Y");
	} else {
		lecturer.setPermit("N");
	}
	
	lecDao.updateMyInfo(lecturer);
	
	response.sendRedirect("lecturer-detail.jsp?lno=" + lecturerNo);
%>