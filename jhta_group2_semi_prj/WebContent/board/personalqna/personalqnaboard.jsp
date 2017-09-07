<%@page import="pro.criteria.vo.Criteria"%>
<%@page import="pro.utils.StringUtils"%>
<%@page import="pro.tech.vo.Tech"%>
<%@page import="java.util.List"%>
<%@page import="pro.board.dao.TecBoardDao"%>
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
	  	</span> 1:1 문의
	  	</h4>
	  	<h4>
	  	<span class="glyphicon glyphicon-ok"></span> 고객님과 관련된 1:1문의 게시판입니다.
	  	</h4>
	  	<hr>
	  	<% 
	  			String opt = request.getParameter("opt");
	   	 		String keyword = request.getParameter("keyword");
	  	
	  	    	final int rowsPerPage = 8;
	  	    	final int naviPerPage = 5;
	  	    	
	  	    	int p = StringUtils.changeIntToString(request.getParameter("p"), 1);
	  	    	
					TecBoardDao tdao = new TecBoardDao(); 
	  	    	int totalRows = tdao.getTotalRows();
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
	  	    	criteria.setOpt(opt);
	  	    	criteria.setKeyword(keyword);
	  	    	
	  	    %>
	  	    <div class="text-right">
	  	    	<form action="" class="form-inline" method="get">
	  	    		<div class="form-group align-right">
	  	    			<label class="sr-only">옵션</label>
	  	    			<select class="form-control col-sm-offcet-4 col-sm-3 control-label" style="width: 100px;" name="opt">
							<option value="title"<%= ("title".equals(opt) ? "selected":"") %>>제목</option>
							<option value="writer"<%= ("writer".equals(opt) ? "selected":"") %>>작성자</option>
						</select>
					</div>
					<div class="form-group">
						<label class="sr-only">검색어</label>
						<input type="text" class="form-control" name="keyword" value="<%=StringUtils.nullToBlank(keyword)%>"/>
					</div>
					<button type="submit" class="btn btn-default">검색</button>
	  	    	</form>
	  	    </div>
			<div class="panel-group col-md-9">
				<%
					List<Tech> techs = tdao.getAllTecBoard(criteria);
					for(Tech tech : techs) {
						String style = tech.getQtypeNo() == 1 ? "color:red;" : "color:blue;";

				%>
			    <div class="panel">
			        <div class="panel-heading input-lg" style="border:2px solid silver;">
			            <h4 class="panel-title">
			                <a href="personalqna_detail.jsp?no=<%=tech.getNo() %>" class="collapsed" style="<%=style %>"><%=tech.getTitle() %></a>
			            </h4>
			        </div>
	            </div>
	            <%} %>
	            <div class="panel-body text-center">
					<ul class="pagination">
					<%if(p>naviPerPage) { %>
						<li><a href="personalqnaboard.jsp?p=<%=beginPage-naviPerPage %>">&lt;&lt;</a></li>
					<%
					} else {}
						if(p>1) {
					%>
						<li><a href="personalqnaboard.jsp?p=<%=(p - 1)%>">&lt;</a></li>
					<%
						} else {
					%>
						<li class="disabled"><a href="personalqnaboard.jsp?p=1">&lt;</a></li>
					<%
						}
						for(int index=beginPage; index<=endPage; index++) {		
					%>
						<li class="<%=(p==index?"active":"")%>"><a href="personalqnaboard.jsp?p=<%=index %>"><%=index %></a></li>
					<% 
						}
					%>
					<%
						if(p<totalPages) {
					%>
						<li><a href="personalqnaboard.jsp?p=<%=(p + 1) %>">&gt;</a></li>
					<% 
						} else {
					%>
						<li class="disabled"><a href="personalqnaboard.jsp?p=1">&gt;</a></li>
					<%
						}
						if(currentNaviBlock != totalNaviBlocks) {
					%>
						<li><a href="personalqnaboard.jsp?p=<%=(beginPage+naviPerPage) %>">&gt;&gt;</a></li>
					<% } %>
					</ul>
					</div>
			    	<div class="text-right">
			    		<a href="/jhta_group2_semi_prj/board/personalqna/personalqna_write.jsp" class="btn btn-primary btn-md">글쓰기</a>
			    	</div>
			    
			</div>
		</div>
	</div>
<div class="col-sm-1"></div>
</div>
<%@include file="../../common/footer.jsp"%>


</body>
</html>