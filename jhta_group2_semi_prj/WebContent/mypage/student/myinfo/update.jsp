<%@page import="pro.mypage.dao.MypageStudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/mypage/student/logincheck.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String password1 = request.getParameter("userpassword-1");
	String password2 = request.getParameter("userpassword-2");
	if(!password1.equals(password2)) {
		response.sendRedirect("update-myinfo.jsp?fail=1");
		return;
	}
	
	String secondPhoneNo = request.getParameter("userphone-2");
	String thirdPhoneNo = request.getParameter("userphone-3");
	String phone = request.getParameter("userphone-1") + "-" 
					+ secondPhoneNo + "-" 
					+ thirdPhoneNo;
	if(secondPhoneNo.length() < 3 || thirdPhoneNo.length() < 4) {
		response.sendRedirect("update-myinfo.jsp?fail=2");
		return;		
	}
	
	student.setPwd(password2);
	student.setPhone(phone);
	MypageStudentDao.getInstance().updateMyInfo(student);
	
	response.sendRedirect("update-myinfo.jsp?success");
%>