<%@page import="pro.course.vo.Course"%>
<%@page import="java.util.List"%>
<%@page import="pro.mypage.dao.MypageLecturerDao"%>
<%@page import="pro.mypage.dao.MypageCourseDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>My Page</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
      .glyphicon {
            font-size: 20px;
      }
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
			<h1>My Page</h1>
		</div>    

	  	<div class="col-sm-2">
			<%@ include file="left-menu.jsp" %>
		</div>  
	    <div class="col-sm-9">
		    <div class="row">
		        <div class="col-sm-offset-1 col-sm-10">
		              <div class="panel panel-success">
		               <div class="panel-heading">
		                   <label><%=lecturer.getName() %>님 환영합니다.</label>
		                   <a href="myinfo/update-myinfo.jsp" class="pull-right">내 정보로 이동</a>
		               </div>
		            </div>
		        </div>
		    </div>
	 
	        <div class="row">
	            <div class="col-sm-12">
	                <div class="panel panel-info">
	                    <div class="panel-heading">
	                        <label><a href="mycourse/mycourse.jsp">내 강의 목록</a></label>
	                    </div>
	                    <table class="table table-condensed table-hover">
	                        <colgroup>
	                            <col width="30%">
	                            <col width="20%">
	                            <col width="20%">
	                            <col width="30%">
	                        </colgroup>
	                        <thead>
	                            <tr>
	                                <th>강의명</th><th>강의 수</th><th>학생 수</th><th>강의 평점</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                        	<%
	                        		MypageCourseDao courDao = MypageCourseDao.getInstance();
	                        		MypageLecturerDao lecDao = MypageLecturerDao.getInstance();
	                        		List<Course> courseList = lecDao.getCourseByLecturerNo(lecturer.getNo());
	                        		for(Course forCourse : courseList) {
	                        	%>
	                            <tr>
	                                <td><a href="mycourse/course-info.jsp?cno=<%=forCourse.getNo() %>"><%=forCourse.getName() %></a></td>
	                                <td><%=courDao.getTotalCourseVideoByCourseNo(forCourse.getNo()) %></td>
	                                <td><%=courDao.getTotalStudentByCourseNo(forCourse.getNo()) %></td>
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
	                            </tr>
	                        	<%
	                        		}
	                        	%>
	                        </tbody>
	                    </table>
	                </div>
	            </div>
	            <div class="col-sm-12">
	                <div class="panel panel-warning">
	                    <div class="panel-heading">
	                        <label><a href="myqna.jsp" class="pull-right">미답변 질문</a></label>
	                    </div>
	                    <div class="table-responsive">
	                        <table class="table table-condensed table-hover">
	                            <colgroup>
	                                <col width="50%">
	                                <col width="30%">
	                                <col width="20%">
	                            </colgroup>                                   
	                            <thead>
	                                <tr>
	                                    <th>제목</th><th>강의명</th><th>게시일</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                                <tr>
	                                    <td><a href="#">Java가 무엇입니까?dddddddddddd</a></td>
	                                    <td><a href="#">Java</a></td>
	                                    <td>17/08/21</td>
	                                </tr>                               
	                                <tr>
	                                    <td><a href="#">Java가 무엇입니까?dddddddddddd</a></td>
	                                    <td><a href="#">Java</a></td>
	                                    <td>17/08/21</td>
	                                </tr>
	                                <tr>
	                                    <td><a href="#">Java가 무엇입니까?dddddddddddd</a></td>
	                                    <td><a href="#">Java</a></td>
	                                    <td>17/08/21</td>
	                                </tr>                
	                                <tr>
	                                    <td><a href="#">Java가 무엇입니까?dddddddddddd</a></td>
	                                    <td><a href="#">Java</a></td>
	                                    <td>17/08/21</td>
	                                </tr>
	                            </tbody>
	                        </table>
	                    </div>
	                </div>
	            </div>
	        </div>
	 	</div>
     </div>
   	<%@ include file="../../common/footer.jsp" %>   
</body>
</html>