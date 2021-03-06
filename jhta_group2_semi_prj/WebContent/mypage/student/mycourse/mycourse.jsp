<%@page import="pro.video.vo.Video"%>
<%@page import="pro.utils.StringUtils"%>
<%@page import="pro.mypage.dao.MypageCourseDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="pro.enrollment.vo.Enrollment"%>
<%@page import="java.util.List"%>
<%@page import="pro.mypage.dao.MypageStudentDao"%>
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
  <title>My Course</title>
</head>
<body>
	<%@ include file="/mypage/student/logincheck.jsp" %>
	<%@ include file="/common/nav.jsp" %>
    <div class="container">
		<div class="col-sm-offset-2 page-header">
			<h1>내 강의</h1>
		</div>    

    	<div class="col-sm-2">
			<%@ include file="/mypage/student/left-menu.jsp" %>
		</div>

         <div class="col-sm-9">
             <div class="row">
                 <div class="col-sm-offset-1 col-sm-10">
                     <div class="panel panel-warning">
                         <div class="panel-heading">
                             <label>지난 강의 이어 듣기</label>
                         </div>
                         <div class="panel-body">
                         <%
                         Cookie[] cookies = request.getCookies();
                         
                         int videoNo = 0;
                         for(Cookie forCookie : cookies) {
                        	 String name = forCookie.getName();
                        	 if("videoNo".equals(name)) {
                        		 videoNo = StringUtils.changeIntToString(forCookie.getValue());
                        	 }
                         }
                         
                      	 MypageCourseDao courDao = MypageCourseDao.getInstance();
                      	 Video recentVideo = null;
                         if(videoNo != 0) {
                        	 recentVideo = courDao.getVideoByVideoNo(videoNo);
                         }
						 %>
                             <div class="col-sm-7">
	                            <h5><%= videoNo != 0 ? recentVideo.getTitle() : "" %></h5>
                                <p>
                                   	<%= videoNo != 0 ? recentVideo.getDescription() : "최근 7일 동안, 본 강의가 없습니다." %> 
                                </p>
                             </div>
                             <div class="col-sm-5">
                             	<h6><%= videoNo != 0 ? "강의명 :" + recentVideo.getCourse() : "" %></h6>
                             </div>
                        </div>
                    </div>
                </div>
             </div>
             <div class="row">
                <div class="col-sm-offset-1 col-sm-10">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <label>내 수강 목록</label>
                            <a href="/jhta_group2_semi_prj/lecturedisplay/lecturesdisplay/index.jsp" class="btn btn-info btn-xs pull-right">강의 찾기</a>
                        </div>
                        <table class="table table-hover">
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
                                 	if(enrollList.size() == 0) {
                                 %>
                                 <tr>
                                 	<td colspan="12" class="text-center">신청한 강의가 존재하지 않습니다.</td>
                                 </tr>                                 
                                 <%
                                 	}
                                 	for(Enrollment forEnroll : enrollList) {
                                 %>
                                 <tr>
                                     <td><a href="course-info.jsp?cno=<%=forEnroll.getCourse().getNo() %>"><%=forEnroll.getCourse().getName() %></a></td>
                                     <td><%=forEnroll.getCourse().getLecturer().getName() %></td>
                                     <td>
                                         <div class="progress">
                                         <%
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
                        <div class="panel-footer">
                            <p class="text-danger">수강은 최대 10개까지만 가능합니다.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/common/footer.jsp" %>
</body>
</html>