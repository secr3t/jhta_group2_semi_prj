<%@page import="pro.user.vo.User"%>
<%@page import="pro.lecturer.dao.LecturerDao"%>
<%@page import="pro.lecturer.vo.Lecturer"%>
<%@page import="pro.student.vo.Student"%>
<%@page import="pro.student.dao.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%

	String id = request.getParameter("user-id");
	String pwd = request.getParameter("user-pwd");
	String type = request.getParameter("login-type");
	
	System.out.println(id + " / " + pwd);
	
	Object dao = new Object();
	User user = null;
	
	if("jhta2".equals(id)){
		if("zxcv1234".equals(pwd)){
			user = new User();
			user.setName("운영자");
			user.setType("a");
			session.setAttribute("loginUser", user);
			response.sendRedirect("/jhta_group2_semi_prj/main/index.jsp");
		}
	}
	
	if("student".equals(type)){
		dao = StudentDao.getInstance();
		user = ((StudentDao)dao).getStudentByEmail(id);
		
	System.out.println(user);
		if(user == null){
			%>
			<script>
			window.location.href="login.jsp";
			 alert('잘못된 로그인 시도입니다. ID와 로그인 구분을 확인해주세요.');
			</script>
						<%
			return;
		}
		
		if( pwd.equals(user.getPwd().trim()) ){
			session.setAttribute("loginUser", user);
		} else {
			// javascript를 이용하여 alert를 띄우고 확인을 클릭하면 login page로 돌아가게한다.
			%>
			<script>
			window.location.href="login.jsp";
			 alert('잘못된 로그인 시도입니다.비밀번호를 확인해주세요.');
			</script>
						<%
			return;
		}
	} else if ("lecturer".equals(type)){
		dao = LecturerDao.getInstance();
		user = ((LecturerDao)dao).getLecturerByEmail(id);
		System.out.println(user);
			if(user == null){
				%>
				<script>
				window.location.href="login.jsp";
				 alert('잘못된 로그인 시도입니다. ID와 로그인 구분을 확인해주세요.');
				</script>
							<%
				return;
			}
		if( pwd.equals(user.getPwd().trim()) ){
			session.setAttribute("loginUser", user);
		} else {
			%>
			<script>
			window.location.href="login.jsp";
			 alert('잘못된 로그인 시도입니다. 비밀번호를 확인해주세요.');
			</script>
						<%
			return;
		}
	} else {
		// User가 악의적으로 해당 jsp 페이지로 이동할 경우에 대한 방어 코딩
		response.sendError(400);
	}
		response.sendRedirect("/jhta_group2_semi_prj/main/index.jsp");
%>