<%@page import="pro.board.dao.AfterBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%
 	int no = Integer.parseInt(request.getParameter("bno"));
 	
 	AfterBoardDao adao = new AfterBoardDao();
 	
 	adao.deleteAfterBoard(no);
 	
 	
 	response.sendRedirect("/jhta_group2_semi_prj/board/afterlecture/afterlecture.jsp");
 %>