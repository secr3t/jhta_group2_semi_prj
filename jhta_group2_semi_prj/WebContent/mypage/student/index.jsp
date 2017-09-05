<%@page import="pro.utils.DateUtils"%>
<%@page import="pro.qna.vo.Qna"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="pro.enrollment.vo.Enrollment"%>
<%@page import="pro.mypage.dao.MypageStudentDao"%>
<%@page import="pro.student.vo.Student"%>
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
	<% 
		Student student = (Student) session.getAttribute("loginedUser");
		if(student == null) {
			response.sendRedirect("../temp-login.jsp");
			return;
		}
	%>
	<%@ include file="../../common/nav.jsp" %>
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
                            	<label><%=student.getName() %>님 환영합니다.</label>
                            	<a href="update-myinfo.jsp" class="pull-right">내 정보로 이동</a>
                        	</div>
                         	<table class="table table-condensed">
                             	<tr>
                                 	<th></th><td></td>
                                 	<th>잔여 포인트</th><td><%= student.getPoint() %> <span class="glyphicon glyphicon-copyright-mark text-warning"></span></td>
                                 	<th><a href="#" class="btn btn-primary btn-sm pull-right">포인트 충전</a></th><td></td>
                             	</tr>
                        	 </table>
                       </div>
                 </div>
             </div>
 
             <div class="row">
                 <div class="col-sm-12">
                     <div class="panel panel-info">
                         <div class="panel-heading">
                             <label><a href="mycourse.jsp" class="pull-right">내 수강 목록</a></label>
                         </div>
                         <table class="table table-condensed table-hover">
                             <colgroup>
                                 <col width="30%">
                                 <col width="20%">
                                 <col width="50%">
                             </colgroup>
                             <thead>
                                 <tr>
                                     <th>강의명</th><th>강사</th><th>진행률</th>
                                 </tr>
                             </thead>
                             <tbody>
                                 <%
                                 	MypageStudentDao stuDao = MypageStudentDao.getInstance();
                                 	List<Enrollment> enrollList= stuDao.getEnrollmentByStudentNo(student.getNo());
                                 	for(Enrollment forEnroll : enrollList) {
                                 %>
                                 <tr>
                                     <td><a href="course-info.jsp?no=<%=forEnroll.getCourse().getNo() %>"><%=forEnroll.getCourse().getName() %></a></td>
                                     <td><%=forEnroll.getCourse().getLecturer().getName() %></td>
                                     <td>
                                         <div class="progress">
                                         <%
                                         	int totalVideo = stuDao.getTotalCourseVideoByCourseNo(forEnroll.getCourse().getNo());
                                         	Map<String, Integer> intMap = new HashMap<>();
                                         	intMap.put("param1", student.getNo());
                                         	intMap.put("param2", forEnroll.getCourse().getNo());
                                         	int finishVideo = stuDao.getTotalFinishedCourseByMap(intMap);
                                         %>
                                             <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemin="100" style="width: <%=(finishVideo / totalVideo) * 100 %>%;">
                                                <span><%=(finishVideo / totalVideo) * 100 %>%</span>
                                            </div>
                                        </div>
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
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <label><a href="myqna.jsp" class="pull-right">내 QnA</a></label>
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
                                	<%
                                		List<Qna> qnaList = stuDao.getQnaByStudentNo(student.getNo());
                                		for(Qna forQna : qnaList) {
                                	%>
                                    <tr>
                                        <td><a href="#"><%=forQna.getTitle() %></a></td>
                                        <td><a href="course-info.jsp?no=<%=forQna.getCourse().getNo() %>"><%=forQna.getCourse().getName() %></a></td>
                                        <td><%=DateUtils.yyyymmddhhmmss(forQna.getQuesDate()) %></td>
                                    </tr>       	
                                	<%
                                		}
                                	%>
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