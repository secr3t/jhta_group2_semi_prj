<%@page import="pro.utils.DateUtils"%>
<%@page import="pro.utils.StringUtils"%>
<%@page import="pro.notice.vo.Notice"%>
<%@page import="pro.board.dao.AlertBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Bootstrap Example</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<%@include file="../../common/header.jsp"%>
<body>
<%@include file="../../common/nav.jsp"%>

  
<div class="container">
	<div class="col-sm-2">
	<%@ include file="../boardbanner/left-menu.jsp" %>
	</div>
	<div class="col-sm-9">
	  <div class="row">
	  	<div class="content-header">
	        <div class="col-lg-12">
	        	<%
	  	        	AlertBoardDao adao = AlertBoardDao.getInstance();
	  	        	int no = Integer.parseInt(request.getParameter("no"));
	  	        
	  	        	Notice noe = adao.getAlertBoardByNo(no);	
	  	        %>
	  	        <h1><%=noe.getTitle() %></h1>
	  	        <p class="read"></p>
	  	        <hr>
	  	        
	  	        <p><span class="glyphicon glyphicon-time"></span><%=DateUtils.yyyymmdd(noe.getRegdate()) %></p>
	  	        <hr>
	  	        <p><span class="glyphicon glyphicon-time"></span><%=DateUtils.yyyymmdd(noe.getExpiredate()) %></p>
	  	        <hr>
	        </div>
	    </div>
	  		<div class="container well col-lg-12">
	  			<p style="font-size: 16px;"><%=noe.getContent() %></p>
	  		</div>
	  		
	  </div>
	  		<div class="panel text-right">
	  			<hr>
	  			<% if(loginUser != null && "A".equals(loginUser.getType().toUpperCase())) {
	  				%>
	  			<a href="/jhta_group2_semi_prj/board/alertboard/delete_alert.jsp?no=<%=noe.getNo() %>" class="btn btn-danger btn-md">삭제</a>
	  			<% } %>
	  			<a href="/jhta_group2_semi_prj/board/alertboard/alertboard.jsp" class="btn btn-primary btn-md">돌아가기</a>
	  		</div>
	  </div>
<div class="col-sm-1"></div>
</div>
<%@include file="../../common/footer.jsp"%>
</body>
</html>