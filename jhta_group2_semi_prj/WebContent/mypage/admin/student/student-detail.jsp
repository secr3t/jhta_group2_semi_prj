<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="pro.mypage.dao.MypageCourseDao"%>
<%@page import="pro.enrollment.vo.Enrollment"%>
<%@page import="java.util.List"%>
<%@page import="pro.mypage.dao.MypageStudentDao"%>
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
</head>
<body>
	<%@ include file="/mypage/admin/logincheck.jsp" %>
	<%@ include file="/common/nav.jsp" %>
    <div class="container">
 		<div class="col-sm-offset-2 page-header">
 		<%
 		int studentNo = StringUtils.changeIntToString(request.getParameter("sno"));
 		MypageStudentDao stuDao = MypageStudentDao.getInstance();
 		Student student = stuDao.getStudentByNo(studentNo);
 		%>
			<h1>학생 상세 정보<small> - <%=student.getName() %></small></h1>
		</div>
		    
        <div class="col-sm-2">
			<%@ include file="../left-menu.jsp" %>
        </div>
        <div class="col-sm-9">
            
            <div class="row">
                <div class="panel panel-warning">
                    <div class="panel-heading">
                        <label>수강 중인 강의</label>
                    </div>
                    <table class="table table-condensed">
                        <colgroup>
                            <col width="60%">
                            <col width="40%">
                        </colgroup>
                        <thead>
	                         <tr>
	                         	<th>강의명</th><th>진행률</th>
	                         </tr>
                     	</thead>
                     	<tbody>
                     	<%
                     	List<Enrollment> enrollList = stuDao.getEnrollmentByStudentNo(studentNo);
                     	for(Enrollment forEnroll : enrollList) {
                     	%>
	                         <tr>
		                         <td><a href="../course/course-detail.jsp?cno=<%=forEnroll.getCourse().getNo() %>"><%=forEnroll.getCourse().getName() %></a></td>
		                         <td>
		                             <div class="progress">
                                     <%
                                     	MypageCourseDao courDao = MypageCourseDao.getInstance();
                                     	int totalVideo = courDao.getTotalCourseVideoByCourseNo(forEnroll.getCourse().getNo());
                                     	Map<String, Integer> intMap = new HashMap<>();
                                     	intMap.put("param1", studentNo);
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
            
            <div class="row">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <label>학생정보</label>
                    </div>
                    <table class="table table-bordered">
                        <tr>
                            <th colspan="4">Email</th><td colspan="8"><%=student.getEmail() %></td>
                        </tr>                      
                        <tr>
                            <th colspan="4">전화번호</th><td colspan="4"><%=student.getPhone() %></td>
                            <th colspan="4">보유포인트</th>
                            <td colspan="4">
                            	<%=student.getPoint() %>
                            	<span class="glyphicon glyphicon-copyright-mark text-warning"></span>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/common/footer.jsp" %> 
</body>
</html>