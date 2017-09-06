<%@page import="java.util.List"%>
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
	  <div class="page-header">
	  	<h1 >FAQ게시판</h1>
	  	<h4>
	  	<span style="color:red;"><strong>|</strong>
	  	</span> 공지사항
	  	</h4>
	  	<hr>
			<div class="panel-group col-md-9">
				<%
					AlertBoardDao adao = new AlertBoardDao();
					
					List<Notice> notices = adao.getAllAlertBoard();
					for(Notice notice : notices) {
				%>
			    <div class="panel">
			        <div class="panel-heading input-lg" style="border: 2px solid silver;" >
			            <h4 class="panel-title">
			                <a href="alertboard_detail.jsp?no=<%=notice.getNo() %>" class="collapsed"><%=notice.getTitle() %></a>
			            </h4>
			        </div>
	            </div>
			    <%} %>
			    	<div class="text-right">
			    		<a href="/jhta_group2_semi_prj/board/alertboard/alert_write.jsp" class="btn btn-primary btn-md">글쓰기</a>
			    	</div>
			    
			</div>
		</div>
	</div>
<div class="col-sm-1"></div>
</div>
<%@include file="../../common/footer.jsp"%>


</body>
</html>