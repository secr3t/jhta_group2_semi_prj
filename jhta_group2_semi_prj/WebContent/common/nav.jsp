<%@page import="pro.user.vo.User"%>
<%@page import="pro.lecturer.vo.Lecturer"%>
<%@page import="pro.student.vo.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%-- <%
   String cp= (String)pageContext.getAttribute("cp");

%> --%>

<%
User loginUser = null;
	loginUser = (User) session.getAttribute("loginUser");
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
            <a class="navbar-brand" href="/simple-jsp-board/index.jsp">일개미</a>

         </div>
         <ul class="nav navbar-nav">
            <li class=""> <a href="#">홈</a></li>
            <li><a href="#">정규과정</a></li>
            <li><a href="#">단기과정</a></li>
            <li class=""> <a href="#">자유게시판</a></li>
         </ul>
         <ul class="nav navbar-nav navbar-right">
<%--          <% if(loginUser == null) { %>
            <li class="<%="u".equals(cp)?"active":""%>"> <a href="/simple-jsp-board/user/form.jsp">회원가입</a></li>
            <li class="<%="i".equals(cp)?"active":""%>"> <a href="/simple-jsp-board/user/loginform.jsp">로그인</a></li>
         <%} else { %>
            <li><a href="/simple-jsp-board/user/logout.jsp">로그아웃</a></li>
         <%} %>
         </ul>--%>
         <%if(loginUser != null){ %>         
         <p class="navbar-text navbar-right"><strong><%=loginUser.getName() %></strong>님 환영합니다.</p>
         <%} %> 
         
      </div>
      </div>
</nav>