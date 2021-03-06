<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	if(session.getAttribute("loginUser")!=null)
    		response.sendRedirect("/jhta_group2_semi_prj/");
    %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Bootstrap Example</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 버튼 스타일  -->
	<style>
        .registdiv:link, .registdiv:visited {
            font-size: 30px;
            width: 240px;
            transition-duration: 0.4s;
            background-color: #5bc0de;
            color: white;
            border: 2px solid #5bc0de;
            padding: 70px 50px;
            border-radius: 8px;
            text-align: center;
            display: inline-block;
            text-decoration: none;
        }
        .registdiv:hover, .registdiv:active {
            background-color: white;
            color: #5bc0de;
            border: 2px solid #5bc0de;          
        }
    </style>
</head>

<body>
<%@include file="../common/nav.jsp"%>

<!-- 학생/강사 회원가입 구분 -->
	<div class="container">
		<div class="col-xs-3"></div>      
        <div class="col-xs-3">
           <a class="registdiv" href="registstudentform.jsp">학생<br />회원가입</a>
        </div>

        <div class="col-xs-3">
            <a class="registdiv" href="registlecturerform.jsp">강사<br />회원가입</a>
        </div>
        <div class="col-xs-3"></div>
    </div>
	
<%@include file="../common/footer.jsp"%>

</body>
</html>