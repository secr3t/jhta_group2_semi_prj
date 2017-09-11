<%@page import="pro.course.vo.Course"%>
<%@page import="java.util.List"%>
<%@page import="pro.criteria.vo.Criteria"%>
<%@page import="pro.utils.StringUtils"%>
<%@page import="pro.mypage.dao.MypageCourseDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Course Manager</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<%@ include file="/mypage/admin/logincheck.jsp" %>
	<%@ include file="/common/nav.jsp" %>
	<div class="container">
 		<div class="col-sm-offset-2 page-header">
			<h1>강의 관리</h1>
		</div>
		
		<div class="col-sm-2">
			<%@ include file="../left-menu.jsp" %>
		</div>
		<div class="col-sm-9">
             <div class="row">
               	<div class="col-sm-3">
               		<label>정렬 :</label>
               		<button><span class="glyphicon glyphicon-ok-sign"></span></button>
               		<button><span class="glyphicon glyphicon-remove-sign"></span></button>                		
               		<button><span class="glyphicon glyphicon-sort-by-alphabet"></span></button>
               		<button><span class="glyphicon glyphicon-sort-by-alphabet-alt"></span></button>
               	</div>
               	<div class="col-sm-7 pull-right">
	                <form method="post" action="manager-course.jsp" class="form-inline text-right">
	            		<div class="form-group">
	                        <label class="sr-only">검색분류</label>
	                        <select name="searchcategory" class="form-control">
	                            <option value="course">강의명</option>
	                            <option value="lecturer">강사명</option>
	                            <option value="dept">강의분류</option>
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
                         <col width="30%">
                         <col width="20%">
                         <col width="20%">
                         <col width="20%">
                         <col width="10%">
                     </colgroup>                                   
                     <thead>
                         <tr>
                             <th>강의명</th><th>강의분야</th><th>강사명</th><th>등록된 강의 수</th><th>강의 중</th>
                         </tr>
                     </thead>
                     <tbody>
                     <%
                     request.setCharacterEncoding("utf-8");
                     MypageCourseDao courDao = MypageCourseDao.getInstance();
                     
                     String opt = request.getParameter("searchopt");
                     String keyword = request.getParameter("searchtext");   
                     String noAnswer = request.getParameter("noAnswer");   
                     
                     int rowsPerPage = 5;
                     int pagesPerBlock = 1;
                     
                     int nowPage = StringUtils.changeIntToString(request.getParameter("p"), 1);
                     int nowBlock = (int) Math.ceil((double) nowPage / pagesPerBlock);
                     
                     int beginIndex = (nowPage - 1) * rowsPerPage + 1;
                     int endIndex = nowPage * rowsPerPage;
                     int beginPage = (nowBlock -1) * pagesPerBlock + 1;
                     int endPage = nowBlock * pagesPerBlock;
                     
                     Criteria criteria = new Criteria();
                     if(opt != null) {
	                     criteria.setOpt(opt);                    	 
                     }
                     if(keyword != null) {
	                     criteria.setKeyword(keyword);                    	 
                     }
                     criteria.setBeginIndex(beginIndex);
                     criteria.setEndIndex(endIndex);
                     criteria.setNoAnswer(noAnswer);
                     
                     List<Course> courList = courDao.getCourseInfo(criteria);
                     int totalRows = courDao.getTotalCourses(criteria);
                     int totalPages = (int) Math.ceil((double) totalRows / rowsPerPage);
                     int totalBlock = (int) Math.ceil((double) totalPages / pagesPerBlock);
                     
                     if(nowBlock >= totalBlock) {
                  	   endPage = totalPages;
                     }
                     
                     for(Course forCourse : courList) {
					 %>
                         <tr>
                             <td><a href="course-detail.jsp?cno=<%=forCourse.getNo() %>"><%=forCourse.getName() %></a></td>
                             <td><%=forCourse.getDept().getName() %></td>
                             <td><%=forCourse.getLecturer().getName() %></td>
                             <td><%=courDao.getTotalCourseVideoByCourseNo(forCourse.getNo()) %>개</td>                                
                             <td>
                             	<%=forCourse.getPermit() %>
                             	<a href="course-update.jsp?cno=<%=forCourse.getNo() %>&change=<%="Y".equals(forCourse.getPermit()) ? "2" : "1" %>">
                             		<span class="text-<%="Y".equals(forCourse.getPermit()) ? "danger" : "primary" %> glyphicon glyphicon-<%="Y".equals(forCourse.getPermit()) ? "remove" : "ok" %>-sign pull-right"></span>
                             	</a>
                             </td>
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
	 <%@ include file="/common/footer.jsp" %>
</body>
</html>