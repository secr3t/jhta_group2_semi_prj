<%@page import="pro.lecturer.dao.LecturerDao"%>
<%@page import="pro.lecturer.vo.Lecturer"%>
<%@page import="pro.student.vo.Student"%>
<%@page import="pro.student.dao.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%

	String id = request.getParameter("user-id");
	String pwd = request.getParameter("user-pwd");
	String type = request.getParameter("login-type");
	
	Object dao = new Object();
	Object user = new Object();	
	
	if("student".equals(type)){
		dao = StudentDao.getInstance();
		user = new Student();
		user = ((StudentDao)dao).getStudentByEmail(id);
		if(user != null){
			session.setAttribute("loginUser", user);
			session.setAttribute("type", "student");
		} else {
			// javascript를 이용하여 alert를 띄우고 확인을 클릭하면 login page로 돌아가게한다.
			%>
			<script>
			window.location.href="login.jsp";
			 alert('잘못된 로그인 시도입니다. ID와 로그인 구분을 확인해주세요.');
			</script>
						<%
		}
	} else if ("lecturer".equals(type)){
		dao = LecturerDao.getInstance();
		user = new Lecturer();
		user = ((LecturerDao)dao).getlecturerByEmail(id);
		if(user != null){
			session.setAttribute("loginUser", user);
			session.setAttribute("type", "lecturer");
		} else {
			%>
			<script>
			window.location.href="login.jsp";
			 alert('잘못된 로그인 시도입니다. ID와 로그인 구분을 확인해주세요.');
			</script>
						<%
		}
	} else {
		// User가 악의적으로 해당 jsp 페이지로 이동할 경우에 대한 방어 코딩
		response.sendError(400);
	}
%>