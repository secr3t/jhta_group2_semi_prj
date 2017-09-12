<%@page import="pro.lecturer.vo.IntroLecturer"%>
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

<%
	LecturerDao lecturerDao = LecturerDao.getInstance();
	int categoryNo;
	List<IntroLecturer> lecturers = null;
	if(request.getParameter("category1") != null && request.getParameter("category2") != null){
		String category1 = request.getParameter("category1");
		categoryNo = Integer.parseInt(request.getParameter("category2"));
		System.out.println(category1);
		System.out.println(categoryNo);
		if("sub".equals(category1)){
			lecturers = lecturerDao.getAllIntroLecturerByDeptNo(categoryNo);
		}else if("lct".equals(category1)){
			lecturers = lecturerDao.getAllIntroLecturerByLecturerNo(categoryNo);
		}
	}else{
		lecturers = lecturerDao.getAllIntroLecturer();
	}
%>
<div class="container">
	<div class="col-sm-2">
		<h2><a href="/jhta_group2_semi_prj/lecturer/lecturerIndex.jsp">강사소개</a></h2>
		<hr>
	<%@include file="/lecturedisplay/lecturesdisplay/left-menu.jsp" %> 
	</div>
<div class="col-sm-10">
<div class="row">
<form action="/jhta_group2_semi_prj/lecturer/lecturerIndex.jsp" method="get">
	<div class="col-sm-offset-1 col-sm-2  form-group">
		<select id="first-category" class="form-control" name="category1">
			<option value=""> 선택하세요</option>
			<option value="sub"> 과목</option>
			<option value="lct"> 강사</option>
		</select>
	</div>
	<div class="col-sm-2 form-group">
		<select id="second-category" class="form-control" name="category2">
			<option> 선택하세요.</option>
		</select>
	</div>
		<button type="submit" class="btn btn-primary">검색</button>
</form>
</div>

<div class="row">	
	<%
	for(IntroLecturer lecturer : lecturers){
	%>
	<!--과정 소개  -->
       <div class="col-sm-offset-1 col-sm-3 well" style="height: 240px;" >
             <div>
                 <img src="" alt="" style="width: 100px;height:100px;float:left;
                 background-size:contain;background-position:50% 50%; background-image:url(<%=lecturer.getLecturerPictureUrl() %>);
                 background-repeat:no-repeat">
             </div>
             <div class="text-center">
                 <h4><strong><%=lecturer.getLecturerName()%></strong></h4>
                 <h4><%=lecturer.getDeptName()%></h4>
             </div>
             <div class="text-center" style="padding-top:50px;">
                  <p><small><%=lecturer.getLecturerCareer()%></small></p>
                  <p><strong><%=lecturer.getLecturerEmail()%></strong></p>
             </div>
            		
            <div class="btn-group btn-group-justified" role="group" style="padding-bottom: 10px;">
                    <a href="/jhta_group2_semi_prj/lecturedisplay/lecturesdisplay/Filter.jsp?tno=<%=lecturer.getLecturerNo() %>" class="btn btn-success">관련강의</a>
            </div>
        </div>
       <%} %>
	</div>
</div>
</div>
<%@include file="../../common/footer.jsp" %>
</body>
<script type="text/javascript">

	document.getElementById("first-category").addEventListener('change', function(event) {
		var type = event.target.value;
		if (type == "") {
			document.getElementById("second-category").innerHTML = "<option> 선택하세요.</option>";
			return;
		}
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var jsonText = xhr.responseText;
				var arr = JSON.parse(jsonText);
				
				var html = "";
				arr.forEach(function(item, index) {
					html += "<option value='"+item.no+"'> "+item.name+"</option>";
				});
				
				document.getElementById("second-category").innerHTML = html;
			}
		}
		xhr.open("get", "lectureAjax.jsp?type=" + type);
		xhr.send(null);
		
	});
/* 
document.getElementById("subject1").addEventListener("click", function(event){
	event.preventDefault();
	var subject = document.getElementById("subject1");
    var lecturer = document.getElementById("lecturer1");
    var htmlContent;
    if(subject != null && lecturer == null){
    	htmlContent  =  "<option value='kor'>국어</option>";
    	htmlContent += 	"<option value='math'>수학</option>";
    	htmlContent += 	"<option value='eng'>영어</option>";
    	htmlContent += 	"<option value='sci'>과학</option>";
		document.getElementById("category2").innerHTML = htmlContent;
		document.getElementById("category2").setAttribute("name","sub");
    }
});

 document.getElementById("lecturer1").addEventListener("click", function(event){
	event.preventDefault();
	var subject = document.getElementById("subject1");
    var lecturer = document.getElementById("lecturer1");
    var htmlContent; 
	if(subject == null && lecturer != null){
	    	htmlContent  =  "<option value='1'>강감찬</option>"
	    	htmlContent +=	"<option value='2'>나길동</option>"
	    	htmlContent +=	"<option value='3'>어셔</option>"
	    	htmlContent +=	"<option value='4'>나야나</option>";	
			document.getElementById("category2").innerHTML = htmlContent;
			document.getElementById("category2").setAttribute("name","lct");
	    }
});  */

</script>
</html>