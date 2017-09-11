<%@page import="pro.criteria.vo.Criteria"%>
<%@page import="pro.utils.StringUtils"%>
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
	  	<h1 >문의 게시판</h1>
	  	<h4>
	  	<span style="color:red;"><strong>|</strong>
	  	</span> 공지사항
	  	</h4>
	  	<hr>
	  	<% 
	  			String opt = request.getParameter("opt");
	    		String keyword = request.getParameter("keyword");
	  	    	int p = StringUtils.changeIntToString(request.getParameter("p"), 1);
	  	    	
	  	    	System.out.println("opt " + opt);
	  	    	System.out.println("p " + p);
	  	    	System.out.println("keyword " + keyword);
	  		
	  	    	final int rowsPerPage = 6;
	  	    	final int naviPerPage = 5;
	  	    	
	  	    	AlertBoardDao adao = AlertBoardDao.getInstance();
	  	    	Criteria criteria = new Criteria();
	  	    	if(opt != null && !opt.isEmpty()) {
	  	    		criteria.setOpt(opt);
	  	    	}
	  	    	if(keyword != null && !keyword.isEmpty()) {
	  	    		criteria.setKeyword(keyword);
	  	    	}
	  	    	
	  	    	int totalRows = adao.getTotalRows(criteria);
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
	  	    	
	  	    	criteria.setBeginIndex(beginIndex);
	  	    	criteria.setEndIndex(endIndex);
	  	    	
	  	    %>
			<div class="panel-group col-md-9">
				<%
					
					List<Notice> notices = adao.getAllAlertBoard(criteria);
				
					for(Notice notice : notices) {
						String style = notice.getNtypeNo() == 1 ? "color:red;" : notice.getNtypeNo() == 2 ? "color:blue;" : "color:green;" ;
						
						
						String ntype = notice.getNtypeNo() == 1 ? "[필독]" : notice.getNtypeNo() == 2 ? "[일반]" : "[이벤트]" ;
				%>
			    <div class="panel">
			        <div class="panel-heading input-lg" style="border: 2px solid silver;" >
			            <h4 class="panel-title">
			                 <a href="alertboard_detail.jsp?no=<%=notice.getNo() %>" class="collapsed" style="<%=style %>"><%=ntype %><%=notice.getTitle() %></a>
			            </h4>
			        </div>
	            </div>
	 
			    <%
					} %>
			    <div class="text-right">
	  	    	<form action="alertboard.jsp" class="form-inline" method="get" id="search-form">
	  	    		<input type="hidden" name="p" id="p-field" value="<%=p %>">
	  	    		<div class="form-group align-right">
	  	    			<label class="sr-only">옵션</label>
	  	    			<input type="hidden" class="form-control" name="opt" value="title">
					</div>
					<div class="form-group">
						<label class="sr-only">검색어</label>
						<input type="text" class="form-control" name="keyword" id="keyword" value="<%=StringUtils.nullToBlank(keyword)%>"/>
					</div>
					<button type="submit" class="btn btn-default" onclick="search(event)">검색</button>
	  	    	</form>
	  	    </div>
			    	<div class="panel-body text center">
			    		<ul class="pagination">
			   		<%if(p>naviPerPage) { %>
						<li><a href="javascript:goList(<%=beginPage-naviPerPage %>)">&lt;&lt;</a></li>
					<%
					} else {}
						if(p>1) {
					%>
						<li><a href="javascript:goList(<%=p-1%>)">&lt;</a></li>
					<%
						} else {
					%>
						<li class="disabled"><a href="alertboard.jsp?p=1">&lt;</a></li>
					<% 
						}
						for (int index=beginPage; index<=endPage; index++) {		
					%>
						<li class="<%=(p==index?"active":"")%>"><a href="javascript:goList(<%=index %>)"><%=index %></a></li>
					<% 
						}
					%>
					<%
						if(p<totalPages) {
					%>
						<li><a href="javascript:goList(<%=p+1%>)">&gt;</a></li>
					<% 
						} else {
					%>
						<li class="disabled"><a>&gt;</a></li>
					<%
						}
						if(currentNaviBlock != totalNaviBlocks) {
					%>
						<li><a href="javascript:goList(<%=(beginPage+naviPerPage) %>)">&gt;&gt;</a></li>
					<% } %>
			    		</ul>
			    	<div class="text-right">
			    	<% if(loginUser != null &&  "A".equals(loginUser.getType().toUpperCase())){ 	
					%>
					<a href="/jhta_group2_semi_prj/board/alertboard/alert_write.jsp" class="btn btn-primary btn-md">글쓰기</a>
					<% } %>	
			    	</div>
			    	</div>
			    
			</div>
		</div>
	</div>
<div class="col-sm-1"></div>
</div>
<%@include file="../../common/footer.jsp"%>


</body>
<script type="text/javascript">
function search(event) {
	event.preventDefault();
	document.getElementById("p-field").value = 1;
	document.getElementById("search-form").submit();
}
function goList(p) {
	document.getElementById("p-field").value = p;
	document.getElementById("search-form").submit();
}
</script>
</html>