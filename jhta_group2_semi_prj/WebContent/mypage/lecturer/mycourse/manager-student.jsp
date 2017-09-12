<%@page import="pro.utils.DateUtils"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="pro.enrollment.vo.Enrollment"%>
<%@page import="java.util.List"%>
<%@page import="pro.criteria.vo.Criteria"%>
<%@page import="pro.course.vo.Course"%>
<%@page import="pro.mypage.dao.MypageCourseDao"%>
<%@page import="pro.utils.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Student Manager</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<%@ include file="/mypage/lecturer/logincheck.jsp" %>
	<%@ include file="/common/nav.jsp" %>
	<%
		int courseNo = StringUtils.changeIntToString(request.getParameter("cno"));
		MypageCourseDao courDao = MypageCourseDao.getInstance();
		Course course = courDao.getCourseByCourseNo(courseNo);
	%>
    <div class="container">
 		<div class="col-sm-offset-2 page-header">
			<h1>학생관리 <small> - <%=course.getName() %></small></h1>
		</div>
		
    	<div class="col-sm-2">
			<%@ include file="../left-menu.jsp" %>
		</div>  
        <div class="col-sm-9">
             <div class="row">
             	<div class="col-sm-3">
             	<%
             		request.setCharacterEncoding("utf-8");
          			String keyword = request.getParameter("searchtext");
             		
             		String params = "";
             		if(keyword != null) {
             			params += "?searchtext=" + keyword;
             		}
             	%>
             		<label>정렬 :</label>
             		<a href="manager-student.jsp?cno=<%=course.getNo() %>" class="btn btn-default btn-sm">전체 목록</a>
             		<button><span class="glyphicon glyphicon-sort-by-alphabet"></span></button>
             		<button><span class="glyphicon glyphicon-sort-by-alphabet-alt"></span></button>
             	</div>
             	<div class="col-sm-7 pull-right">
               		<form method="get" action="manager-student.jsp" class="form-inline text-right">
               			<input type="hidden" name="cno" value="<%=course.getNo() %>"/>
                   		<div class="form-group">
                       		<label class="sr-only">검색</label>
                       		<input type="text" name="searchtext" class="form-control" value="<%=keyword != null ? keyword : "" %>" placeholder="학생명을 입력해주세요."/>
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
                         <col width="20%">
                         <col width="10%">
                         <col width="50%">
                         <col width="20%">
                     </colgroup>                                   
                     <thead>
                         <tr>
                             <th>ID</th><th>학생명</th><th>진행률</th><th>등록일</th>
                         </tr>
                     </thead>
                     <tbody>
                     	<%
                  	 	int rowsPerPage = 5;
                  	 	int pagesPerBlock = 5;
                  	 	
                  	 	int nowPage = StringUtils.changeIntToString(request.getParameter("p"), 1);                     	 	
                  	 	int nowBlock = (int) Math.ceil((double) nowPage / pagesPerBlock);
                  	 	
                  	 	int beginIndex = (nowPage - 1) * rowsPerPage + 1;
                  	 	int endIndex = nowPage * rowsPerPage;
                  	 	int beginPage = (nowBlock - 1) * pagesPerBlock + 1;
                  	 	int endPage = nowBlock * pagesPerBlock;
                  	
                  		Criteria criteria = new Criteria();
                  		criteria.setCourseNo(course.getNo());
                  		criteria.setKeyword(keyword);
                  		criteria.setBeginIndex(beginIndex);
                  		criteria.setEndIndex(endIndex);
	                  		
                  	 	int totalRows = courDao.getTotalStudentByCourseNo(criteria);
                  	 	int totalPages = (int) Math.ceil((double) totalRows / rowsPerPage);
                  	 	int totalBlock = (int) Math.ceil((double) totalPages / pagesPerBlock);
                  	 	if(nowBlock >= totalBlock) {
                  	 		endPage = totalPages;
                  	 	}
                  	 	
	                  	List<Enrollment> enrollList = courDao.getStudentsByCourseNo(criteria);
	                  	for(Enrollment forEnroll : enrollList) {
	                  	%>
                         <tr>
                             <td><%=forEnroll.getStudent().getEmail() %></td>
                             <td><%=forEnroll.getStudent().getName() %></td>
                             <td>
                                 <div class="progress">
                                     <%
                                     	int totalVideo = courDao.getTotalCourseVideoByCourseNo(forEnroll.getCourse().getNo());
                                     	Map<String, Integer> intMap = new HashMap<>();
                                     	intMap.put("param1", forEnroll.getStudent().getNo());
                                     	intMap.put("param2", forEnroll.getCourse().getNo());
                                     	int finishVideo = courDao.getTotalFinishedCourseByMap(intMap);
                                     %>
                                     <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemin="100" style="width: <%=totalVideo == 0? "0" :(finishVideo / totalVideo) * 100 %>%;">
                                        <span><%=totalVideo == 0? "0" :(finishVideo / totalVideo) * 100 %>%</span>
                                     </div>
                                 </div>
                            </td>                                
                            <td><%=DateUtils.yyyymmdd(forEnroll.getStartDate()) %></td>
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
		                         <li><a href="<%=params + ("".equals(params) ? "?" : "&") %>p=<%=beginPage - 1 %>&cno=<%=course.getNo() %>"><span class="glyphicon glyphicon-backward"></span></a></li>
                     	 <%
                     	 	}
                     	 %>
                         <%
                         	if(nowPage != 1) {
                         %>
		                         <li><a href="<%=params + ("".equals(params) ? "?" : "&") %>p=<%=nowPage - 1 %>&cno=<%=course.getNo() %>"><span class="glyphicon glyphicon-triangle-left"></span></a></li>
                         <%
                         	}
                         %>
                     	 <%
                     	 	for(int index=beginPage; index<=endPage; index++) {
                     	 %>
                         		<li class="<%=index == nowPage ? "active" : ""  %>"><a href="<%=params + ("".equals(params) ? "?" : "&") %>p=<%=index %>&cno=<%=course.getNo() %>"><%=index %></a></li>                     	 
                     	 <%		
                     	 	}
                     	 %>
                     	 <%
                     	 	if(nowPage != totalPages) {
                     	 %>
	                         	<li><a href="<%=params + ("".equals(params) ? "?" : "&") %>p=<%=nowPage + 1 %>&cno=<%=course.getNo() %>"><span class="glyphicon glyphicon-triangle-right"></span></a></li>
                     	 <%
                     	 	}
                     	 %>
                     	 <%
                     	 	if(nowBlock != totalBlock) {
                     	 		
                     	 %>
		                         <li><a href="<%=params + ("".equals(params) ? "?" : "&") %>p=<%=beginPage + pagesPerBlock %>&cno=<%=course.getNo() %>"><span class="glyphicon glyphicon-forward"></span></a></li>
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