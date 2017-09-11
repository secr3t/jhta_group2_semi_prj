<%@page import="pro.user.vo.User"%>
<%@page import="pro.board.dao.AlertBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 User loginUser = null;
	loginUser = (User) session.getAttribute("loginUser");
 
 	int no = Integer.parseInt(request.getParameter("no"));
 	AlertBoardDao adao = AlertBoardDao.getInstance();
 	
 	adao.deleteAlertBoardByNo(no);
 	
 	
 	response.sendRedirect("/jhta_group2_semi_prj/board/alertboard/alertboard.jsp");
 %>