<%@page import="qtype.dao.QtypeDao"%>
<%@page import="pro.tech.vo.Tech"%>
<%@page import="pro.board.dao.TecBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String title = request.getParameter("title");
	String qtype = request.getParameter("questiontype");
	
	int qtypeNo = QtypeDao.getInstance().getQtypeNoByQtype(qtype);
	
	/* 결제이면 (1) 빨간색, 이용이면(2) 파란색 */
	
	
	String contents = request.getParameter("contents");
	
	TecBoardDao tdao = new TecBoardDao();
	Tech tech = new Tech();
	tech.setTitle(title);
	tech.setQuesContent(contents);
	
	tdao.AddTecBoard(tech);
	
	response.sendRedirect("/jhta_group2_semi_prj/board/personalqna/personalqnaboard.jsp");
	
%>