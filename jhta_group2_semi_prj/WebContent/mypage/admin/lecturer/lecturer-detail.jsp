<%@page import="pro.mypage.dao.MypageCourseDao"%>
<%@page import="pro.criteria.vo.Criteria"%>
<%@page import="pro.course.vo.Course"%>
<%@page import="java.util.List"%>
<%@page import="pro.mypage.dao.MypageLecturerDao"%>
<%@page import="pro.utils.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Detail</title>
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
	<%@ include file="/mypage/admin/logincheck.jsp" %>
	<%@ include file="/common/nav.jsp" %>
    <div class="container">
 		<div class="col-sm-offset-2 page-header">
 		<%
 		int lecturerNo = StringUtils.changeIntToString(request.getParameter("lno"), 1);
 		MypageLecturerDao lecDao = MypageLecturerDao.getInstance();
 		Lecturer lecturer = lecDao.getLecturerByNo(lecturerNo);
 		%>
			<h1>강사 상세 정보<small> - <%=lecturer.getName() %></small>
			<%
			String lecPermit = lecturer.getPermit(); 
			%>
				<a href="update.jsp?lno=<%=lecturerNo %>&change=<%= "Y".equals(lecPermit) ? "2" : "1" %>" class="label label-<%="Y".equals(lecPermit) ? "primary" : "danger" %> pull-right"><%="Y".equals(lecPermit) ? "강사 허용 중" : "강사 미허용 중" %></a>
			</h1>
		</div>
		
	    <div class="col-sm-2">
			<%@ include file="../left-menu.jsp" %>
	    </div>
	    <div class="col-sm-9">
	        <div class="row">
	            <div class="panel panel-warning">
	                <div class="panel-heading">
	                    <label>강의 목록</label>
	                </div>
	                <table class="table table-condensed">
	                    <colgroup>
	                        <col width="20%">
	                        <col width="20%">
	                        <col width="10%">
	                        <col width="50%">
	                    </colgroup>
	                    <thead>
		                     <tr>
		                     	<th>강의명</th><th>강의 분류</th><th>영상 수</th><th>요약설명</th>
		                     </tr>
	                 	</thead>
	                 	<tbody>
	                 	<%
	                 	Criteria criteria = new Criteria();
	                 	criteria.setLecturerNo(lecturerNo);
	                 	criteria.setBeginIndex(1);
	                 	criteria.setEndIndex(1000);
	                 	List<Course> courList = lecDao.getCourseByLecturerNo(criteria);
	                 	for(Course forCourse : courList) {
	                 	%>	                 	
		                     <tr>
			                     <td><a href="#"><%=forCourse.getName() %></a></td>
			                     <td><%=forCourse.getDept().getName() %></td>
			                     <td>
			                     	<%=MypageCourseDao.getInstance().getTotalCourseVideoByCourseNo(forCourse.getNo()) %>개
			                     </td>
			                     <td><%=forCourse.getSummary() %></td>
		                	 </tr>
	                 	<%
	                 	}
	                 	%>
	               		</tbody>                    
	                </table>
	            </div>
	        </div>
	        
	        <div class="row">
	            <div class="panel panel-primary">
	                <div class="panel-heading">
	                    <label>강사정보</label>
	                </div>
	                <div class="panel-body">
		                <div class="col-sm-8">
			                <table class="table table-bordered">
			                    <tr>
			                        <th colspan="4">Email</th><td colspan="8"><%=lecturer.getEmail() %></td>
			                    </tr>                        
			                    <tr>
									<th colspan="4">전화번호</th><td colspan="2"><%=lecturer.getPhone() %></td>
			                    </tr>                        
			                    <tr>
									<th colspan="4">이력</th><td colspan="6"><%=lecturer.getCareer() %></td>
			                    </tr>
			                </table>
			            </div>
		                <div class="col-sm-4">
							<img src="<%=lecturer.getPicture() %>" alt="강사사진" width="180px"/>
		                </div>
		        	</div>
	            </div>
	        </div>
	    </div>
	</div>
    <%@ include file="/common/footer.jsp" %> 
</body>
</html>