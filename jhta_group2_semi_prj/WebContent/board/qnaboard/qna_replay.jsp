<%@page import="pro.qna.vo.Qna"%>
<%@page import="pro.board.dao.QnaBoardDao"%>
<%@page import="pro.utils.DateUtils"%>
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
<%@include file="../../common/nav.jsp" %>
<div class="container">
	<div class="col-sm-3">
<%@ include file="../boardbanner/left-menu.jsp" %>
	</div>
	<div class="col-sm-9">
  <div class="row">
  	<div class="row">
  	    <h1 >FAQ게시판</h1>
  	<h4>
  	<span style="color:#ff0000;"><strong>|</strong>
  	</span> QnA 강의질문
  	</h4>
  	<hr>
    </div>
  		<%
	    	QnaBoardDao qdao = new QnaBoardDao();
	    	int no = Integer.parseInt(request.getParameter("no"));	
	   
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
	  			<%//if(display=="Y"){ %>
  		<div class="panel panel-default">
  					<h3>답변</h3>
	  				<form class="form-horizontal" method="post" action="/jhta_group2_semi_prj/board/qnaboard/add_qna_replay.jsp?no=<%=qna.getNo() %>">
			  			<label class="control-label">답변내용</label>
			  			<textarea rows="6" class="form-control" name="anscontent"></textarea>
			  			<div class="text-right">
  				<button type="submit" class="btn btn-warning btn-md">답변</button>
  				<a href="/jhta_group2_semi_prj/board/qnaboard/qna_detail.jsp?no=<%=qna.getNo() %>" class="btn btn-primary btn-md">돌아가기</a>
  			</div>
  		</form>
  		</div>  			
  		<%//} %>
	  		</div>
	  </div>
	  </div>
<div class="col-sm-1"></div>
<%@include file="../../common/footer.jsp"%>
</body>
</html>