<%@page import="java.util.ArrayList"%>
<%@page import="pro.introducecourse.dao.LectureCourseDao"%>
<%@page import="pro.enrollment.vo.Enrollment"%>
<%@page import="java.util.List"%>
<%@page import="pro.enrollment.dao.EnrollmentDao"%>
<%@page import="pro.student.vo.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="btn-group-vertical btn-group-lg">
<%
Student student = (Student)session.getAttribute("loginUser");
int studentNo = student.getNo();
List<Enrollment>lists = EnrollmentDao.getInstance().getEnrolledListsByStudentNo(studentNo);
ArrayList<Integer> courseLists = new ArrayList<Integer>();
LectureCourseDao courseDao = LectureCourseDao.getInstance();
for(Enrollment enrollment : lists){
	courseLists.add(enrollment.getCourse().getNo());
}
	for(Integer i : courseLists) {
%>
 <a class="btn btn-primary" href="/jhta_group2_semi_prj/lectureList/index.jsp?courseNo=<%=i%>">
 <%=courseDao.getCourseByNo(i).getName() %></a>
<%
	}
%>
 
</div>