<%@page import="pro.video.vo.Video"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="pro.enrollment.vo.Enrollment"%>
<%@page import="pro.criteria.vo.Criteria"%>
<%@page import="java.util.List"%>
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
</head>
<body>
	<%@ include file="/mypage/admin/logincheck.jsp" %>
	<%@ include file="/common/nav.jsp" %>
    <div class="container">
 
 		<div class="col-sm-offset-2 page-header">
 		<%
 		int courseNo = StringUtils.changeIntToString(request.getParameter("cno"), 1);
 		MypageCourseDao courDao = MypageCourseDao.getInstance();
 		Course course = courDao.getCourseByCourseNo(courseNo);
 		%>
			<h1>강의 상세 정보 <small>- <%=course.getName() %></small></h1>
			<%
			String courPermit = course.getPermit();
			%>
			<div class="row text-right">
	     		<a href="course-update.jsp?cno=<%=course.getNo() %>&change=<%="Y".equals(course.getPermit()) ? "2" : "1" %>" class="btn btn-md btn-info <%="Y".equals(courPermit) ? "active" : "" %>">공개</a>
	     		<a href="course-update.jsp?cno=<%=course.getNo() %>&change=<%="Y".equals(course.getPermit()) ? "2" : "1" %>" class="btn btn-md btn-danger <%="N".equals(courPermit) ? "active" : "" %>">비공개</a>
	      	</div>
		</div>
		
        <div class="col-sm-2">
			<%@ include file="../left-menu.jsp" %>
        </div>
        <div class="col-sm-9">

          <div class="row">
              <div class="panel panel-warning">
              <%
              Criteria stuCriteria = new Criteria();
              stuCriteria.setCourseNo(courseNo);
              stuCriteria.setBeginIndex(1);
              stuCriteria.setEndIndex(1000);
              List<Enrollment> enrollList = courDao.getStudentsByCourseNo(stuCriteria);
              %>
                  <div class="panel-heading">
                      <label>수강 중인 학생 <span class="badge"><%=enrollList.size() %></span></label>
                  </div>
                  <table class="table table-condensed">
                  		<colgroup>
                        	<col width="60%">
                          	<col width="40%">
                      	</colgroup>
                      	<thead>
                       		<tr>
                       			<th>학생명</th><th>진행률</th>
                       		</tr>
                   		</thead>
                   		<tbody>
                   		<%
                   		for(Enrollment forEnroll : enrollList) {
                   		%>
                       		<tr>
                       			<td><a href="../student/student-detail.jsp?sno=<%=forEnroll.getStudent().getNo() %>"><%=forEnroll.getStudent().getName() %></a></td>
                       			<td>
                           			<div class="progress">
                                     <%
                                     	int totalVideo = courDao.getTotalCourseVideoByCourseNo(forEnroll.getCourse().getNo());
                                     	Map<String, Integer> intMap = new HashMap<>();
                                     	intMap.put("param1", forEnroll.getStudent().getNo());
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
              <div class="panel panel-info">
                  <div class="panel-heading">
                      <label>전체 수업 목록 <span class="badge">10</span></label>
                  </div>
                  <table class="table table-condensed">
                  		<colgroup>
                        	<col width="30%">
                        	<col width="40%">
                          	<col width="30%">
                      	</colgroup>
                      	<thead>
                       		<tr>
                       			<th>NO</th><th>수업명</th><th>수업공개여부</th>
                       		</tr>
                   		</thead>
                   		<tbody>
                   		<%
                   		Criteria videoCriteria = new Criteria();
                   		videoCriteria.setCourseNo(courseNo);
                   		videoCriteria.setBeginIndex(1);
                   		videoCriteria.setEndIndex(1000);
                   		List<Video> videoList = courDao.getVideoInfo(videoCriteria);
                   		for(Video forVideo : videoList) {
                   		%>
                       		<tr>
                       			<td><%=forVideo.getOrder() %></td>
                       			<td><a href="video-detail.jsp?vno=<%=forVideo.getNo() %>"><%=forVideo.getTitle() %></a></td>
                       			<td>
                        			<%=forVideo.getPermit() %>
                        			<div class="pull-right">
                        				<a href="video-update.jsp?vno=<%=forVideo.getNo() %>&change=<%="Y".equals(forVideo.getPermit()) ? "2" : "1" %>">
                        					<span class="text-<%="Y".equals(forVideo.getPermit()) ? "danger" : "primary" %> glyphicon glyphicon-<%="Y".equals(forVideo.getPermit()) ? "remove" : "ok" %>-sign pull-right"></span>
                        				</a>
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
								double avgGrade = courDao.getGradeAvgByCourseNo(course.getNo());
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
                            <th>강의 포인트</th>
                            <td>
                            	<%=course.getPoint() %>
                            	<span class="glyphicon glyphicon-copyright-mark text-warning"></span>
                            </td>
                        </tr>
                        <tr>
                            <th colspan="12">강의 요약</th>
                        </tr>
                        <tr>
                            <td colspan="12"><%=course.getSummary() %></td>
                        </tr>
                        <tr>
                            <th colspan="12">강의 세부 설명</th>
                        </tr>
                        <tr>
                            <td colspan="12">
                            <%
                            if (course.getDetail() != null) {
                            %>
                           		<%=course.getDetail() %>
                           	<%
                            }
                           	%>
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