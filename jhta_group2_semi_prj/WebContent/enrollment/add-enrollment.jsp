<%@page import="pro.enrollment.vo.Enrollment"%>
<%@page import="pro.enrollment.dao.EnrollmentDao"%>
<%@page import="java.util.List"%>
<%@page import="pro.course.vo.Course"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html lang="ko">
<head>
	<title>Insert title here</title>	
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
<%@include file="../common/nav.jsp"%>
<% 
	String courseNoString = request.getParameter("courseNo");
	String comma = ",";
	
	String[] splitNo = courseNoString.split(comma);
	for(int i=0; i<splitNo.length; i++){
		EnrollmentDao enrollmentDao = EnrollmentDao.getInstance();
		Enrollment enrollment = new Enrollment();	 
		
		int courseNo = Integer.parseInt(splitNo[i]); 
		Course course = new Course();
		course.setNo(courseNo);
		enrollment.setCourse(course);
		
		//if("S".equals(loginUser.getType())){
		 //}
		//int studentNo = student.getNo();
		
		Student student = (Student)loginUser;
		enrollment.setStudent(student);
		
		 
		enrollmentDao.addEnrollment(enrollment);
	}
	
%>
</body>
<script type="text/javascript">

</script>
</html>
