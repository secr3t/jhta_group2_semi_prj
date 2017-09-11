<%@page import="pro.student.vo.Student"%>
<%@page import="pro.user.vo.User"%>
<%@page import="pro.tech.vo.Tech"%>
<%@page import="pro.board.dao.TechBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String title = request.getParameter("title");
	int qtypeNo = Integer.parseInt(request.getParameter("questiontype"));
	String contents = request.getParameter("contents");
	
	User user = (User)session.getAttribute("loginUser");
	
	
	
	TechBoardDao tdao = TechBoardDao.getInstance();
	Tech tech = new Tech();
	Student student = new Student();
	student.setNo(user.getNo());
	tech.setTitle(title);
	tech.setQuesContent(contents);
	tech.setQtypeNo(qtypeNo);
	tech.setActive("Y");
	tech.setStudent(student);
	
	tdao.addTechBoard(tech);
	
	
	response.sendRedirect("/jhta_group2_semi_prj/board/personalqna/personalqnaboard.jsp");
	
%>