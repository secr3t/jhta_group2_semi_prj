<%@page import="pro.tech.vo.Tech"%>
<%@page import="pro.user.vo.User"%>
<%@page import="pro.board.dao.TechBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	User user = (User)session.getAttribute("loginUser");
 	int no = Integer.parseInt(request.getParameter("no"));
 	
 	TechBoardDao tdao = TechBoardDao.getInstance();
	Tech tech = tdao.getTechBoardByNo(no);
	
	
	if(user != null && (user.getNo() == tech.getStudent().getNo() ||  "A".equals(user.getType().toUpperCase()))) { 
	
	tdao.deleteTechBoard(no);
	
 	response.sendRedirect("/jhta_group2_semi_prj/board/personalqna/personalqnaboard.jsp");
 	
	} else {
		response.sendRedirect("/jhta_group2_semi_prj/board/personalqna/personalqnaboard.jsp?error=1");
	}

 %>