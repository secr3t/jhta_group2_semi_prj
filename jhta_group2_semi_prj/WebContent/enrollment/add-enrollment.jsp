<%@page import="java.util.List"%>
<%@page import="pro.course.vo.Course"%>
<%@page import="com.google.gson.Gson"%>
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
<% 
	String courseNo = request.getParameter("courseNo");
	String comma = ",";
	System.out.println(courseNo);
	
	String[] splitNo = courseNo.split(comma);
	for(int i=0; i<splitNo.length; i++){
		 int upReadyState = Integer.parseInt(splitNo[i]); 
		 
	}
	
%>
</body>
<script type="text/javascript">

</script>
</html>