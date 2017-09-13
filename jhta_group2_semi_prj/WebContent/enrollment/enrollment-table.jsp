<%@page import="pro.enrollment.vo.Enrollment"%>
<%@page import="pro.enrollment.dao.EnrollmentDao"%>
<%@page import="pro.student.vo.Student"%>
<%@page import="pro.student.dao.StudentDao"%>
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
<%@include file="../common/loginCheck.jsp" %>
<!--  왼쪽 메뉴 부분은 상의하여 각 페이지마다 메뉴를 불러올 것인지 각 페이지의
 left-menu.jsp를 만들어서 사용할 것인지 논의가 필요함.(사실 상 mypage 부분을 제외하고는 거의 겹친다고 보면됨.)
 -->
<%--  <% int parameterCourseNo = Integer.parseInt(request.getParameter("courseNo"));
	 System.out.println(parameterCourseNo);
 %>  --%> 
	<%
	LectureCourseDao courseDao = LectureCourseDao.getInstance();
	// 유저 세션정보
	Student student = (Student)loginUser;
	// 과목 List로 담기
	List<Course> courses = courseDao.getNotEnrolledCoursesByStudentNo(student.getNo());
	DeptDao deptDao = DeptDao.getInstance();
	LecturerDao lecturerDao = LecturerDao.getInstance();
	StudentDao studentDao = StudentDao.getInstance();
	EnrollmentDao enrollmentDao = EnrollmentDao.getInstance();
	// 과목 전체 갯수 - course에서 가져온 과목 갯수 
	int courseCount = courseDao.getCourseQty();
	courseCount -= courses.size();
	%>
	
	<div class="container">
		<div class="book-table">
			<div class="panel-default">
				<ul class="nav nav-tabs">
					<li class="active"><a href="enrollment-table.jsp">전체</a></li>
					<li><a href="enrollment-kor.jsp">국어</a></li>
					<li><a href="enrollment-eng.jsp">영어</a></li>
					<li><a href="enrollment-math.jsp">수학</a></li>
					<li><a href="enrollment-sci.jsp">과학</a></li>
					<!-- <li id="act" class="active all kor math eng sci">전체</li> -->
				</ul>
			</div>
			<form id="list-form">
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
						for(Course course : courses ){
							// 강사 강의자료 운영자 허용 체크
							if(course.getPermit().equals("Y")){
						%>
						<tr>
							<td class="deptName" id="name"><%=deptDao.getDeptByNo(course.getDept().getNo()).getName() %></td>
							<td class="courseName"><%=course.getName() %></td>
							<td><a href="../lecturedisplay/lecturedetail/introducePage.jsp?courseNo=<%=course.getNo()%>">과정소개</a></td>
							<td class="lecturerName"><%=lecturerDao.getLecturerByNo(course.getLecturer().getNo()).getName() %></td>
							<td class="point"><%=course.getPoint()%></td>
							<td class="course-no hide" ><%=course.getNo() %></td>
							<%-- <td id="parameterCourseNo hide"><%=parameterCourseNo%></td> --%>
						</tr>
						<%} 
						}%>
					</tbody>
				</table>
			</form>
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
		<!-- <form id="selected-form"> -->
		<form id="submit-form" method="get" action="add-enrollment.jsp">
			
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
		<input type="hidden" id="selected-course-no" name="courseNo"/>
		<input type="hidden" id="payment" name="studentPoint"/>
	<div class= "text-right">
		<ul class="well">
			<li>수강중인 과목수:<strong id="now-count"><%=courseCount%></strong></li>
			<li>예상포인트:<strong id="point">0</strong></li>
			<li>현재포인트:<strong id="student-point"><%=student.getPoint()%></strong></li>
			<li>수강과목수:<strong id="count"></strong></li>
		</ul>
	</div>
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
	var pointValue = 0;
	
	// 강의 갯수 제한 
	var max = 10 - document.getElementById('now-count').innerText;
	
	for(var i=0; i<trNodeList.length; i++){
		var tr = trNodeList.item(i);
		
		// 클릭시 테이블 이동  함수
		tr.addEventListener('click', function(event){
			var self = event.target;
				// 
				if(self.parentNode.parentNode == deptList && selectedList.getElementsByTagName('tr').length<max ){
					// selectedList로 클릭된 과목 append
					selectedList.append(self.parentNode);
					
					// 클릭시마다 선택된 과목의course-number를  selectedCourseNoValues배열에 저장
					var selectedCourseNoNodeList = document.querySelectorAll('#selected-list .course-no.hide');
					var selectedCourseNoValues = [];
					Array.from(selectedCourseNoNodeList).forEach(function(item, index){
						selectedCourseNoValues.push(item.textContent);
					})
					
					// selectedCourseNoValues에 저장된 course-number를 input.value에 저장
					document.getElementById("selected-course-no").value = selectedCourseNoValues;
				} else if(self.parentNode.parentNode == selectedList){
					
					deptList.append(self.parentNode);
					var selectedCourseNoNodeList = document.querySelectorAll('#selected-list .course-no.hide');
					var selectedCourseNoValues = [];
					Array.from(selectedCourseNoNodeList).forEach(function(item, index){
					})
				document.getElementById("selected-course-no").value = selectedCourseNoValues;
				}
		var selectedPointNodeList = document.querySelectorAll('#selected-list .point');
		var selectedPointValues = [];
		var point = 0;
		Array.from(selectedPointNodeList).forEach(function(item, index){
			selectedPointValues.push(item.textContent);
			point += parseInt(item.textContent);
			})
			document.getElementById('point').innerText = point;
		
		// 선택된 과정번호 가져오기
		var selectedCountNodeList = document.querySelectorAll('#selected-list .course-no');
		// 그 길이를 변수에 담기
		var selectedCountValue = selectedCountNodeList.length;
		
		document.getElementById('count').innerText = selectedCountValue + "/" + max + "(수강가능 과목수)";
		}) 
		
	};		
}())

	   document.getElementById("btn").addEventListener('click',function(event){
		event.preventDefault();
		var selectedStudentPoint = parseInt(document.querySelector('#student-point').innerText)
		var point = parseInt(document.getElementById('point').innerText)
		var selectedCountNodeList = document.querySelectorAll('#selected-list .course-no');
		if(selectedStudentPoint < point){
			alert("포인트가 모자랍니다.");
		} else if(!point) {
			alert("과정을 선택해주세요.");
		} else{
			document.getElementById("payment").value = selectedStudentPoint - point;
			document.getElementById("submit-form").submit();
		}
	});   
	
	/* function courseNo(event){
	
		event.preventDefault();
		var selectedCourseNoNodeList = document.querySelectorAll('#selected-list .course-no.hide');
		var selectedCourseNoValues = [];
		Array.from(selectedCourseNoNodeList).forEach(function(item, index){
			selectedCourseNoValues.push(item.textContent);
		})
		console.log(selectedCourseNoValues); 
		 document.getElementById("button-form").submit(); 
	} */
	
	
	
</script>
</html>