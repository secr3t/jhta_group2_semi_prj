<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Apply Course</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
		.glyphicon {
		    font-size: 20px;
		}
		.table-hover {
		    table-layout: fixed;
		}
		.table-hover td {
		    white-space: nowrap;
		    overflow-x: hidden;
		    text-overflow: ellipsis;
		}
  </style>
</head>
<body>
	<%@ include file="/mypage/lecturer/logincheck.jsp" %>
	<%@ include file="/common/nav.jsp" %>
    <div class="container">
 		<div class="col-sm-offset-2 page-header">
			<h1>새 강의 신청</h1>
		</div>
		
	  	<div class="col-sm-2">
			<%@ include file="../left-menu.jsp" %>
		</div>         
	    <div class="col-sm-9">
             <%
           	 final String FAIL_CODE_NO_COURSE_NAME = "1";
           	 final String FAIL_CODE_NO_DEPT_NAME = "2";
           	 final String FAIL_CODE_LIMIT_POINT = "3";
           	 final String FAIL_CODE_NO_SUMMARY = "4";
           	 
           	 if(FAIL_CODE_NO_COURSE_NAME.equals(request.getParameter("fail"))) {
           	 %>
           	     <div class="alert alert-danger">
           		 	<strong>ERROR!!</strong> 강의명을 입력해주세요. 
           		 </div>
           	 <%
           	 }
           	 if(FAIL_CODE_NO_DEPT_NAME.equals(request.getParameter("fail"))) {
           	 %>
           		 <div class="alert alert-danger">
           		 	<strong>ERROR!!</strong> 강의분류가 선택되지 않았습니다.
           		 </div>
           	 <%
           	 }
           	 if(FAIL_CODE_LIMIT_POINT.equals(request.getParameter("fail"))) {
           	 %>
           		 <div class="alert alert-danger">
           		 	<strong>ERROR!!</strong> 구매 포인트는 최대 999까지만 가능합니다.
           		 </div>
           	 <%
           	 }
           	 if(FAIL_CODE_NO_SUMMARY.equals(request.getParameter("fail"))) {
           	 %>
           		 <div class="alert alert-danger">
           		 	<strong>ERROR!!</strong> 강의 요약 설명은 반드시 입력해주세요.
           		 </div>
           	 <%
           	 }
           	 if(request.getParameter("success") != null) {
           	 %>
           		 <div class="alert alert-success">
           		 	<strong>성공적으로 수정되었습니다.</strong> 
           		 </div>
           	 <%
           	 }
           	 %>
             <form method="post" action="apply.jsp" class="form-horizontal">
                 <div class="form-group">
                     <label class="control-label col-sm-2">강의명</label>
                     <div class="col-sm-7">
                         <input type="text" name="coursename" class="form-control" placeholder="강의명 제한 글자?"/>
                     </div>
                 </div>
                 <div class="form-group">
                     <label class="control-label col-sm-2">강의분류</label>
                     <div class="col-sm-3">
                         <select name="coursedept" class="form-control">
                             <option value="0" selected="selected"> 선택</option>
                             <option value="1"> 언어</option>
                             <option value="2"> 영어</option>
                             <option value="3"> 수학</option>
                             <option value="4"> 과학</option>
                         </select>
                     </div>
                 </div>
                 <div class="form-group">
                     <label class="control-label col-sm-2">강의 구매 포인트</label>
                     <div class="col-sm-2">
                         <input type="number" name="coursepoint" max="999" class="form-control"/>
                     </div>
                     <label class="col-sm-1"><span class="glyphicon glyphicon-copyright-mark text-warning"></span></label>
                     <p class="col-sm-4 help-block"><small>포인트는 최대 3자리 수까지만 가능합니다.</small></p>
                 </div>
                 <div class="form-group">
                 	<label class="control-label col-sm-2">강의 요약</label>
                 	<div class="col-sm-7">
                 		<textarea rows="2" name="coursesummary" class="form-control" placeholder="xx자 내외로 써주세요."></textarea>
                 	</div>
                 </div>
                 <div class="form-group">
                 	<label class="control-label col-sm-2">강의 소개</label>
                 	<div class="col-sm-7">
                 		<textarea rows="15" name="courseinfo" class="form-control" placeholder="xx자 내외로 써주세요."></textarea>
                 	</div>
                 </div>
                 <div class="col-sm-10 form-group text-right">
                     <button type="reset" class="btn btn-warning">초기화</button>
                     <button type="submit" class="btn btn-success">신청</button>
                 </div>
             </form>
         </div>
     </div>
    <%@ include file="/common/footer.jsp" %>
</body>
</html>