<%@page import="com.sun.xml.internal.messaging.saaj.packaging.mime.util.BEncoderStream"%>
<%@page import="pro.utils.StringUtils"%>
<%@page import="pro.criteria.vo.Criteria"%>
<%@page import="pro.utils.DateUtils"%>
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
	  	    <% 
	  	    	final int rowsPerPage = 10;
	  	    	final int naviPerPage = 5;
	  	    	
	  	    	QnaBoardDao qdao = new QnaBoardDao();
	  	    	int p = StringUtils.changeIntToString(request.getParameter("p"), 1);
	  	    	
	  	    	int totalRows = qdao.getTotalRows();
	  	    	int totalPages = (int) Math.ceil(totalRows/(double)rowsPerPage);
	  	    	int totalNaviBlocks = (int) Math.ceil(totalPages/(double)naviPerPage);
	  	    	int currentNaviBlock = (int) Math.ceil(p/(double)naviPerPage);
	  	    	int beginPage = (currentNaviBlock - 1)*naviPerPage +1;
	  	    	int endPage = currentNaviBlock*naviPerPage;
	  	    	
	  	    	if(currentNaviBlock == totalNaviBlocks) {
	  	    		endPage = totalPages;
	  	    	}
	  	    	
	  	    	int beginIndex = (p-1)*rowsPerPage + 1;
	  	    	int endIndex = p*rowsPerPage;
	  	    	
	  	    	Criteria criteria = new Criteria();
	  	    	criteria.setBeginIndex(beginIndex);
	  	    	criteria.setEndIndex(endIndex);
	  	    	
	  	    %>
			<div class="panel panel-default">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>날짜</th>
							<th>과정명</th>
							<th>답변여부</th>
						</tr>
					</thead>
					<tbody>
					    <%					    	
					    	
					    	List<Qna> qnas = qdao.getAllQnaBoard(criteria);
					    	for(Qna qna : qnas) {
					    %>
					    <tr>
					       <th><%=qna.getNo() %></th>
							<th><a href="qna_detail.jsp?p=<%=qna.getNo() %>"><%=qna.getTitle() %></a></th>
							<th><%=qna.getStudent().getName() %></th>
							<th><%=DateUtils.yyyymmdd(qna.getQuesDate()) %></th>
							<th><%=qna.getCourse().getName() %></th>
							<th></th> 
					    </tr>
					    <%} %>
					</tbody>
					
				</table>
				<div class="panel-body text-center">
					<ul class="pagination">
					<%if(p>naviPerPage) { %>
						<li><a href="qnaboard.jsp?p=<%=beginPage-naviPerPage %>">&lt;&lt;</a></li>
					<%
					} else {}
						if(p>1) {
					%>
						<li><a href="qnaboard.jsp?p=<%=(p - 1)%>">&lt;</a></li>
					<%
						} else {
					%>
						<li class="disabled"><a href="qnaboard.jsp?p=1">&lt;</a></li>
					<%
						}
						for(int index=beginPage; index<=endPage; index++) {		
					%>
						<li class="<%=(p==index?"active":"")%>"><a href="qnaboard.jsp?p=<%=index %>"><%=index %></a></li>
					<% 
						}
					%>
					<%
						if(p<=totalPages) {
					%>
						<li><a href="qnaboard.jsp?p=<%=(p + 1) %>">&gt;</a></li>
					<% 
						} else {
					%>
						<li class="disabled"><a href="qnaboard.jsp?p=1">&gt;</a></li>
					<%
						}
						if(currentNaviBlock != totalNaviBlocks) {
					%>
						<li><a href="qnaboard.jsp?p=<%=(beginPage+naviPerPage) %>">&gt;&gt;</a></li>
					<% } %>
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