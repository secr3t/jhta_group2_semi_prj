<%@page import="pro.board.dao.AfterBoardDao"%>
<%@page import="pro.postscription.vo.Postscription"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
		
	AfterBoardDao adao = new AfterBoardDao();	

	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	String grade = request.getParameter("inlineRadioOptions");
	int no = Integer.parseInt(request.getParameter("inlineRadioOptions"));
	
	Postscription pos = new Postscription();
	pos.setTitle(title);
	pos.setContent(contents);
	pos.setGrade(no);
	
	
	adao.AddAfterBoard(pos);
	
	response.sendRedirect("/jhta_group2_semi_prj/board/afterlecture/afterlecture.jsp");
	
%>