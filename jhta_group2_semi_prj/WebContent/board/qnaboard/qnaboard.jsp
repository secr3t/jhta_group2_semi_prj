<%@page import="pro.qna.vo.Qna"%>
<%@page import="java.util.List"%>
<%@page import="pro.board.dao.QnaBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
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
	  	        <h1 class="well" style="background-color: #337AB7; color:white;"><span class="glyphicon glyphicon-th-list"></span> <strong>QnA게시판</strong></h1>
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
							<th>날짜</th>
							<th>답변여부</th>
						</tr>
					</thead>
					<tbody>
					    <%
					    	QnaBoardDao qdao = new QnaBoardDao();
					    	List<Qna> qnas = qdao.getAllQnaBoard();
					    
					    	for(Qna qna : qnas) {
					    %>
					    <tr>
					       <th><%=qna.getNo() %></th>
							<th><a href="qna_detail.jsp?no=<%=qna.getNo() %>"><%=qna.getTitle() %></a></th>
							<th><%=qna.getStudent().getName() %></th>
							<th><%=qna.getQuesDate() %></th>
							<th><%=qna.getActive() %></th> 
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
					<a href="/jhta_group2_semi_prj/board/qnaboard/qna_write.jsp" class="btn btn-primary btn-md pull-right">글쓰기</a>
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