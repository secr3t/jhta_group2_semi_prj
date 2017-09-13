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
               	<div class="col-sm-6">
               		<label>정렬 :</label>
               	<%
	                request.setCharacterEncoding("utf-8");
	                String opt = request.getParameter("searchopt");
	                String keyword = request.getParameter("searchtext");   
	                String noAnswer = request.getParameter("noAnswer");   
	           		
	           		String params = "";           		
	      			if(opt != null) {
	      				params += "?searchopt=" + opt;
	      				params += "&searchtext=" + keyword;
	      			}
	      			
	      			if(opt != null && noAnswer != null) {
	      				params += "&noAnswer=" + noAnswer;
	      			} else if(opt == null && noAnswer != null) {
	      				params += "?noAnswer=" + noAnswer;
	      			}
	      			
	      			if(noAnswer == null) {
              	%>
	              	<a href="<%=params + ("".equals(params) ? "?" : "&") %>noAnswer=N" class="btn btn-info btn-sm">Y</a>
	              	<a href="<%=params + ("".equals(params) ? "?" : "&") %>noAnswer=Y" class="btn btn-danger btn-sm">N</a>
              	<%
      				}
              	%>
              		<a href="manager-course.jsp" class="btn btn-default btn-sm">전체 목록</a>     		
               	</div>
               	<div class="col-sm-6 pull-right">
	                <form method="get" action="manager-course.jsp" class="form-inline text-right">
	            		<div class="form-group">
	                        <label class="sr-only">검색분류</label>
	                        <select name="searchopt" class="form-control">
	                            <option value="course" <%="course".equals(opt) ? "selected" : "" %>>강의명</option>
	                            <option value="lecturer" <%="lecturer".equals(opt) ? "selected" : "" %>>강사명</option>
	                            <option value="dept" <%="dept".equals(opt) ? "selected" : "" %>>강의분류</option>
	                        </select>
	                    </div>
	                    <div class="form-group">
	                        <label class="sr-only">검색</label>
	                        <input type="text" name="searchtext" class="form-control" value="<%=keyword != null ? keyword : "" %>" placeholder="검색어를 입력해주세요."/>
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
                     MypageCourseDao courDao = MypageCourseDao.getInstance();
                     
                     int rowsPerPage = 3;
                     int pagesPerBlock = 2;
                     
                     int nowPage = StringUtils.changeIntToString(request.getParameter("p"), 1);
                     int nowBlock = (int) Math.ceil((double) nowPage / pagesPerBlock);
                     
                     int beginIndex = (nowPage - 1) * rowsPerPage + 1;
                     int endIndex = nowPage * rowsPerPage;
                     int beginPage = (nowBlock -1) * pagesPerBlock + 1;
                     int endPage = nowBlock * pagesPerBlock;
                     
                     Criteria criteria = new Criteria();
	                 criteria.setOpt(opt);                    	 
					 criteria.setKeyword(keyword);                    	 
                     criteria.setNoAnswer(noAnswer);
                     criteria.setBeginIndex(beginIndex);
                     criteria.setEndIndex(endIndex);
                     
                     int totalRows = courDao.getTotalCourses(criteria);
                     int totalPages = (int) Math.ceil((double) totalRows / rowsPerPage);
                     int totalBlock = (int) Math.ceil((double) totalPages / pagesPerBlock);
                     
                     if(nowBlock >= totalBlock) {
                  	   endPage = totalPages;
                     }
                     
                     List<Course> courList = courDao.getCourseInfo(criteria);
                     if(courList.size() == 0) {
                   	 %>
                  	<tr>
                   		<td colspan="12" class="text-center">강의가 존재하지 않습니다.</td>
                   	</tr>                   	 
                   	 <%
                     }
                     for(Course forCourse : courList) {
                    	 String forPermit = forCourse.getPermit();
					 %>
                         <tr>
                             <td><a href="course-detail.jsp?cno=<%=forCourse.getNo() %>"><%=forCourse.getName() %></a></td>
                             <td><a href="manager-course.jsp?searchopt=dept&searchtext=<%=forCourse.getDept().getName() %>"><%=forCourse.getDept().getName() %></a></td>
                             <td><a href="../lecturer/lecturer-detail.jsp?lno=<%=forCourse.getLecturer().getNo() %>"><%=forCourse.getLecturer().getName() %></a></td>
                             <td><%=courDao.getTotalCourseVideoByCourseNo(forCourse.getNo()) %>개</td>                                
                             <td>
                             	<%=forPermit %>
                             	<a href="course-update.jsp?cno=<%=forCourse.getNo() %>&change=<%="Y".equals(forPermit) ? "2" : "1" %>">
                             		<span class="text-<%="Y".equals(forPermit) ? "danger" : "primary" %> glyphicon glyphicon-<%="Y".equals(forPermit) ? "remove" : "ok" %>-sign pull-right" title="<%="Y".equals(forPermit) ? "취소하기" : "허가하기" %>"></span>
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
		                         <li><a href="<%=params + ("".equals(params) ? "?" : "&") %>p=<%=beginPage - 1 %>"><span class="glyphicon glyphicon-backward"></span></a></li>
                     	 <%
                     	 	}
                     	 %>
                         <%
                         	if(nowPage != 1) {
                         %>
		                         <li><a href="<%=params + ("".equals(params) ? "?" : "&") %>p=<%=nowPage - 1 %>"><span class="glyphicon glyphicon-triangle-left"></span></a></li>
                         <%
                         	}
                         %>
                     	 <%
                     	 	for(int index=beginPage; index<=endPage; index++) {
                     	 %>
                         		<li class="<%=index == nowPage ? "active" : ""  %>"><a href="<%=params + ("".equals(params) ? "?" : "&") %>p=<%=index %>"><%=index %></a></li>                     	 
                     	 <%		
                     	 	}
                     	 %>
                     	 <%
                     	 	if(nowPage < totalPages) {
                     	 %>
	                         	<li><a href="<%=params + ("".equals(params) ? "?" : "&") %>p=<%=nowPage + 1 %>"><span class="glyphicon glyphicon-triangle-right"></span></a></li>
                     	 <%
                     	 	}
                     	 %>
                     	 <%
                     	 	if(nowBlock < totalBlock) {
                     	 		
                     	 %>
		                         <li><a href="<%=params + ("".equals(params) ? "?" : "&") %>p=<%=beginPage + pagesPerBlock %>"><span class="glyphicon glyphicon-forward"></span></a></li>
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