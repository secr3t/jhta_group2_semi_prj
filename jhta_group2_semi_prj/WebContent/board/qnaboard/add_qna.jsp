<%@page import="pro.course.vo.Course"%>
<%@page import="pro.student.vo.Student"%>
<%@page import="pro.user.vo.User"%>
<%@page import="pro.qna.vo.Qna"%>
<%@page import="pro.board.dao.QnaBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../common/loginCheck.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	
	User user = (User) session.getAttribute("loginUser");
	

	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	int courseNo = Integer.parseInt(request.getParameter("type"));
	
	Course course = new Course();
	course.setNo(courseNo);
	QnaBoardDao qdao = QnaBoardDao.getInstance();
	Qna qna = new Qna();
	qna.setTitle(title);
	qna.setQuesContent(contents);
	//qna.setCourse(course);
	qna.setActive("Y");
	qna.setCourse(course);
	
	if(user.getType().toUpperCase().equals("S")) {
		Student student = new Student();
		student.setNo(user.getNo());
		qna.setStudent(student);
		
		qdao.addQnaBoard(qna);
		
		response.sendRedirect("/jhta_group2_semi_prj/board/qnaboard/qnaboard.jsp");
	} else {
		response.sendRedirect("/jhta_group2_semi_prj/board/qnaboard/qnaboard.jsp");
		return;		
	}
	
	
	
%>