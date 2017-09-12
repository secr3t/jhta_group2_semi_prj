<%@page import="pro.utils.DateUtils"%>
<%@page import="pro.qna.vo.Qna"%>
<%@page import="pro.board.dao.QnaBoardDao"%>
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
	  	    <h1 >FAQ게시판</h1>
	  	<h4>
	  	<span style="color:#ff0000;"><strong>|</strong>
	  	</span> QnA 강의질문
	  	</h4>
	  	<hr>
	    </div>
	    <%
	    	QnaBoardDao qdao =  QnaBoardDao.getInstance();
	    	int no = Integer.parseInt(request.getParameter("p"));	
	   
	    	Qna qna = qdao.getQnaBoardByNo(no);
	    %>
	  		<div class="panel panel-default">
	  			<table class="table">
	  				<tbody>
	  				<tr>
	  					<th>제목</th>
	  					<td colspan="5"><%=qna.getTitle() %></td>
	  				</tr>
	  				<tr>
	  					<th>작성자</th>
	  					<td><%=qna.getStudent().getName() %></td>
	  					<th>날짜</th>
	  					<td><%=DateUtils.yyyymmdd(qna.getQuesDate()) %></td>
	  				</tr>
	  				<tr>
	  					<td colspan="6"><%=qna.getQuesContent() %></td>
	  				</tr> 
	  				</tbody>
	  			</table>
	  			</div>
  		<div class="panel">
	  			<%if(qna.getAnsContent() != null){ %>
  			<table class="table">
  				<tbody>
  				<tr>
  					<th><h3>답변</h3></th>
  				</tr>
  				<tr>
  					<th>작성자</th>
  					<td><%=qna.getCourse().getLecturer().getName() %></td>
  					<th>답변날짜</th>
  					<td><%=DateUtils.yyyymmdd(qna.getAnsRegdate()) %></td>
  				</tr>
  				<tr>
  					<td colspan="6"><%=qna.getAnsContent() %></td>
  				</tr> 
  			
  				</tbody>
  				</table>
  				<% }%> 
  			</div>  			
  				<div class="text-right">
  					<% if(loginUser.getType().toUpperCase().equals("T")) { %>
	  				<a href="/jhta_group2_semi_prj/board/qnaboard/qna_replay.jsp?no=<%=qna.getNo() %>" class="btn btn-warning btn-sm">답변</a>
	  				<%} %>	
	  				<a href="/jhta_group2_semi_prj/board/qnaboard/delete_qna.jsp?no=<%=qna.getNo() %>" class="btn btn-danger btn-sm">삭제</a>
	  				<a href="<%=request.getParameter("url") %>" class="btn btn-primary btn-sm">돌아가기</a>
	  			</div>
	  	</div>
	  </div>
<%@include file="../../common/footer.jsp"%>
<div class="col-sm-1"></div>
</body>
</html>