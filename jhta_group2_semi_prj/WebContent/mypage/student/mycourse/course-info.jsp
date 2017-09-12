<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="pro.utils.StringUtils"%>
<%@page import="pro.course.vo.Course"%>
<%@page import="pro.mypage.dao.MypageCourseDao"%>
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
	<%@ include file="/mypage/student/logincheck.jsp" %>
	<%@ include file="/common/nav.jsp" %>
	<%
		int courseNo = StringUtils.changeIntToString(request.getParameter("cno"));
		MypageCourseDao courDao = MypageCourseDao.getInstance();
		Course course = courDao.getCourseByCourseNo(courseNo);
	%>
    <div class="container">
		
		<div class="col-sm-offset-2 page-header">
			<h1>My Page<small> - <%=course.getName() %></small></h1>
			<div class="row text-right">
		    	<a href="/jhta_group2_semi_prj/lecturedisplay/lecturedetail/introducePage.jsp?courseNo=<%=course.getNo() %>" class="btn btn-md btn-primary">강의 페이지로 이동</a>
		    </div>
		</div>
		
        <div class="col-sm-2">
			<%@ include file="/mypage/student/left-menu.jsp" %>
        </div>
        
        <div class="col-sm-9">
            
            <div class="row">
                <div class="panel panel-warning">
                    <div class="panel-heading">
                        <label>진행률</label>
                    </div>
                    <div class="panel-body">
						<div class="progress">
						<%
							int totalVideo = courDao.getTotalCourseVideoByCourseNo(courseNo);

							Map<String, Integer> intMap = new HashMap<>();
							intMap.put("param1", student.getNo());
							intMap.put("param2", courseNo);
							int finishVideo = courDao.getTotalFinishedCourseByMap(intMap);
						%>
			    			<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemin="100" style="width: <%=totalVideo == 0? "0" :(finishVideo / totalVideo) * 100 %>%;">
			    				<span><%=totalVideo == 0? "0" :(finishVideo / totalVideo) * 100 %>%</span>
			    			</div>
						</div>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <label>강의정보</label>
                    </div>
                    <table class="table table-bordered">
                    	<colgroup>
                    		<col width="20%">
                    		<col width="30%">
                    		<col width="20%">
                    		<col width="30%">
                    	</colgroup>                        
                        <tr>
							<th>강의 분류</th><td><%=course.getDept().getName() %></td>
                            <th>강사명</th><td><%=course.getLecturer().getName() %></td>
                        </tr>                        
                        <tr>
							<th>강의 평점</th>
							<td>
								<%
									double avgGrade = courDao.getGradeAvgByCourseNo(courseNo);
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
                            <th>등록된 강의 수</th><td><%=totalVideo %>개</td>
                        </tr>
                        <tr>
                            <th colspan="12">강의 소개</th>
                        </tr>
                        <tr>
                            <td colspan="12"><%= course.getSummary() %></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/common/footer.jsp" %> 
</body>
</html>