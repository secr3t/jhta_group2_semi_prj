<%@page import="pro.qna.vo.Qna"%>
<%@page import="pro.board.dao.QnaBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	int no = Integer.parseInt(request.getParameter("no"));
 	
 	QnaBoardDao qdao = new QnaBoardDao();
 	
 	qdao.deleteQnaBoard(no);
 	
 	response.sendRedirect("/jhta_group2_semi_prj/board/qnaboard/qnaboard.jsp");
 %>