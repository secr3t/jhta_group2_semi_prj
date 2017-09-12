<%@page import="pro.mypage.dao.MypageLecturerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/mypage/lecturer/logincheck.jsp" %>    
<%
	request.setCharacterEncoding("UTF-8");
	String password1 = request.getParameter("userpassword-1");
	String password2 = request.getParameter("userpassword-2");
	if(!password1.equals(password2)) {
		response.sendRedirect("update-myinfo.jsp?fail=1");
		return;
	}
	
	String secondPhoneNo = request.getParameter("userphone-2");
	String thirdPhoneNo = request.getParameter("userphone-3");
	if(secondPhoneNo.length() < 3 || thirdPhoneNo.length() < 4) {
		response.sendRedirect("update-myinfo.jsp?fail=2");
		return;
	}
	String phone = request.getParameter("userphone-1") + "-"
							+ secondPhoneNo + "-" + thirdPhoneNo;
	String career = request.getParameter("career");
	String picture = request.getParameter("image");
	
	lecturer.setPwd(password2);
	lecturer.setPhone(phone);
	lecturer.setCareer(career);
	lecturer.setPicture(picture);
	MypageLecturerDao.getInstance().updateMyInfo(lecturer);
	
	response.sendRedirect("update-myinfo.jsp?success");
%>