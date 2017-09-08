<%@page import="pro.tech.vo.Tech"%>
<%@page import="pro.board.dao.TechBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String title = request.getParameter("title");
	int qtypeNo = Integer.parseInt(request.getParameter("questiontype"));
	
	/* 결제이면 (1) 빨간색, 이용이면(2) 파란색 */

	String contents = request.getParameter("contents");
	
	TechBoardDao tdao = TechBoardDao.getInstance();
	Tech tech = new Tech();
	tech.setTitle(title);
	tech.setQuesContent(contents);
	tech.setQtypeNo(qtypeNo);
	
	tdao.addTechBoard(tech);
	
	
	response.sendRedirect("/jhta_group2_semi_prj/board/personalqna/personalqnaboard.jsp");
	
%>