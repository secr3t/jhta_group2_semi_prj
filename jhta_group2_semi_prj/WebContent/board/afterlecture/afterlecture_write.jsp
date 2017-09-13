<%@page import="pro.course.vo.Course"%>
<%@page import="java.util.List"%>
<%@page import="pro.introducecourse.dao.LectureCourseDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@include file="../../common/header.jsp"%>
<body>
<%@include file="../../common/loginCheck.jsp"%>
<%
 if(request.getParameter("error")!=null){
%>
<script type="text/javascript">
	alert("입력되지 않은 항목이 있습니다.");
</script>
<%  
 }
%>

<%@include file="../../common/nav.jsp"%>
<div class="content-primary">
<div class="container">
	<div class="col-sm-2">
		<%@include file="../boardbanner/left-menu.jsp" %>
	</div>
	<div class="col-sm-9">
	  <div class="row">
	    <div class="content-header">
	        <div class="crumb">
	  	        <h1 >강의 후기 게시판</h1>
	  			<h4>
	  			<span style="color:red;"><strong>|</strong>
	  			</span>	강의 후기 쓰기
	  			</h4>
	        </div>
	    </div>
	  	    <hr>
				<div class="container">
					<div class="row col-md-10">
						<form class="form-horizontal" method="post" action="add_afterlecture.jsp">
						<% 
							int courseNo = 0;
							if(request.getParameter("courseNo") != null) {
						courseNo = Integer.parseInt(request.getParameter("courseNo")); 
						 %>
						<input type="hidden" name="courseNo" value="<%=courseNo %>">
						<%} %>
							<div class="form-group">
								<label class="col-sm-1 control-label">제목</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" name="title" />
									
								</div>
								<div class="col-sm-1 control-label">
										<strong>과정명</strong>
									</div>
									<select class="form-control col-sm-1 control-label" style="width: 120px;" name="type" id="subject">
									<%LectureCourseDao ldao = LectureCourseDao.getInstance();
										List<Course> courses = ldao.getAllCourses();
										if(request.getParameter("courseNo")== null) {
										for(Course course : courses) {
									%>
										<option value="<%=course.getNo()%>"><%=course.getName() %></option>
									<%
											}
										} %>
									</select>
								<label class="col-sm-1 control-label"><strong>평점</strong></label>
								<div class="col-sm-3">
									<label class="radio-inline">
	 								 <input type="radio" name="inlineRadioOptions" value="1"> 1
									</label>
									<label class="radio-inline">
									  <input type="radio" name="inlineRadioOptions" value="2"> 2
									</label>
									<label class="radio-inline">
									  <input type="radio" name="inlineRadioOptions" value="3"> 3
									</label>
									<label class="radio-inline">
									  <input type="radio" name="inlineRadioOptions" value="4"> 4
									</label>
									<label class="radio-inline">
									  <input type="radio" name="inlineRadioOptions" value="5"> 5
									</label>
								</div>
								
							</div>
							
							<div class="form-group">
								<label class="col-sm-1 control-label">내용</label>
								<div class="col-sm-10">
									<textarea rows="6" class="form-control " name="contents"></textarea>
								</div>
							</div>
							
						
							
							<div class="form-group">
								<div class="col-sm-offset-1 col-sm-10 text-right">
									<a href="/jhta_group2_semi_prj/board/afterlecture/afterlecture.jsp" class="btn btn-warning btn-md">취소</a>
									<button type="submit" class="btn btn-primary btn-md">완료</button>
								</div>
							</div>
						</form>
					</div>
				</div>
		</div>
	</div>
</div>
 <div class="col-sm-1"></div>
</div>

<%@include file="../../common/footer.jsp"%>

</body>
</html>