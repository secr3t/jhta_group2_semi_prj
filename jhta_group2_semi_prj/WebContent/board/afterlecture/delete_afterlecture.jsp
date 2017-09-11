<%@page import="javafx.scene.control.Alert"%>
<%@page import="pro.postscription.vo.Postscription"%>
<%@page import="pro.user.vo.User"%>
<%@page import="pro.board.dao.AfterBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%
 	User user = (User)session.getAttribute("loginUser");	
 
 	int no = Integer.parseInt(request.getParameter("bno"));
 	AfterBoardDao adao = AfterBoardDao.getInstance();
	
 	Postscription board = adao.getAfterBoardByNo(no);
 	
 	if(user != null && board.getStudent().getNo() == user.getNo()) {
 		
 	adao.deleteAfterBoard(no);
 	response.sendRedirect("/jhta_group2_semi_prj/board/afterlecture/afterlecture.jsp");
 	} else {
 	response.sendRedirect("/jhta_group2_semi_prj/board/afterlecture/afterlecture.jsp?error=1");
 		
 	}
 %>
 
 