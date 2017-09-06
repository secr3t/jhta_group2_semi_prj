<%@page import="pro.course.vo.Course"%>
<%@page import="pro.mypage.dao.MypageCourseDao"%>
<%@page import="pro.utils.DateUtils"%>
<%@page import="pro.qna.vo.Qna"%>
<%@page import="java.util.List"%>
<%@page import="pro.mypage.dao.MypageStudentDao"%>
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
	<%@ include file="/mypage/student/logincheck.jsp" %>
	<%@ include file="/common/nav.jsp" %>
    <div class="container">
		<div class="col-sm-offset-2 page-header">
			<h1>등록된 Q&amp;A</h1>
		</div>        

    	<div class="col-sm-2">
			<%@ include file="left-menu.jsp" %>
		</div>  
        <div class="col-sm-9">
        
             <form method="get" action="#" class="form-inline text-right">
                 <div class="form-group">
                     <label class="sr-only">검색분류</label>
                     <select name="searchcategory" class="form-control">
                         <option value="title">제목</option>
                         <option value="lecture">강의명</option>
                         <option value="lecturer">강사</option>
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
                             <th>제목</th><th>강의명</th><th>강사</th><th>게시일</th>
                         </tr>
                     </thead>
                     <tbody>
	                  	<%
	                  		MypageStudentDao stuDao = MypageStudentDao.getInstance();
	                  		List<Qna> qnaList = stuDao.getQnaByStudentNo(student.getNo());
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
		                          <td>
		                          <%
			                  		MypageCourseDao courDao = MypageCourseDao.getInstance();
			                  		Course course = courDao.getCourseByCourseNo(forQna.getCourse().getNo());
		                          %>
		                          <%=course.getLecturer().getName() %>
		                          </td>
		                          <td><%=DateUtils.yyyymmddhhmmss(forQna.getQuesDate()) %></td>
		                      </tr>       	
	                  	<%
	                  		}
	                  	%>
                     </tbody>
                 </table>
                 <div class="text-center">
                     <ul class="pagination pagination-sm">
                         <li><a href="#"><span class="glyphicon glyphicon-backward"></span></a></li>
                         <li><a href="#"><span class="glyphicon glyphicon-triangle-left"></span></a></li>
                         <li><a href="#">1</a></li>
                         <li><a href="#">2</a></li>
                         <li><a href="#">3</a></li>
                         <li><a href="#">4</a></li>
                         <li><a href="#">5</a></li>
                         <li><a href="#"><span class="glyphicon glyphicon-triangle-right"></span></a></li>
                         <li><a href="#"><span class="glyphicon glyphicon-forward"></span></a></li>
                     </ul>
                 </div>
             </div>
         </div>
     </div>
   	<%@ include file="/common/footer.jsp" %>  
</body>
</html>