<%@page import="pro.course.vo.Course"%>
<%@page import="pro.video.vo.Video"%>
<%@page import="pro.mypage.dao.MypageCourseDao"%>
<%@page import="pro.criteria.vo.Criteria"%>
<%@page import="java.util.List"%>
<%@page import="pro.mypage.dao.MypageLecturerDao"%>
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
	<%@ include file="/mypage/admin/logincheck.jsp" %>
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
                    <div class="col-sm-12">
                        <div class="panel panel-warning">
                            <div class="panel-heading">
                            <%
                            MypageLecturerDao lecDao = MypageLecturerDao.getInstance();
                    	
                    		Criteria lecCriteria = new Criteria();
                    		lecCriteria.setBeginIndex(1);
                    		lecCriteria.setEndIndex(10);
                    		lecCriteria.setNoAnswer("Y");
                    		List<Lecturer> lecList = lecDao.getLecturerInfo(lecCriteria);
                    		%>
                                <label><a href="manager-lecturer.jsp">새 강사 신청</a><span class="badge"><%=lecList.size() %></span></label>
                            </div>
                            <table class="table table-condensed table-hover">
                                <colgroup>
                                    <col width="30%">
                                    <col width="20%">
                                    <col width="50%">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>이메일</th><th>강사명</th><th>경력</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<%
                                		for(Lecturer forLecturer : lecList) {
                                	%>
                                    <tr>
                                        <td><%=forLecturer.getName() %></td>
                                        <td><%=forLecturer.getCareer() %></td>
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
                            <%
                            MypageCourseDao courDao = MypageCourseDao.getInstance();
                            
                            Criteria courCriteria = new Criteria();
                            courCriteria.setBeginIndex(1);
                            courCriteria.setEndIndex(10);
                            courCriteria.setNoAnswer("Y");
                            List<Course> courList = courDao.getCourseInfo(courCriteria);
                            %>
                                <label>새 강의 신청<span class="badge"><%=courList.size() %></span></label>
                                <a href="manager-course.jsp" class="pull-right">전체 강의 목록</a>
                                
                            </div>
                            <div class="table-responsive">
                                <table class="table table-condensed table-hover">
                                    <colgroup>
                                        <col width="30%">
                                        <col width="30%">
                                        <col width="40%">
                                    </colgroup>                                   
                                    <thead>
                                        <tr>
                                            <th>강의명</th><th>과목분류</th><th>강사명</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                       				<%
                       				for(Course forCour : courList) {
                       				%>
                       					<tr>
                       						<td><%=forCour.getName() %></td>
                       						<td><%=forCour.getDept().getName() %></td>
                       						<td><%=forCour.getLecturer().getName() %></td>
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
                            <%                            
                            Criteria videoCriteria = new Criteria();
                            videoCriteria.setBeginIndex(1);
                            videoCriteria.setEndIndex(10);
                            videoCriteria.setNoAnswer("Y");
                            List<Video> videoList = courDao.getVideoInfo(videoCriteria);
                            %>
                                <label>새 영상 신청<span class="badge"><%=videoList.size() %></span></label>                                
                            </div>
                            <div class="table-responsive">
                                <table class="table table-condensed table-hover">
                                    <colgroup>
                                        <col width="30%">
                                        <col width="20%">
                                        <col width="50%">
                                    </colgroup>                                   
                                    <thead>
                                        <tr>
                                            <th>영상제목</th><th>강의명</th><th>영상설명</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                    for(Video forVideo : videoList) {
                                    %>
                                        <tr>
                                            <td><a href="video-detail.jsp?vno=<%=forVideo.getNo() %>"><%=forVideo.getTitle() %></a></td>
                                            <td><%=forVideo.getCourse().getName() %></td>
                                            <td><%=forVideo.getDescription() %></td>
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