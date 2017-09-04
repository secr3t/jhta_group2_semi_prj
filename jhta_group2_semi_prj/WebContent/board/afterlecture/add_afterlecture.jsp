<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	String score = request.getParameter("inlineRadioOptions");
	
	
	response.sendRedirect("/jhta_group2_semi_prj/board/afterlecture/afterlecture.jsp");
	
%>