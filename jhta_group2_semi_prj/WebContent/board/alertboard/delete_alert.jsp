<%@page import="pro.board.dao.AlertBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	int no = Integer.parseInt(request.getParameter("no"));
 	AlertBoardDao adao = AlertBoardDao.getInstance();
 	
 	adao.deleteAlertBoardByNo(no);
 	
 	
 	response.sendRedirect("/jhta_group2_semi_prj/board/alertboard/alertboard.jsp");
 %>