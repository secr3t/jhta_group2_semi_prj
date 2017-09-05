<%@page import="pro.notice.vo.Notice"%>
<%@page import="pro.board.dao.AlertBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String title = request.getParameter("title");
	String type = request.getParameter("type");
	String contents = request.getParameter("contents");
	
	AlertBoardDao adao = new AlertBoardDao();
	Notice notice = new Notice();
	notice.setTitle(title);
	notice.setContent(contents);
	
	adao.AddAlertBoard(notice);
	
	response.sendRedirect("/jhta_group2_semi_prj/board/alertboard/alertboard.jsp");
	
%>