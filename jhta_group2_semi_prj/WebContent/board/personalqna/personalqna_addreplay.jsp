<%@page import="pro.tech.vo.Tech"%>
<%@page import="pro.board.dao.TecBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 	String ans = request.getParameter("anscontent");
	int no = Integer.parseInt(request.getParameter("no"));
	
	TecBoardDao tdao = new TecBoardDao();
	
	Tech tech = tdao.getTecBoardByNo(no);
	tech.setAnsContent(ans);
	// no로 가져올 방법
	//기존 객체에 들어가는지 아니면 전객체 있고 새로 객체가 만들어 지는지 
	//detail에서 no로 한거 그 루트를 타는지 
	tdao.AddTecBoard(tech);
	
	response.sendRedirect("/jhta_group2_semi_prj/board/personalqna/personalqnaboard.jsp");
	%>