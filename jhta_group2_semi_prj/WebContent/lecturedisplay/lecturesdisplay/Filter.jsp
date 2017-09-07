<%@page import="pro.dept.dao.DeptDao"%>
<%@page import="pro.dept.vo.Dept"%>
<%@page import="pro.lecturer.vo.Lecturer"%>
<%@page import="pro.course.vo.Course"%>
<%@page import="java.util.List"%>
<%@page import="pro.introducecourse.dao.LectureCourseDao"%>
<%@page import="pro.lecturer.dao.LecturerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@include file="../../common/header.jsp" %>
<body>
<div class="container">
<%@include file="../../common/nav.jsp" %>
	<div class="col-sm-2">
		<h2><a href="index.jsp">강의 목록</a></h2>
		<hr>
	<%@include file="left-menu.jsp" %> 
	</div>
<div class="col-sm-10">
<%@include file="nav.jsp" %>
<%
	if(request.getParameter("tno")!=null){
		%>
		<%@include file="individuallecture1.jsp" %>
		<%
	}else if (request.getParameter("sno")!=null){
		%>
		<%@include file="individuallecture2.jsp" %>
		<%
	}else {
		%>
		<%@include file="individuallecture3.jsp" %>
		<%
	}
	;	
%>
</div>
<%@include file="pagination.jsp" %>
</div>
<%@include file="../../common/footer.jsp" %>
</body>
<script type="text/javascript">
    document.getElementById("myDropdown-1").addEventListener("click", function(event){
       var clicked =event.target;
        if(clicked.id === "teacher"){
            var htmlContent = "";
            <%	
            LecturerDao lecturerDao = LecturerDao.getInstance();
            List<Lecturer> lecturers = lecturerDao.getAllLecturers();
            for(Lecturer lecturer : lecturers){
            %>
            htmlContent += "<li id='<%=lecturer.getNo()%>' style='cursor:pointer'><%=lecturer.getName()%></li>";
            <%}%>
            document.getElementById("menu2").setAttribute("data-toggle", "dropdown");
            document.getElementById("menu2").innerHTML = "필터"+"<span class='caret'></span>"; 
            document.getElementById("myDropdown-2").innerHTML = htmlContent;
            document.getElementById("menu1").innerHTML = clicked.innerText+"<span class='caret'></span>";
        }else if(clicked.id === "subject"){
            var htmlContent = "";
        	<%	List<Dept> depts = DeptDao.getInstance().getAllDepts();
            for(Dept dept : depts){
            %>
            htmlContent +="<li id='<%= dept.getNo()%>' style='cursor:pointer'><%= dept.getName()%></li>";
            <%}%>
            document.getElementById("menu2").setAttribute("data-toggle", "dropdown");
            document.getElementById("menu2").innerHTML = "필터"+"<span class='caret'></span>"; 
            document.getElementById("myDropdown-2").innerHTML = htmlContent;
            document.getElementById("menu1").innerHTML = clicked.innerText+"<span class='caret'></span>";
        }else if(clicked.id === "popular"){
            document.getElementById("menu1").innerHTML = clicked.innerText+"<span class='caret'></span>";
            document.getElementById("menu2").innerHTML = ""
            document.getElementById("menu2").setAttribute("data-toggle", "");
        }
       
    });
    (function(){
   document.getElementById("myDropdown-2").addEventListener("click", function(event){
      var clicked = event.target;     
      document.getElementById("menu2").innerHTML = clicked.innerText+"<span class='caret'></span>";
    });
    }());
   (function(){
   document.getElementById("myDropdown-1").addEventListener("click", function(event){
	  var target = event.target;
	  if("인기" === target.innerText){
		  
	  }
   });
   }());
   (function(){
   document.getElementById("myDropdown-2").addEventListener("click", function(event){
	  var target = event.target;
	  var menu1 = document.getElementById("menu1").innerText;
	  var menu2 = target.id;
	   if("강사"=== menu1){
		   location.href="/jhta_group2_semi_prj/lecturedisplay/lecturesdisplay/Filter.jsp?tno="+target.id;
	   }else if("과목"=== menu1){
		   location.href="/jhta_group2_semi_prj/lecturedisplay/lecturesdisplay/Filter.jsp?sno="+target.id;
	   }
	   
   });
   }());
   
</script>
</html>