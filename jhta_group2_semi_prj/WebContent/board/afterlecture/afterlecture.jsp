	<%@page import="pro.utils.StringUtils"%>
<%@page import="pro.criteria.vo.Criteria"%>
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
	  	    <% 
	  	    	String opt = request.getParameter("opt");
	  	    	String keyword = request.getParameter("keyword");
	  	    	
	  	    	
	  	    	final int rowsPerPage = 8;
	  	    	final int naviPerPage = 5;
	  	    	
	  	    	AfterBoardDao adao = AfterBoardDao.getInstance();
	  	    	int p = StringUtils.changeIntToString(request.getParameter("p"), 1);
	  	    	Criteria criteria= new Criteria();
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
						List<Postscription> boards = adao.getAllAfterBoard(criteria);
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
						<%if(p>naviPerPage) { %>
						<li><a href="afterlecture.jsp?p=<%=beginPage-naviPerPage %>">&lt;&lt;</a></li>
					<%
					} else {}
						if(p>1) {
					%>
						<li><a href="afterlecture.jsp?p=<%=(p - 1)%>">&lt;</a></li>
					<%
						} else {
					%>
						<li class="disabled"><a href="afterlecture.jsp?p=1">&lt;</a></li>
					<%
						}
						for(int index=beginPage; index<=endPage; index++) {		
					%>
						<li class="<%=(p==index?"active":"")%>"><a href="afterlecture.jsp?p=<%=index %>"><%=index %></a></li>
					<% 
						}
					%>
					<%
						if(p<=totalPages) {
					%>
						<li><a href="afterlecture.jsp?p=<%=(p + 1) %>">&gt;</a></li>
					<% 
						} else {
					%>
						<li class="disabled"><a href="afterlecture.jsp?p=1">&gt;</a></li>
					<%
						}
						if(currentNaviBlock != totalNaviBlocks) {
					%>
						<li><a href="afterlecture.jsp?p=<%=(beginPage+naviPerPage) %>">&gt;&gt;</a></li>
					<% } %>
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