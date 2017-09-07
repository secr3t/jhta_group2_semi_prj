<%@page import="pro.course.vo.Course"%>
<%@page import="pro.student.vo.Student"%>
<%@page import="pro.user.vo.User"%>
<%@page import="pro.board.dao.AfterBoardDao"%>
<%@page import="pro.postscription.vo.Postscription"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
		
	AfterBoardDao adao = AfterBoardDao.getInstance();	

	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	String grade = request.getParameter("inlineRadioOptions");
	int no = Integer.parseInt(request.getParameter("inlineRadioOptions"));
	Postscription pos = new Postscription();
		
	User user = (User)session.getAttribute("loginUser");
	
	if(user.getType().equals('S')) {	
		Student student = new Student();
		Course course = new Course();
		student.setNo(((Student)user).getNo());
	} else {
		
	}
	pos.setTitle(title);
	pos.setContent(contents);
	pos.setGrade(no);
		
	adao.addAfterBoard(pos);
	
	
	response.sendRedirect("/jhta_group2_semi_prj/board/afterlecture/afterlecture.jsp");
	
%>