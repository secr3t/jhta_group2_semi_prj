<%@page import="pro.user.vo.User"%>
<%@page import="pro.qna.vo.Qna"%>
<%@page import="pro.board.dao.QnaBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	User user = (User)session.getAttribute("loginUser");
 	int no = Integer.parseInt(request.getParameter("p"));
	 	
 	QnaBoardDao qdao = QnaBoardDao.getInstance();
 	Qna qna = qdao.getQnaBoardByNo(no);
 	
	if(user != null && qna.getStudent().getNo() == user.getNo()) {
 	qdao.deleteQnaBoard(no);
 	response.sendRedirect("/jhta_group2_semi_prj/board/qnaboard/qnaboard.jsp");
	} else {
		response.sendRedirect("/jhta_group2_semi_prj/board/qnaboard/qnaboard.jsp?error=1");
	}
 %>