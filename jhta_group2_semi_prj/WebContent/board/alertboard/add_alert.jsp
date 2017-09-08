<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="pro.notice.vo.Notice"%>
<%@page import="pro.board.dao.AlertBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String title = request.getParameter("title");
	String type = request.getParameter("type");
	String contents = request.getParameter("contents");
	
	AlertBoardDao adao = AlertBoardDao.getInstance();
	
	Notice notice = new Notice();
	
	notice.setTitle(title);
	notice.setContent(contents);
	notice.setActive("Y");
	
	adao.addAlertBoard(notice);
	
	response.sendRedirect("/jhta_group2_semi_prj/board/alertboard/alertboard.jsp");
	
%>