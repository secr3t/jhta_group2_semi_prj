<%@page import="pro.course.vo.Course"%>
<%@page import="pro.student.vo.Student"%>
<%@page import="pro.user.vo.User"%>
<%@page import="pro.board.dao.AfterBoardDao"%>
<%@page import="pro.postscription.vo.Postscription"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
		
	Postscription pos = new Postscription();

	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	String grade = request.getParameter("inlineRadioOptions");
	if(request.getParameter("inlineRadioOptions") != null) {
	int no = Integer.parseInt(request.getParameter("inlineRadioOptions"));
	pos.setGrade(no);
	} else {
		response.sendRedirect("/jhta_group2_semi_prj/board/afterlecture/afterlecture_write.jsp?error=1");
		return;
	}
	
	Student student = new Student();
	Course course = new Course();
	User user = (User)session.getAttribute("loginUser");
	
	AfterBoardDao adao = AfterBoardDao.getInstance();	
	if(user !=  null && user.getType().toUpperCase().equals("S")) {	

	if(request.getParameter("type") != null) {
	int courseNo = Integer.parseInt(request.getParameter("type"));
		course.setNo(courseNo);		
	} else if(request.getParameter("courseNo") != null) {
	int cosNo = Integer.parseInt(request.getParameter("courseNo"));
		course.setNo(cosNo);
	}
	
		
		student.setNo(((Student)user).getNo());
		
		pos.setStudent(student);
		pos.setCourse(course);
		pos.setTitle(title);
		pos.setContent(contents);
		
		pos.setActive("Y");
		pos.setCourse(course);
		
	adao.addAfterBoard(pos);
	
	response.sendRedirect("/jhta_group2_semi_prj/board/afterlecture/afterlecture.jsp");
	} else {
		response.sendRedirect("/jhta_group2_semi_prj/board/afterlecture/afterlecture_write.jsp?error=1");
		return;
	}
		
	
	
%>