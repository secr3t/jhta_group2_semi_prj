<%@page import="pro.qna.vo.Qna"%>
<%@page import="pro.board.dao.QnaBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String ans = request.getParameter("anscontent");
	int no = Integer.parseInt(request.getParameter("p"));
	
	QnaBoardDao qdao = QnaBoardDao.getInstance();
	Qna qna = qdao.getQnaBoardByNo(no);
	qna.setAnsContent(ans);
	
	qdao.updateQnaAnsBoard(qna);
	
	response.sendRedirect("/jhta_group2_semi_prj/board/qnaboard/qnaboard.jsp");
	
%>