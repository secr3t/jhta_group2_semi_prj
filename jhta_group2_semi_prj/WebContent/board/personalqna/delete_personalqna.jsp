<%@page import="pro.board.dao.TecBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	int no = Integer.parseInt(request.getParameter("no"));
 	
 	TecBoardDao tdao = new TecBoardDao();

 	tdao.deleteTecBoard(no);
 	
 	response.sendRedirect("/jhta_group2_semi_prj/board/personalqna/personalqnaboard.jsp");
 %>