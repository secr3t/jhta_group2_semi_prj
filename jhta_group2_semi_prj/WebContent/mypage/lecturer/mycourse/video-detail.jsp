<%@page import="pro.video.vo.Video"%>
<%@page import="pro.mypage.dao.MypageCourseDao"%>
<%@page import="pro.utils.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Insert Your Title</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
	   .table-bordered td {
	       text-align: right;
	   }
  </style>	
</head>
<body>
	<%@ include file="/mypage/lecturer/logincheck.jsp" %>
	<%@ include file="/common/nav.jsp" %>
	<%
		int videoNo = StringUtils.changeIntToString(request.getParameter("vno"));
		int courseNo = StringUtils.changeIntToString(request.getParameter("cno"));
		MypageCourseDao courDao = MypageCourseDao.getInstance();
		Video video = courDao.getVideoByVideoNo(videoNo);
	%>
    <div class="container">
 		<div class="col-sm-offset-2 page-header">
			<h1>영상 상세 정보<small> - <%=video.getTitle() %></small><span class="label label-<%="Y".equals(video.getPermit()) ? "info" : "warning" %> pull-right"><%="Y".equals(video.getPermit()) ? "허가 완료" : "미허가" %></span></h1>
		</div>    

        <div class="col-sm-2">
			<%@ include file="../left-menu.jsp" %>
        </div>
        <div class="col-sm-9">
            
            <div class="row well">
                <div class="col-sm-8">
                    <label>강의 소개</label>
                    <p><%=video.getDescription() %></p>
                </div>
            </div>
            
            <div class="row">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <label>강의 관리</label>
                    </div>
                    <table class="table table-bordered">
                        <colgroup>
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                        </colgroup>
                       	<tr>
                        	<th>강의명</th><td><%=courDao.getCourseByCourseNo(courseNo).getName() %></td>
                        	<th>강의순서</th><td><%=video.getOrder() %></td>
                       	</tr>
                       	<tr>
                        	<th colspan="2">링크 주소</th><td colspan="10"><%=video.getLink() %></td>
                       	</tr>
                       	<tr>
                        	<th colspan="2">첨부파일</th><td colspan="10"><%=video.getAttached() %></td>
                       	</tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/common/footer.jsp" %> 
</body>
</html>