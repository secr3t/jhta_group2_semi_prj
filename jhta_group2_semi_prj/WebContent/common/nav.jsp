<%@page import="java.util.Enumeration"%>
<%@page import="pro.user.vo.User"%>
<%@page import="pro.lecturer.vo.Lecturer"%>
<%@page import="pro.student.vo.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%
User loginUser = null;
	loginUser = (User) session.getAttribute("loginUser");
String parameter = request.getQueryString();
if(parameter == null)
	parameter = "";
%>

    <div class="navbar-header">
        <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
        <span class="sr-only">네비게이션 끄기/켜기</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
        <a href="#" class="navbar-brand">일개미</a>
    </div>


<nav class="navbar navbar-default">
   <div class="container">
      <div class="container-fluid">
         <div class="navbar-header">
            <a class="navbar-brand" href="/jhta_group2_semi_prj/">일개미</a>

         </div>
         <ul class="nav navbar-nav">
            <li class=""> <a href="/jhta_group2_semi_prj/">홈</a></li>
            <li><a href="/jhta_group2_semi_prj/lecturedisplay/lecturesdisplay/index.jsp">강의목록</a></li>
            <li><a href="/jhta_group2_semi_prj/payment/payment.jsp">포인트 충전</a></li>
            <li class=""> <a href="/jhta_group2_semi_prj/enrollment/enrollment-table.jsp">수강신청</a></li>
         </ul>
         
         <ul class="nav navbar-nav navbar-right">
         <li><a href="/jhta_group2_semi_prj/board/boardmain.jsp">고객센터</a></li>
       <% if(loginUser == null) { %>
            <li > <a href="/jhta_group2_semi_prj/registration/registrationdivform.jsp">회원가입</a></li>
            <li> <a href="/jhta_group2_semi_prj/login/login.jsp?returnUrl=<%=request.getRequestURI()+"?"+parameter%>">로그인</a></li>
         <%} else { %>
         	<li><a href="/jhta_group2_semi_prj/mypage">마이페이지</a></li>
            <li><a href="/jhta_group2_semi_prj/login/logout.jsp">로그아웃</a></li>
         <%} %>
         </ul>
         <%if(loginUser != null){ %>         
         <p class="navbar-text navbar-right"><strong><%=loginUser.getName() %></strong>님 환영합니다.</p>
         <%} %> 
         
      </div>
      </div>
</nav>