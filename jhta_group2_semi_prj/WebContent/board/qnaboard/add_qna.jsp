<%@page import="pro.student.vo.Student"%>
<%@page import="pro.user.vo.User"%>
<%@page import="pro.qna.vo.Qna"%>
<%@page import="pro.board.dao.QnaBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	User user = (User) session.getAttribute("loginUser");
	

	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	
	
	QnaBoardDao qdao = QnaBoardDao.getInstance();
	Qna qna = new Qna();
	qna.setTitle(title);
	qna.setQuesContent(contents);
	//qna.setCourse(course);
	qna.setActive("Y");
	
	
	if(user.getType().toUpperCase().equals("S")) {
		Student student = new Student();
		student.setNo(user.getNo());
		qna.setStudent(student);
	}
	
	qdao.addQnaBoard(qna);
	
	response.sendRedirect("/jhta_group2_semi_prj/board/qnaboard/qnaboard.jsp");
	
%>