<%@page import="pro.video.vo.Video"%>
<%@page import="java.util.List"%>
<%@page import="pro.criteria.vo.Criteria"%>
<%@page import="pro.mypage.dao.MypageCourseDao"%>
<%@page import="pro.utils.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Insert Your Title</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style>
		.table-hover {
		    table-layout: fixed;
		}
		.table-hover td {
		    white-space: nowrap;
		    overflow-x: hidden;
		    text-overflow: ellipsis;
		}
	</style>
</head>
<body>
	<%@ include file="/mypage/lecturer/logincheck.jsp" %>
	<%@ include file="/common/nav.jsp" %>
    <div class="container">
 		<div class="col-sm-offset-2 page-header">
			<h1>등록된 Q&amp;A</h1>
		</div>
		
   		<div class="col-sm-2">
			<%@ include file="../left-menu.jsp" %>
		</div>  
        <div class="col-sm-9">
         	<div class="row">
              <div class="col-sm-6">
              <%
              	request.setCharacterEncoding("utf-8");
              	int courseNo = StringUtils.changeIntToString(request.getParameter("cno"));
        		String noAnswer = request.getParameter("noAnswer");
      			
      			if(noAnswer == null) {
              %>
              	<a href="?cno=<%=courseNo %>&noAnswer=N" class="btn btn-info btn-sm">허가</a>
              	<a href="?cno=<%=courseNo %>&noAnswer=Y" class="btn btn-danger btn-sm">미허가</a>
              <%
      			}
              %>
              	<a href="myqna.jsp" class="btn btn-default btn-sm">전체 목록</a>
              </div>
       		</div>
            <div class="table-responsive">
                 <table class="table table-hover">
                     <colgroup>
                         <col width="10%">
                         <col width="20%">
                         <col width="30%">
                         <col width="30%">
                         <col width="10%">
                     </colgroup>                                   
                     <thead>
                         <tr>
                             <th>순서</th><th>제목</th><th>링크</th><th>첨부파일</th><th>허가여부</th>
                         </tr>
                     </thead>
                     <tbody>
                     	 <%
	                  		MypageCourseDao courDao = MypageCourseDao.getInstance();
                     	 
                     	 	int rowsPerPage = 5;
                     	 	int pagesPerBlock = 5;
                     	 	
                     	 	int nowPage = StringUtils.changeIntToString(request.getParameter("p"), 1);                     	 	
                     	 	int nowBlock = (int) Math.ceil((double) nowPage / pagesPerBlock);
                     	 	
                     	 	int beginIndex = (nowPage - 1) * rowsPerPage + 1;
                     	 	int endIndex = nowPage * rowsPerPage;
                     	 	int beginPage = (nowBlock - 1) * pagesPerBlock + 1;
                     	 	int endPage = nowBlock * pagesPerBlock;
                     	 	                     	 			
	                  		Criteria criteria = new Criteria();
	                  		criteria.setCourseNo(courseNo);
	                  		criteria.setNoAnswer(noAnswer);
	                  		criteria.setBeginIndex(beginIndex);
	                  		criteria.setEndIndex(endIndex);
	                  		
                     	 	int totalRows = courDao.getTotalCourseVideoByCourseNo(courseNo);
                     	 	int totalPages = (int) Math.ceil((double) totalRows / rowsPerPage);
                     	 	int totalBlock = (int) Math.ceil((double) totalPages / pagesPerBlock);
                     	 	
                     	 	if(nowBlock >= totalBlock) {
                     	 		endPage = totalPages;
                     	 	}
	                  	
	                  		List<Video> videoList = courDao.getVideoInfo(criteria);
	                  		if(videoList.size() == 0) {
	        	        %>
	        	        <tr>
	        	        	<td colspan="12" class="text-center">영상이 존재하지 않습니다.</td>
	        	        </tr>
	        	        <%
	                  		}
	                  		for(Video forVideo : videoList) {
	                  	%>
		                      <tr>
		                      	  <td><%=forVideo.getOrder() %></td>
		                          <td><a href="video-detail.jsp?cno=<%=courseNo %>&vno=<%=forVideo.getNo() %>"><%=forVideo.getTitle() %></a></td>
		                          <td><a href="<%=forVideo.getLink() %>"><%=forVideo.getLink() %></a></td>
		                          <td><%=forVideo.getAttached()%></td>
		                          <td><%=forVideo.getPermit() %></td>
		                      </tr>       	
	                  	<%
	                  		}
	                  	%>
                     </tbody>
                 </table>
                 <div class="text-center">
                     <ul class="pagination pagination-sm">
                     	 <%
                     	 	if(nowBlock != 1) {
                     	 %>
		                         <li><a href="?cno=<%=courseNo %>&p=<%=beginPage - 1 %>"><span class="glyphicon glyphicon-backward"></span></a></li>
                     	 <%
                     	 	}
                     	 %>
                         <%
                         	if(nowPage != 1) {
                         %>
		                         <li><a href="?cno=<%=courseNo %>&p=<%=nowPage - 1 %>"><span class="glyphicon glyphicon-triangle-left"></span></a></li>
                         <%
                         	}
                         %>
                     	 <%
                     	 	for(int index=beginPage; index<=endPage; index++) {
                     	 %>
                         		<li class="<%=index == nowPage ? "active" : ""  %>"><a href="cno=<%=courseNo %>&?p=<%=index %>"><%=index %></a></li>                     	 
                     	 <%		
                     	 	}
                     	 %>
                     	 <%
                     	 	if(nowPage < totalPages) {
                     	 %>
	                         	<li><a href="?cno=<%=courseNo %>&p=<%=nowPage + 1 %>"><span class="glyphicon glyphicon-triangle-right"></span></a></li>
                     	 <%
                     	 	}
                     	 %>
                     	 <%
                     	 	if(nowBlock < totalBlock) {
                     	 		
                     	 %>
		                         <li><a href="?cno=<%=courseNo %>&p=<%=beginPage + pagesPerBlock %>"><span class="glyphicon glyphicon-forward"></span></a></li>
                     	 <%
                     	 	}
                     	 %>
                     </ul>
                     <div class="pull-right">
                     	<a href="upload-lectureform.jsp?cno=<%=courseNo %>" class="btn btn-primary pull-right">새영상 등록</a>
                     </div>
                 </div>
             </div>
         </div>
     </div>
   	<%@ include file="/common/footer.jsp" %>    
</body>
</html>