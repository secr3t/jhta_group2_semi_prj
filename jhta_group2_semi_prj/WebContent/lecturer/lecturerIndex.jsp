<%@page import="java.util.Iterator"%>
<%@page import="pro.dept.dao.DeptDao"%>
<%@page import="pro.dept.vo.Dept"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="pro.introducecourse.dao.LectureCourseDao"%>
<%@page import="pro.course.vo.Course"%>
<%@page import="pro.lecturer.vo.Lecturer"%>
<%@page import="java.util.List"%>
<%@page import="pro.lecturer.dao.LecturerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@include file="../../common/header.jsp" %>
<body>
<%@include file="../../common/nav.jsp" %>
<div class="container">
	<div class="col-sm-2">
		<h2><a href="/jhta_group2_semi_prj/lecturer/lecturerIndex.jsp">강사소개</a></h2>
		<hr>
	<%@include file="/lecturedisplay/lecturesdisplay/left-menu.jsp" %> 
	</div>
<div class="col-sm-10">
<%@include file="nav.jsp" %>
<%
	LecturerDao lecturerDao = LecturerDao.getInstance();
	List<Lecturer> lecturers = lecturerDao.getAllLecturers();
	LectureCourseDao courseDao = LectureCourseDao.getInstance();
	DeptDao deptDao = DeptDao.getInstance();
	for(Lecturer lecturer : lecturers){
		List<Course> courses = courseDao.getCourseByLecturerNo(lecturer.getNo());
		
%>
	<!--과정 소개  -->
       <div class="col-sm-offset-1 col-sm-3 well" style="height: 250px;" >
             <div>
                 <img src="<%=lecturer.getPicture()%>" alt="강사사진" style="width: 60%;float:left">
             </div>
             <div class="text-center">
                
                 <%
                 HashSet<String> depts = new HashSet<>();
                 for(Course course : courses){
         			String value = deptDao.getDeptByNo(course.getDept().getNo()).getName();
                 	depts.add(value);
                 	depts.iterator();
         		 }
                 Iterator<String> it = depts.iterator();
                 while(it.hasNext()){
                 %>
                 <h4><%=it.next()%></h4>
                 <%} %>
                 <h4><strong><%=lecturer.getName()%></strong></h4>
             </div>
             <div class="text-left" style="padding-top:50px;">
                  <p><small><%=lecturer.getCareer()%></small></p>
                  <p><strong><%=lecturer.getEmail()%></strong></p>
             </div>
            		
            <div class="btn-group btn-group-justified" role="group" style="padding-bottom: 10px;">
                    <a href="/jhta_group2_semi_prj/lecturedisplay/lecturesdisplay/Filter.jsp?tno=<%=lecturer.getNo() %>" class="btn btn-primary">관련강의</a>
            </div>
        </div>
        
       <%} %>
</div>
<%@include file="/lecturedisplay/lecturesdisplay/pagination.jsp" %>
</div>
<%@include file="../../common/footer.jsp" %>
</body>
</html>