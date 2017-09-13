<%@page import="pro.criteria.vo.Criteria"%>
<%@page import="pro.course.vo.Course"%>
<%@page import="pro.mypage.dao.MypageCourseDao"%>
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
	   .table-bordered td {
	       text-align: right;
	   }
  </style>	
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
			<h1>영상 상세 정보<small> - <%=course.getName() %></small><span class="label label-<%="Y".equals(course.getPermit()) ? "info" : "warning" %> pull-right"><%="Y".equals(course.getPermit()) ? "허가 완료" : "미허가" %></span></h1>
           	<div class="text-right">
     			<a href="/jhta_group2_semi_prj/lecturedisplay/lecturedetail/introducePage.jsp?courseNo=<%=course.getNo() %>" class="btn btn-md btn-primary">강의 페이지로</a>
      		</div>
		</div>    

        <div class="col-sm-2">
			<%@ include file="../left-menu.jsp" %>
        </div>
        <div class="col-sm-9">
            
            <div class="row well">
                <div class="col-sm-8">
                    <label>강의 소개</label>
                    <p><%=course.getSummary() %></p>
                </div>
                <div class="col-sm-4">
                    <img src="<%=lecturer.getPicture() %>" alt="강사사진" style="width: 240px;"/>
                </div>
            </div>
            
            <div class="row">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <label>강의 관리</label>
                    </div>
                    <table class="table table-bordered">
                        <colgroup>
                            <col width="50%">
                            <col width="30%">
                            <col width="20%">
                        </colgroup>
                        <tr>
                            <th>현재 등록된 강의 수</th><td><%=courDao.getTotalCourseVideoByCourseNo(course.getNo()) %>개</td>
                            <td><a href="video-info.jsp?cno=<%=course.getNo() %>" class="btn btn-info pull-right">영상 관리</a></td>
                        </tr>                        
                        <tr>
                        <%
                        Criteria criteria = new Criteria();
                        criteria.setCourseNo(courseNo);
                        %>
                            <th>수강 중인 학생 수</th><td><%=courDao.getTotalStudentByCourseNo(criteria) %>명</td>
                            <td><a href="manager-student.jsp?cno=<%=course.getNo() %>" class="btn btn-info pull-right">학생 관리</a></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/common/footer.jsp" %> 
</body>
</html>