<%@page import="pro.video.dao.VideoDao"%>
<%@page import="pro.lecturer.vo.Lecturer"%>
<%@page import="pro.course.vo.Course"%>
<%@page import="java.util.List"%>
<%@page import="pro.introducecourse.dao.LectureCourseDao"%>
<%@page import="pro.lecturer.dao.LecturerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int pno = Integer.parseInt(request.getParameter("pno"));
	LecturerDao lecturerDao = LecturerDao.getInstance();
	LectureCourseDao courseDao = LectureCourseDao.getInstance();
	List<Course> courses = courseDao.getCourseByLecturerNo(pno);
	VideoDao videoDao = VideoDao.getInstance();
%>

	<%for(Course course : courses){
		//강사 객체
		Lecturer lecturer = lecturerDao.getLecturerByNo(course.getLecturer().getNo());
	%>
	<!--과정 소개  -->
       <div class="col-sm-offset-1 col-sm-3 well" style="height: 250px;" >
             <div>
                 <img src="<%=lecturer.getPicture()%>" alt="강사사진" style="width: 40%;float:left">
             </div>
             <div class="text-center">
                 <h4><strong><%=course.getName()%></strong></h4>
             </div>
             <div class="text-center">
                  <p><small><%=course.getSummary()%></small></p>
             </div>
             <div class="text-right">
                  <p>강사 <strong><%=lecturer.getName()%></strong></p>
                  <p>강의수 <strong><%=videoDao.getVideoQtrByCourseNo(course.getNo()) %>강</strong></p>
                 <p>포인트 <strong><%=course.getPoint()%>p</strong></p>
             </div>
            		
            <div class="btn-group btn-group-justified" role="group" style="padding-bottom: 10px;">
                    <a href="/jhta_group2_semi_prj/lecturedisplay/lecturedetail/introducePage.jsp?courseNo=<%=course.getNo()%>" class="btn btn-primary">소개</a>
                    <a href="" class="btn btn-success">수강신청</a>
            </div>
        </div>
        <%} %>