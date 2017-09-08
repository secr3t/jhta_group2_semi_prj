<%@page import="pro.dept.dao.DeptDao"%>
<%@page import="pro.utils.DateUtils"%>
<%@page import="pro.student.dao.StudentDao"%>
<%@page import="java.util.List"%>
<%@page import="pro.video.dao.VideoDao"%>
<%@page import="pro.lecturer.dao.LecturerDao"%>
<%@page import="pro.lecturer.vo.Lecturer"%>
<%@page import="pro.postscription.vo.Postscription"%>
<%@page import="pro.introducecourse.dao.LecturePostScriptDao"%>
<%@page import="pro.introducecourse.dao.LectureCourseDao"%>
<%@page import="pro.course.vo.Course"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@include file="../../common/header.jsp" %>
<body>
<%@include file="../../common/nav.jsp" %>
<div class="container">
<%
	int courseNo = Integer.parseInt(request.getParameter("courseNo"));
	System.out.println(courseNo);
	LectureCourseDao courseDao = LectureCourseDao.getInstance();
	LecturePostScriptDao lecturePostScriptDao = LecturePostScriptDao.getInstance();
	LecturerDao lecturerDao = LecturerDao.getInstance();
	VideoDao videoDao = VideoDao.getInstance();

	List<Postscription> postscriptions = lecturePostScriptDao.getPostscriptionsByCourseNo(courseNo);
	Course course = courseDao.getCourseByNo(courseNo);
	Lecturer lecturer = lecturerDao.getLecturerByNo(course.getLecturer().getNo());
	StudentDao studentDao = StudentDao.getInstance();
%>
   <div class="row" style="font-size: 13px; font-weight: bold;">
        <span id="category1"><a href="/jhta_group2_semi_prj/lecturedisplay/lecturesdisplay/index.jsp">강의목록></a></span><span id="category2"></span><span id="category3"></span><span id="category4"></span>
   </div>
   <script type="text/javascript">
   
   </script>
   <div class="row well">
        <div class="col-sm-3">
            <img src=<%=lecturer.getPicture() %> style="width: 70%;">
            <p><strong>맛보기 동영상</strong></p>
        </div>
        <div class="col-sm-6">
            <h3><%=course.getName() %></h3>
            <h4><%=course.getSummary() %></h4>
        </div>
        
        <div class="col-sm-3">
           <div class="row">
               <br>
           </div>
            <div class="text-left">
                <p><small>강사 : <%=lecturer.getName() %></small></p>
                <p><small>강의수 : <%=videoDao.getVideoQtrByCourseNo(courseNo) %>강</small></p>
                <p><small>가격 : <%=course.getPoint() %>P</small></p>
            </div>
            <div class="text-right">
                <button class="btn btn-success">수강신청</button>
            </div>
        </div>
   </div>
   <div class="row">
        <div class="col-sm-9">
            <div class="row well">
                <div class="row">
                    <div class="col-sm-8">
                       <h4><strong>과정소개</strong></h4>
                    </div>
                    <div class="col-sm-4">
                        <span><strong>평점 : </strong></span>
						<span><%=lecturePostScriptDao.getPostscriptionAvgGradeByCourseNo(courseNo)%></span>
                    </div>
                </div>
                <div class="col-sm-12 row">
                    <div style="padding-top:20px">
                        <p><%=course.getDetail() %></p>
                    </div>
                </div>
               
                <div class="row">
                    <div class="col-sm-8"  style="padding-top:30px;">
                        <h4><strong>강사소개</strong></h4>
                    </div>
                </div>    
                <div class="row">
                    <div class="col-sm-3" style="padding-top:30px;">
                        <img src=<%=lecturer.getPicture() %> style="width: 80%;">
                    </div>
                    <div class="col-sm-9">
                        <div class="text-right">
                            <br>
                            <h4><%=lecturer.getName() %>강사</h4>
                            <p><small><%=lecturer.getCareer() %></small></p>
                            <p><small><%=lecturer.getEmail() %></small></p>
                            <p><small><%=lecturer.getPhone() %></small></p>
                        </div> 
                    </div>
                </div>
 		<div class="row">
      		 <div class="col-sm-8"  style="padding-top:30px;">
	       		   <h4><a href="/jhta_group2_semi_prj/board/afterlecture/afterlecture.jsp"><strong>강의후기</strong></a></h4>
      		 </div>
 		</div>    
 		<table class="table table-condensed">
 				<div class= "text-right">
	       		   <span><a href="/jhta_group2_semi_prj/board/afterlecture/afterlecture_write.jsp?courseNo=<%=course.getNo() %>" class="btn btn-success">강의 후기 작성</a></span>
      		 	</div>
      		 	<br>
	 		<tr>
	 			<th>글번호</th> <th>제목</th> <th>작성자</th> <th>작성일</th> <th>평점</th> 
	 		</tr>
 			<%
 				for(Postscription postscription : postscriptions){ 
 			%>
            	<tr>
            		<td><%=postscription.getNo() %></td>
            		<td><a href="/jhta_group2_semi_prj/board/afterlecture/afterlecture_detail.jsp?bno=<%=postscription.getNo()%>"><%=postscription.getTitle() %></a></td>
            		<td><%=studentDao.getStudentByNo(postscription.getStudent().getNo()).getName() %></td>
            		<td><%=DateUtils.yyyymmddhhmmss(postscription.getRegdate())  %></td>
            		<td><%=postscription.getGrade() %>
            	</tr>
            <%}%>
        </table>
       </div>
    </div>
			<% List<Course> courses = courseDao.getCourseByDeptNo(course.getDept().getNo()); %>
        	<div class="col-sm-3">
          	  <div class="row well">
               	<div class="row">
    	         <h5><strong>연관 강의</strong></h5>
        	     <ul>
	        	      <%for(Course c : courses){ %>
	        	      <li><a href="/jhta_group2_semi_prj/lecturedisplay/lecturedetail/introducePage.jsp?courseNo=<%=c.getNo()%>"><small><%=c.getName() %></small></a></li>
	                  <%} %>
             	 </ul>
               	</div>
       		  </div>
       		 </div>  
      	</div>  
     </div>
<%@include file="../../common/footer.jsp" %>
</body>
<script type="text/javascript">
	<%
		DeptDao deptDao = DeptDao.getInstance();
		course = courseDao.getCourseByNo(Integer.parseInt(request.getParameter("courseNo")));
		String deptName = deptDao.getDeptByNo(course.getDept().getNo()).getName(); //과목이름
		int deptNo = course.getDept().getNo(); //과목번호
		String lecturerName = lecturerDao.getLecturerByNo(course.getLecturer().getNo()).getName(); //강사 이름
		int lecturerNo = course.getLecturer().getNo();	//강사번호
		String courseName = course.getName();
		
	%>
		document.getElementById("category2").innerHTML = "<a href='/jhta_group2_semi_prj/lecturedisplay/lecturesdisplay/Filter.jsp?sno=<%=deptNo%>'><%=deptName %>></a>"; 
		document.getElementById("category3").innerHTML = "<a href='/jhta_group2_semi_prj/lecturedisplay/lecturesdisplay/Filter.jsp?tno=<%=lecturerNo%>'><%=lecturerName %>></a>"; 
		document.getElementById("category4").innerText = "<%=courseName %>"; 

</script>
</html>