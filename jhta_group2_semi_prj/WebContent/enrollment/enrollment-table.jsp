<%@page import="java.util.List"%>
<%@page import="pro.dept.dao.DeptDao"%>
<%@page import="pro.lecturer.vo.Lecturer"%>
<%@page import="pro.lecturer.dao.LecturerDao"%>
<%@page import="pro.course.vo.Course"%>
<%@page import="pro.introducecourse.dao.LectureCourseDao"%>
<%@page import="pro.dept.vo.Dept"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@include file="../common/header.jsp" %>
<body>
<%@include file="../common/nav.jsp" %>
<!--  왼쪽 메뉴 부분은 상의하여 각 페이지마다 메뉴를 불러올 것인지 각 페이지의
 left-menu.jsp를 만들어서 사용할 것인지 논의가 필요함.(사실 상 mypage 부분을 제외하고는 거의 겹친다고 보면됨.)
 -->
	<div class="container">
		<div class="book-table">
			<div class="panel-default">
				<ul class="nav nav-tabs">
					<li class="active"><a href="enrollment-table.jsp">전체</a></li>
					<li><a href="enrollment-kor.jsp">국어</a></li>
					<li><a href="enrollment-eng.jsp">영어</a></li>
					<li><a href="enrollment-math.jsp">수학</a></li>
					<li><a href="enrollment-sci.jsp">과학</a></li>
				</ul>
			</div>
				 
				<table class="table table-hover table-condensed">
					<thead>
						<tr>
							<th>과목명</th>
							<th>과정명</th>
							<th>소개</th>
							<th>강사이름</th>
							<th>Point</th>
						</tr>
					</thead>
					<tbody id="dept-list">
						<%
						LectureCourseDao courseDao = LectureCourseDao.getInstance();
						List<Course> courses = courseDao.getAllCourses();
						DeptDao deptDao = DeptDao.getInstance();
						LecturerDao lecturerDao = LecturerDao.getInstance();
						for(Course course : courses ){
						%>
						<tr>
							<td class="deptName"><%=deptDao.getDeptByNo(course.getDept().getNo()).getName() %></td>
							<td class="courseName"><%=course.getName() %></td>
							<td><a href="#">링크</a></td>
							<td class="lecturerName"><%=lecturerDao.getLecturerByNo(course.getLecturer().getNo()).getName() %></td>
							<td class="point"><%=course.getPoint()%></td>
							<td class="course-no hide">1</td>
						</tr>
						<%} %>
					</tbody>
				</table>
		</div>
		<br><br />
		<!-- <p>
		<button id= "btn-down">down</button>
		<button id= "btn-up">up</button>
		</p> -->
		<div align="center">
		<button type="button" class="btn btn-default" aria-label="">
  		<span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
		</button>
		</div>
		
		<br><br />
		<div class="book-table">
				<table class="table table-hover table-condensed">
					<thead>
						<tr>
							<th>과목명</th>
							<th>과정명</th>
							<th>소개</th>
							<th>강사이름</th>
							<th>Point</th>
						</tr>
					</thead>
					<tbody id="selected-list">
						
					</tbody>
				</table>
		</div>
	<div class= "text-right">
		<ul class="well">
			<li>예상포인트</li>
			<li>현재포인트</li>
			<li>수강과목수</li>
			
		</ul>
	</div>
	<form action="add-enrollment.jsp">
		<div class="text-right">
			<button id="btn" type="submit" class="btn btn-primary">제출</button>		
		</div>
	</form>
	<%@include file="../common/footer.jsp" %>
	</div>
</body>

<script type="text/javascript">
(function(){	
	var trNodeList = document.querySelectorAll("#dept-list>tr");
	var selectedList = document.getElementById("selected-list");
	var deptList = document.getElementById("dept-list");

	for(var i=0; i<trNodeList.length; i++){
		var tr = trNodeList.item(i);
		 tr.addEventListener('click', function(event){
			var self = event.target;
				if(self.parentNode.parentNode == deptList && selectedList.getElementsByTagName('tr').length<10){
					selectedList.append(self.parentNode);
				} else if(self.parentNode.parentNode == selectedList){
					deptList.append(self.parentNode);
				}
				
		})
	};		
}())

	document.getElementById("btn").addEventListener('click',function(event){
	var selectedNodeList = document.querySelectorAll('#selected-list .course-no.hide');
	var selectedValues = [];
	Array.from(selectedNodeList).forEach(function(item, index){
		selectedValues.push(item.textContent);
		})
	});

</script>
</html>