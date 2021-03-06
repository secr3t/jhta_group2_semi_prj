<%@page import="pro.utils.StringUtils"%>
<%@page import="pro.criteria.vo.Criteria"%>
<%@page import="pro.course.vo.Course"%>
<%@page import="java.util.List"%>
<%@page import="pro.mypage.dao.MypageLecturerDao"%>
<%@page import="pro.mypage.dao.MypageCourseDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>My Course</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<%@ include file="/mypage/lecturer/logincheck.jsp" %>
	<%@ include file="/common/nav.jsp" %>
    <div class="container">
 		<div class="col-sm-offset-2 page-header">
			<h1>내 강의</h1>
		</div>
		
    	<div class="col-sm-2">
			<%@ include file="../left-menu.jsp" %>
		</div>  
        <div class="col-sm-9">
             <div class="row">
                 <div class="col-sm-10">
                     <div class="panel panel-warning">
                         <div class="panel-heading">
                             <label>강의 요약</label>
                         </div>
                         <div class="panel-body">
                         	<div class="col-sm-7">
		                        <h4><strong id="course-name">강의명</strong></h4>
		                        <p id="course-summary">
		                         	해당 강의에 대한 간략한 설명입니다.
		                        </p>
                         	</div>
                         	<div class="col-sm-5">
                         		<h5 id="course-dept">강의 분류 :</h5>
                         	</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-10">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <label>내 강의 목록</label>
                        </div>
                          <table class="table table-hover" id="course-table">
                            <colgroup>
                                <col width="30%">
                                <col width="10%">
                                <col width="10%">
                                <col width="10%">
                                <col width="30%">
                                <col width="10%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>강의명</th><th>강의 수</th><th>학생 수</th><th>허가</th><th>강의 평점</th><th></th>
                                </tr>
                            </thead>
                            <tbody>
                            	 <%
	                        		MypageCourseDao courDao = MypageCourseDao.getInstance();
	                        		MypageLecturerDao lecDao = MypageLecturerDao.getInstance();
	                        		
		                     	 	int rowsPerPage = 10;
		                     	 	int nowPage = StringUtils.changeIntToString(request.getParameter("p"), 1);                     	 	
		                     	 	
		                     	 	int totalRows = lecDao.getTotalCourseRows(lecturer.getNo());
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
								
	                        		Criteria criteria = new Criteria(); 
	                        		criteria.setLecturerNo(lecturer.getNo());
			                  		criteria.setBeginIndex(beginIndex);
			                  		criteria.setEndIndex(endIndex);
	                        		List<Course> courseList = lecDao.getCourseByLecturerNo(criteria);
	                        		if(courseList.size() == 0) {
	                        	%>
			                    <tr>
			        	        	<td colspan="12" class="text-center">강의가 존재하지 않습니다.</td>
			        	        </tr>
	                        	<%		
	                        		}
	                        		for(Course forCourse : courseList) {
	                        			criteria.setCourseNo(forCourse.getNo());
	                        	%>
	                            <tr>
	                                <td><a href="/mypage/course/course-info.jsp?cno=<%=forCourse.getNo() %>" class="course-info" id="course-info-<%=forCourse.getNo() %>"><%=forCourse.getName() %></a></td>
	                                <td><%=courDao.getTotalCourseVideoByCourseNo(forCourse.getNo()) %></td>
	                                <td><%=courDao.getTotalStudentByCourseNo(criteria) %></td>
	                                <td><%=forCourse.getPermit() %></td>
	                                <td>
									<%
										double avgGrade = courDao.getGradeAvgByCourseNo(forCourse.getNo());
										int intGrade = (int) Math.round(avgGrade);
										for(int i=0; i<intGrade; i++) {
									%>
										<span class="glyphicon glyphicon-star"></span>
									<%		
										}
										for(int i=0; i<(5-intGrade); i++) {
									%>
										<span class="glyphicon glyphicon-star-empty"></span>
									<%		
										}
									%>
										<label class="badge"><%= avgGrade %></label>
	                                </td>
                                	<td><a href="course-info.jsp?cno=<%=forCourse.getNo() %>" class="btn btn-info btn-sm">강의 관리</a></td>
	                            </tr>
	                        	<%
	                        		} 
	                        	%>                                    
                            </tbody>
                        </table>
                        <div class="panel-body">
                            <p class="text-right"><a href="../apply/applyform.jsp" class="btn btn-primary">새 강의 신청</a></p>
                        </div>
                        <div class="panel-footer">
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
		                         		<li class="<%=index == nowPage ? "active" : ""  %>"><a href="?p=<%=index %>"><%=index %></a></li>                     	 
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
            </div>
        </div>
    </div>
   	<%@ include file="/common/footer.jsp" %> 
</body>
<script type="text/javascript">
	(function() {
		var infoList = document.getElementById("course-table").getElementsByClassName("course-info");
		
		for(var index=0; index<infoList.length; index++) {
			var info = infoList[index];	
		
			info.addEventListener("click", function(event) {
				event.preventDefault();
				
				var courseNo = parseInt(event.target.id.replace("course-info-", ""));
			
				var xhr = new XMLHttpRequest();
			
				xhr.onreadystatechange = function() {
					if(xhr.readyState == 4 && xhr.status == 200) {
						var course = JSON.parse(xhr.responseText);
					
						document.getElementById("course-name").textContent = course.name;
						document.getElementById("course-summary").textContent = course.summary;
						document.getElementById("course-dept").textContent = "강의 분류 : " + course.dept.name;
					};
				};
			
				xhr.open("GET", "/jhta_group2_semi_prj/mypage/course/course-info.jsp?cno=" + courseNo);
				xhr.send(null);
			});
		};
	}());
</script>
</html>