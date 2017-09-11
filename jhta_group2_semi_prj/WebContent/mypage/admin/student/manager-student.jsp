<%@page import="java.util.List"%>
<%@page import="pro.utils.StringUtils"%>
<%@page import="pro.criteria.vo.Criteria"%>
<%@page import="pro.mypage.dao.MypageStudentDao"%>
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
	<%@ include file="/mypage/admin/logincheck.jsp" %>
	<%@ include file="/common/nav.jsp" %>
	<div class="container">
 		<div class="col-sm-offset-2 page-header">
			<h1>학생 관리</h1>
		</div>
			
		<div class="col-sm-2">
			<%@ include file="../left-menu.jsp" %>
		</div>
		<div class="col-sm-9">
               <div class="row">
               	<div class="col-sm-3">
               	<%
               	request.setCharacterEncoding("utf-8");
                String opt = request.getParameter("searchopt");
                String keyword = request.getParameter("searchtext");
                
           		String params = "";           		
      			if(opt != null) {
      				params += "?searchopt=" + opt;
      				params += "&searchtext=" + keyword;
      			}
               	%>
               		<label>정렬 :</label>
               		<button><span class="glyphicon glyphicon-sort-by-alphabet"></span></button>
               		<button><span class="glyphicon glyphicon-sort-by-alphabet-alt"></span></button>
               	</div>
               	<div class="col-sm-7 pull-right">
	                <form method="post" action="manager-student.jsp" class="form-inline text-right">
	            		<div class="form-group">
	                        <label class="sr-only">검색분류</label>
	                        <select name="searchopt" class="form-control">
	                            <option value="id" <%="id".equals(opt) ? "selected" : "" %>>Email</option>
	                            <option value="name" <%="name".equals(opt) ? "selected" : "" %>>학생명</option>
	                        </select>
	                    </div>
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
                           <col width="30%">
                           <col width="20%">
                           <col width="30%">
                           <col width="20%">
                       </colgroup>                                   
                       <thead>
                           <tr>
                               <th>ID</th><th>학생명</th><th>수강 중인 강의</th><th>보유 포인트</th>
                           </tr>
                       </thead>
                       <tbody>
                       <% 
                       MypageStudentDao stuDao = MypageStudentDao.getInstance();
                       
                       int rowsPerPage = 2;
                       int pagesPerBlock = 1;
                       
                       int nowPage = StringUtils.changeIntToString(request.getParameter("p"), 1);
                       int nowBlock = (int) Math.ceil((double) nowPage / pagesPerBlock);
                       
                       int beginIndex = (nowPage - 1) * rowsPerPage + 1;
                       int endIndex = nowPage * rowsPerPage;
                       int beginPage = (nowBlock - 1) * pagesPerBlock + 1;
                       int endPage = nowBlock * pagesPerBlock;
                       
                       Criteria criteria = new Criteria();
                       criteria.setOpt(opt);
                       criteria.setKeyword(keyword);
                       criteria.setBeginIndex(beginIndex);
                       criteria.setEndIndex(endIndex);
                       
                       int totalRows = stuDao.getTotalStudents(criteria);
                       int totalPages = (int) Math.ceil((double) totalRows / rowsPerPage);
                       int totalBlock = (int) Math.ceil((double) totalPages / pagesPerBlock);
                       
                       if(nowBlock >= totalBlock) {
                    	   endPage = totalPages;
                       }
						
                       List<Student> stuList = stuDao.getStudentInfo(criteria);
                       for(Student forStudent : stuList) {
                       %>
                           <tr>
                               <td><a href="student-detail.jsp?sno=<%=forStudent.getNo() %>"><%=forStudent.getEmail() %></a></td>
                               <td><%=forStudent.getName() %></td>
                               <td> <%=stuDao.getEnrollmentByStudentNo(forStudent.getNo()).size()%>개</td>                                
                               <td><%=forStudent.getPoint() %></td>
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
                     	 	if(nowPage != totalPages) {
                     	 %>
	                         	<li><a href="<%=params + ("".equals(params) ? "?" : "&") %>p=<%=nowPage + 1 %>"><span class="glyphicon glyphicon-triangle-right"></span></a></li>
                     	 <%
                     	 	}
                     	 %>
                     	 <%
                     	 	if(nowBlock != totalBlock) {
                     	 		
                     	 %>
		                         <li><a href="<%=params + ("".equals(params) ? "?" : "&") %>p=<%=beginPage + pagesPerBlock %>"><span class="glyphicon glyphicon-forward"></span></a></li>
                     	 <%
                     	 	}
                     	 %>
                     </ul>
                     <div class="pull-right">
                     	<a href="manager-student.jsp" class="btn btn-default btn-sm">전체 목록으로</a>
                     </div>                         
                   </div>
               </div>
    	</div>
	 </div>
	 <%@ include file="/common/footer.jsp" %>
</body>
</html>