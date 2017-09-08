<%@page import="pro.board.dao.TechBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	int no = Integer.parseInt(request.getParameter("no"));
 	
 	TechBoardDao tdao = TechBoardDao.getInstance();

 	tdao.deleteTechBoard(no);
 	
 	response.sendRedirect("/jhta_group2_semi_prj/board/personalqna/personalqnaboard.jsp");
 %>