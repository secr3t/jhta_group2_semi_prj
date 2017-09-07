<%@page import="pro.utils.DateUtils"%>
<%@page import="pro.course.vo.Course"%>
<%@page import="pro.mypage.dao.MypageCourseDao"%>
<%@page import="pro.qna.vo.Qna"%>
<%@page import="java.util.List"%>
<%@page import="pro.criteria.vo.Criteria"%>
<%@page import="pro.utils.StringUtils"%>
<%@page import="pro.mypage.dao.MypageLecturerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>My Q&amp;A</title>
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
			<%@ include file="left-menu.jsp" %>
		</div>  
        <div class="col-sm-9">
         	<div class="row">
              <div class="col-sm-4">
              	<a href="myqna.jsp?noAnswer=N" class="btn btn-info btn-sm">답변한 질문</a>
              	<a href="myqna.jsp?noAnswer=Y" class="btn btn-danger btn-sm">미답변 질문</a>
              </div>
              <div class="col-sm-10 pull-right">
               <form method="get" action="myqna.jsp" class="form-inline text-right">
                   <div class="form-group">
                       <label class="sr-only">검색분류</label>
                       <select name="searchopt" class="form-control">
                           <option value="title">제목</option>
                           <option value="course">강의명</option>
                           <option value="student">학생</option>
                       </select>
                   </div>
                   <div class="form-group">
                       <label class="sr-only">검색</label>
                       <input type="text" name="searchtext" class="form-control" placeholder="검색어를 입력해주세요."/>
                   </div>
                   <div class="form-group">
                       <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
                   </div>
               </form>
           </div>
       </div>
             <div class="table-responsive">
                 <table class="table table-hover">
                     <colgroup>
                         <col width="40%">
                         <col width="30%">
                         <col width="10%">
                         <col width="20%">
                     </colgroup>                                   
                     <thead>
                         <tr>
                             <th>제목</th><th>강의명</th><th>게시자</th><th>게시일</th>
                         </tr>
                     </thead>
                     <tbody>
                     	 <%
	                  		MypageLecturerDao lecDao = MypageLecturerDao.getInstance();
                     	 
                     	 	int rowsPerPage = 5;
                     	 	int nowPage = StringUtils.changeIntToString(request.getParameter("p"), 1);                     	 	
                     	 	
                     	 	int totalRows = lecDao.getTotalQnaRows(lecturer.getNo());
                     	 	int totalPages = (int) Math.ceil((double) totalRows / rowsPerPage);
                     	 	int beginIndex = (nowPage - 1) * rowsPerPage + 1;
                     	 	int endIndex = nowPage * rowsPerPage;
                     	 	                     	 			
                     	 	int pagesPerBlock = 5;
                     	 	int nowBlock = (int) Math.ceil((double) nowPage / pagesPerBlock);
                     	 	
                     	 	int totalBlock = (int) Math.ceil((double) totalPages / pagesPerBlock);
                     	 	int beginPage = (nowBlock - 1) * pagesPerBlock + 1;
                     	 	int endPage = nowBlock * pagesPerBlock;
                     	 	if(nowBlock == totalBlock) {
                     	 		endPage = totalPages;
                     	 	}
                     	 	
	                  		String opt = request.getParameter("searchopt");
	                  		String keyword = request.getParameter("searchtext");
	                  		String noAnswer = request.getParameter("noAnswer");
	                  	
	                  		Criteria criteria = new Criteria();
	                  		criteria.setLecturerNo(lecturer.getNo());
	                  		criteria.setOpt(opt);
	                  		criteria.setKeyword(keyword);
	                  		criteria.setNoAnswer(noAnswer);
	                  		criteria.setBeginIndex(beginIndex);
	                  		criteria.setEndIndex(endIndex);
	                  		List<Qna> qnaList = lecDao.getQnaByLecturerNo(criteria);
	                  		for(Qna forQna : qnaList) {
	                  	%>
		                      <tr>
		                          <td>
		                          	<a href="#"><%=forQna.getTitle() %></a>
		                          	<%
		                          		if(forQna.getAnsContent() != null) {
		                          	%>
		                          		<span class="label label-success">답변완료</span>
		                          	<%
		                          		} else {
		                          	%>
		                          		<span class="label label-danger">미답변 질문</span>
		                          	<%
		                          		}
		                          	%>
		                          </td>
		                          <td><a href="mycourse/course-info.jsp?cno=<%=forQna.getCourse().getNo() %>"><%=forQna.getCourse().getName() %></a></td>
		                          <td><%=forQna.getStudent().getName()%></td>
		                          <td><%=DateUtils.yyyymmddhhmmss(forQna.getQuesDate()) %></td>
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
		                         <li><a href="?p=<%=beginPage - 1 %>"><span class="glyphicon glyphicon-backward"></span></a></li>
                     	 <%
                     	 	}
                     	 %>
                         <%
                         	if(nowPage != 1) {
                         %>
		                         <li><a href="?p=<%=nowPage - 1 %>"><span class="glyphicon glyphicon-triangle-left"></span></a></li>
                         <%
                         	}
                         %>
                     	 <%
                     	 	for(int index=beginPage; index<=endPage; index++) {
                     	 %>
                         		<li><a href="?p=<%=index %>"><%=index %></a></li>                     	 
                     	 <%		
                     	 	}
                     	 %>
                     	 <%
                     	 	if(nowPage != totalPages) {
                     	 %>
	                         	<li><a href="?p=<%=nowPage + 1 %>"><span class="glyphicon glyphicon-triangle-right"></span></a></li>
                     	 <%
                     	 	}
                     	 %>
                     	 <%
                     	 	if(nowBlock != totalBlock) {
                     	 		
                     	 %>
		                         <li><a href="?p=<%=beginPage + pagesPerBlock %>"><span class="glyphicon glyphicon-forward"></span></a></li>
                     	 <%
                     	 	}
                     	 %>
                     </ul>
                 </div>
             </div>
         </div>
     </div>
   	<%@ include file="../../common/footer.jsp" %>    
</body>
</html>