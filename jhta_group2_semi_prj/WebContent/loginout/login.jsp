<%@page import="pro.student.vo.Student"%>
<%@page import="pro.student.dao.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// request로부터 email, pwd를 받아옴
	String email = request.getParameter("user-email");
	String pwd = request.getParameter("user-pwd");
	String returnUrl = request.getParameter("returnUrl");
	
	// dao객체를 만들어 email로 학생찾는 메소드 실행
	StudentDao studentDao = new StudentDao();
	// 그 결과로 찾은 학생객체를 uncheckedStudent에 넣음
	Student uncheckedStudent = studentDao.getStudentByEmail(email);
	
	// 그 학생객체가 제대로된 객체인지 확인
	// 학생객체가 null일 경우
	if (uncheckedStudent == null) {
		response.sendRedirect("loginform.jsp?fail=1");
		return;
	}
	// 학생객체의 pwd가 request로부터 받아온 pwd와 같은지 확인
	if (!uncheckedStudent.getPwd().equals(pwd)) {
		response.sendRedirect("loginform.jsp?fail=1");
		return;
	}
	
	// 로그인 처리
	// 세션생성 및 세션에 checkedStudent라는 이름으로 uncheckedStudent객체 넣어 생성
	session.setAttribute("loginUser", uncheckedStudent);
	
	if (returnUrl == null) {
		response.sendRedirect("/jhta_group2_semi_prj/index.html");
	} else {
		response.sendRedirect(returnUrl);
	}
	
	
%>