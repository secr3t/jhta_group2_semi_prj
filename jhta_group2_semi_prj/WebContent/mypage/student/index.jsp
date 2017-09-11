<%@page import="pro.tech.vo.Tech"%>
<%@page import="pro.criteria.vo.Criteria"%>
<%@page import="pro.mypage.dao.MypageCourseDao"%>
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
	<%@ include file="/mypage/student/logincheck.jsp" %>
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
                            	<label><%=student.getName() %>님 환영합니다.</label>
                            	<a href="myinfo/update-myinfo.jsp" class="pull-right">내 정보로 이동</a>
                        	</div>
                         	<table class="table table-condensed">
                             	<tr>
                                 	<th></th><td></td>
                                 	<th>잔여 포인트</th><td><%= student.getPoint() %> <span class="glyphicon glyphicon-copyright-mark text-warning"></span></td>
                                 	<th><a href="/jhta_group2_semi_prj/payment/payment.jsp" class="btn btn-primary btn-sm pull-right">포인트 충전</a></th><td></td>
                             	</tr>
                        	 </table>
                       </div>
                 </div>
             </div>
 
             <div class="row">
                 <div class="col-sm-12">
                     <div class="panel panel-info">
                         <div class="panel-heading">
                             <label><a href="mycourse/mycourse.jsp" class="pull-right">내 수강 목록</a></label>
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
                                     <td><a href="mycourse/course-info.jsp?cno=<%=forEnroll.getCourse().getNo() %>"><%=forEnroll.getCourse().getName() %></a></td>
                                     <td><%=forEnroll.getCourse().getLecturer().getName() %></td>
                                     <td>
                                         <div class="progress">
                                         <%
                                         	MypageCourseDao courDao = MypageCourseDao.getInstance();
                                         	int totalVideo = courDao.getTotalCourseVideoByCourseNo(forEnroll.getCourse().getNo());
                                         	Map<String, Integer> intMap = new HashMap<>();
                                         	intMap.put("param1", student.getNo());
                                         	intMap.put("param2", forEnroll.getCourse().getNo());
                                         	int finishVideo = courDao.getTotalFinishedCourseByMap(intMap);
                                         %>
                                             <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemin="100" style="width: <%=totalVideo == 0? "0" :(finishVideo / totalVideo) * 100 %>%;">
                                                <span><%=totalVideo == 0? "0" :(finishVideo / totalVideo) * 100 %>%</span>
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
                            <label><a href="myqna.jsp" class="pull-right">최근 QnA</a></label>
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
                                		Criteria qnaCriteria = new Criteria();
                                		qnaCriteria.setStudentNo(student.getNo());
                                		qnaCriteria.setBeginIndex(1);
                                		qnaCriteria.setEndIndex(5);
                                		List<Qna> qnaList = stuDao.getQnaByStudentNo(qnaCriteria);
                                		for(Qna forQna : qnaList) {
                                	%>
                                    <tr>
                                        <td>
                                        	<a href="/jhta_group2_semi_prj/board/qnaboard/qna_detail.jsp?p=<%=forQna.getNo() %>"><%=forQna.getTitle() %></a>
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
                <div class="col-sm-12">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <label><a href="mytech.jsp" class="pull-right">내 최근 1:1 질문</a></label>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-condensed table-hover">
                                <colgroup>
                                    <col width="60%">
                                    <col width="40%">
                                </colgroup>                                   
                                <thead>
                                    <tr>
                                        <th>제목</th><th>게시일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<%
                                		Criteria techCriteria = new Criteria();
                                		techCriteria.setStudentNo(student.getNo());
                                		techCriteria.setBeginIndex(1);
                                		techCriteria.setEndIndex(5);
                                		List<Tech> techList = stuDao.getTechInfo(techCriteria);
                                		for(Tech forTech : techList) {
                                	%>
                                    <tr>
                                        <td>
                                        	<a href="/jhta_group2_semi_prj/board/personalqna/personalqna_detail.jsp?no=<%=forTech.getNo() %>"><%=forTech.getTitle() %></a>
                                        	<%
				                          		if(forTech.getAnsContent() != null) {
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
		                                <td><%=DateUtils.yyyymmddhhmmss(forTech.getQuesRegdate()) %></td>
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
   	<%@ include file="/common/footer.jsp" %>
</body>
</html>