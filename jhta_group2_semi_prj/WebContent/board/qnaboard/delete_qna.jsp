<%@page import="pro.user.vo.User"%>
<%@page import="pro.qna.vo.Qna"%>
<%@page import="pro.board.dao.QnaBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	User user = (User)session.getAttribute("loginUser");
 	int no = Integer.parseInt(request.getParameter("no"));
	 
 	System.out.println(no);
 	QnaBoardDao qdao = QnaBoardDao.getInstance();
 	Qna qna = qdao.getQnaBoardByNo(no);
 	System.out.println(qna);
 	System.out.println(user);
 	if(user != null && (user.getNo() == qna.getStudent().getNo() ||  "A".equals(user.getType().toUpperCase()))) { 
 	qdao.deleteQnaBoard(no);
 	response.sendRedirect("/jhta_group2_semi_prj/board/qnaboard/qnaboard.jsp");
	} else {
		response.sendRedirect("/jhta_group2_semi_prj/board/qnaboard/qnaboard.jsp?error=1");
	}
 %>