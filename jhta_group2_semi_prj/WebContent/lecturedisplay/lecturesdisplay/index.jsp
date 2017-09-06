<%@page import="pro.dept.dao.DeptDao"%>
<%@page import="pro.dept.vo.Dept"%>
<%@page import="pro.lecturer.vo.Lecturer"%>
<%@page import="pro.course.vo.Course"%>
<%@page import="java.util.List"%>
<%@page import="pro.introducecourse.dao.LectureCourseDao"%>
<%@page import="pro.introducecourse.dao.LecturerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@include file="../../common/header.jsp" %>
<body>
<div class="container">
<%@include file="../../common/nav.jsp" %>
	<div class="col-sm-2">
		<h2><a href="">강의 목록</a></h2>
		<hr>
	<%@include file="left-menu.jsp" %> 
	</div>
<div class="col-sm-10">
<%@include file="nav.jsp" %>
<%
	LecturerDao lecturerDao = LecturerDao.getInstance();
	LectureCourseDao courseDao = LectureCourseDao.getInstance();
	List<Course> courses =  courseDao.getAllCourses();

%>

	<%for(Course course : courses){
		//강사 객체
		Lecturer lecturer = lecturerDao.getlecturerByNo(course.getLecturer().getNo());
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
                 <p>포인트 <strong><%=course.getPoint()%>p</strong></p>
             </div>
            		
            <div class="btn-group btn-group-justified" role="group" style="padding-top: 30px;">
                    <a href="/jhta_group2_semi_prj/lecturedisplay/lecturedetail/introducePage.jsp?courseNo=<%=course.getNo()%>" class="btn btn-primary">소개</a>
                    <a href="" class="btn btn-success">수강신청</a>
            </div>
        </div>
        <%} %>
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
            <%	List<Lecturer> lecturers = lecturerDao.getAlllecturers();
            for(Lecturer lecturer : lecturers){
            %>
            htmlContent += "<li id='uisil' style='cursor:pointer'><%=lecturer.getName()%></li>";
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
            htmlContent +="<li id='korean'><%= dept.getName()%></li>";
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
    
   document.getElementById("myDropdown-2").addEventListener("click", function(event){
        var clicked = event.target;     
        document.getElementById("menu2").innerHTML = clicked.innerText+"<span class='caret'></span>";
       
    });
</script>
</html>