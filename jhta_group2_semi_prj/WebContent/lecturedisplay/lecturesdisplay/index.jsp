<%@page import="pro.lectureinfo.dao.LectureInfoDao"%>
<%@page import="pro.lectureinfo.vo.LectureInfo"%>
<%@page import="pro.criteria.vo.Criteria"%>
<%@page import="pro.utils.StringUtils"%>
<%@page import="pro.video.dao.VideoDao"%>
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
<%@include file="../../common/nav.jsp" %>
<div class="container">
	<div class="col-sm-2">
		<h2><a href="index.jsp">강의목록</a></h2>
		<hr>
	<%@include file="left-menu.jsp" %> 
	</div>
<div class="col-sm-10">
<%@include file="nav.jsp" %>
<%
	LecturerDao lecturerDao = LecturerDao.getInstance();
	LectureCourseDao courseDao = LectureCourseDao.getInstance();
	LectureInfoDao infoDao = LectureInfoDao.getInstance();
%>
<% 

    	final int rowsPerPage = 6;
    	final int naviPerPage = 5;
    	
    	int p = StringUtils.changeIntToString(request.getParameter("p"), 1);
    	
    	int totalRows = courseDao.getCourseQty();
    	int totalPages = (int) Math.ceil(totalRows/(double)rowsPerPage);
    	int totalNaviBlocks = (int) Math.ceil(totalPages/(double)naviPerPage);
    	int currentNaviBlock = (int) Math.ceil(p/(double)naviPerPage);
    	int beginPage = (currentNaviBlock - 1)*naviPerPage +1;
    	int endPage = currentNaviBlock*naviPerPage;
    	
    	if(currentNaviBlock == totalNaviBlocks) {
    		endPage = totalPages;
    	}
    	
    	int beginIndex = (p-1)*rowsPerPage + 1;
    	int endIndex = p*rowsPerPage;
    	
    	Criteria criteria = new Criteria();
    	criteria.setBeginIndex(beginIndex);
    	criteria.setEndIndex(endIndex);
    	
    %>
		
	<%
	
	    List<LectureInfo> lectureInfos = infoDao.getLecturesInfo(criteria);
		for(LectureInfo course : lectureInfos){
		//강사 객체
		//Lecturer lecturer = lecturerDao.getLecturerByNo(course.getLecturer().getNo());
	%>
	<!--과정 소개  -->
       <div class="col-sm-offset-1 col-sm-3 well" style="height: 250px;" >
             <div>
                 <img src="<%=course.getPicture()%>" alt="강사사진" style="width: 40%;float:left">
             </div>
             <div class="text-center">
                 <h4><strong><%=course.getBoardName() %></strong></h4>
             </div>
             <div class="text-center">
                  <p><small><%=course.getSummary() %></small></p>
             </div>
             <div class="text-right">
                  <p>강사 <strong><%=course.getLecturerName() %></strong></p>
                  <p>강의수 <strong><%=course.getQty()%>강</strong></p>
                 <p>포인트 <strong><%=course.getPoint()%>p</strong></p>
             </div>
            		
            <div class="btn-group btn-group-justified" role="group" style="padding-bottom: 10px;">
                    <a href="/jhta_group2_semi_prj/lecturedisplay/lecturedetail/introducePage.jsp?courseNo=<%=course.getCourseNo()%>" class="btn btn-primary">소개</a>
                   <% 
                   if("국어".equals(course.getDeptName())){
                    %><a href="/jhta_group2_semi_prj/enrollment/enrollment-kor.jsp?courseNo=<%=course.getCourseNo() %>" class="btn btn-success">수강신청</a><%
                   }else if("수학".equals(course.getDeptName())){
                    %><a href="/jhta_group2_semi_prj/enrollment/enrollment-math.jsp?courseNo=<%=course.getCourseNo() %>" class="btn btn-success">수강신청</a><%
                   }else if("영어".equals(course.getDeptName())){
                    %><a href="/jhta_group2_semi_prj/enrollment/enrollment-eng.jsp?courseNo=<%=course.getCourseNo() %>" class="btn btn-success">수강신청</a><%
                   }else if("과학".equals(course.getDeptName())){
                    %><a href="/jhta_group2_semi_prj/enrollment/enrollment-sci.jsp?courseNo=<%=course.getCourseNo() %>" class="btn btn-success">수강신청</a><%
                   }
                   %> 
            </div>
        </div>
        <%} %>
</div>
<div class="row text-center">
		<ul class="pagination">
		<% 
			if(p!=1) {
		%>
		  <li><a href="index.jsp?p=<%=(p - 1)%>"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
		<%
			}else{
		%>
			 <li class="disabled"><a href="index.jsp?p=<%=p%>"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
		<% 		
			}
		 	for(int index=beginPage; index<=endPage; index++){ %>
		  <li class="<%=(p==index?"active":"")%>"><a href="index.jsp?p=<%=index %>"><%=index %></a></li>		
		<%
			} 
		 	if(p<totalPages) {
		%>
		  <li><a href="index.jsp?p=<%=(p + 1)%>"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
		<% 
			} else {
		%> 
		  <li class="disabled"><a href="index.jsp?p=<%=p%>"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
		<%
			}
		%>
		</ul>
	</div>
<hr>
</div>
<%@include file="../../common/footer.jsp" %>
</body>
<script type="text/javascript">
    document.getElementById("myDropdown-1").addEventListener("click", function(event){
       var clicked =event.target;
        if(clicked.id === "teacher"){
            var htmlContent = "";
            <%	List<Lecturer> lecturers = lecturerDao.getAllLecturers();
            for(Lecturer lecturer : lecturers){
            %>
            htmlContent += "<li id='<%=lecturer.getNo()%>' style='cursor:pointer'><%=lecturer.getName()%></li>";
            <%}%>
            document.getElementById("menu2").setAttribute("data-toggle", "dropdown");
            document.getElementById("menu2").innerHTML = "소분류"+"<span class='caret'></span>"; 
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
            document.getElementById("menu2").innerHTML = "소분류"+"<span class='caret'></span>"; 
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
		  location.href="/jhta_group2_semi_prj/lecturedisplay/lecturesdisplay/Filter.jsp?pno="+target.id;
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