	<%@page import="pro.utils.DateUtils"%>
<%@page import="pro.postscription.vo.Postscription"%>
<%@page import="java.util.List"%>
<%@page import="pro.board.dao.AfterBoardDao"%>
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

<div class="content-primary">

<div class="container">
	<div class="col-sm-2">
		<%@ include file="../boardbanner/left-menu.jsp" %>
	</div>
	<div class="col-sm-9">
	  <div class="row">
	    <div class="content-header">
	        <div class="crumb">
	  	        <h1 class="well" style="background-color: #337AB7; color:white;"><span class="glyphicon glyphicon-th-list"></span> 
	  	        <strong>강의 후기 게시판</strong></h1>
	        </div>
	    </div>
	  	    <hr>
			<div class="panel panel-default">
				<table class="table table-hover">
					<thead>
						
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>평점</th>
							<!--  
							<th>게시여부</th>
							<th>학생번호</th>-->
						</tr>
					</thead>
					<tbody>
					<%
						AfterBoardDao adao = new AfterBoardDao();
						List<Postscription> boards = adao.getAllAfterBoard();
						for(Postscription board : boards) { %>
					    <tr>
					       <th><%=board.getNo() %></th>
					       <th><a href="afterlecture_detail.jsp?bno=<%=board.getNo() %>"><%=board.getTitle() %></a></th>
							<th><%=board.getStudent().getName() %></th>
							<th><%=DateUtils.yyyymmdd(board.getRegdate()) %></th>
							<th><%=board.getGrade() %></th>
					    </tr>
					 <%} %>
					</tbody>
					
				</table>
				<div class="panel-body text-center">
					<ul class="pagination">
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
					</ul>
					<a href="/jhta_group2_semi_prj/board/afterlecture/afterlecture_write.jsp" class="btn btn-primary btn-md pull-right">글쓰기</a>
				</div>
			</div>
		</div>
	</div>
  </div>
  <div class="col-sm-1"></div>
</div>

<%@include file="../../common/footer.jsp"%>

</body>
</html>