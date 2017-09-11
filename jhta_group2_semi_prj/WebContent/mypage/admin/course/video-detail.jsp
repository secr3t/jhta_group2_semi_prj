<%@page import="pro.mypage.dao.MypageCourseDao"%>
<%@page import="pro.video.vo.Video"%>
<%@page import="pro.utils.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Detail</title>
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
	<%@ include file="/mypage/admin/logincheck.jsp" %>
	<%@ include file="/common/nav.jsp" %>
    <div class="container">
 		<div class="col-sm-offset-2 page-header">
			<h1>영상 상세 정보</h1>
		</div>
       	<div class="col-sm-2">
			<%@ include file="../left-menu.jsp" %>
		</div>
		         
        <div class="col-sm-9">
               
            <div class="col-sm-9">
            	<table class="table">
              		<colgroup>
              			<col width="20%">
              			<col width="80%">
              		</colgroup>
              		<%
              		int videoNo = StringUtils.changeIntToString(request.getParameter("vno"));
              		Video video = MypageCourseDao.getInstance().getVideoByVideoNo(videoNo);
              		%>
           			<tr>
           				<th>수업 제목</th><td><%=video.getTitle() %></td>
           			</tr>
           			<tr>
           				<th>수업 링크 주소</th><td><a href="<%=video.getLink() %>"><%=video.getLink() %></a></td>
           			</tr>
           			<tr>
           				<th>첨부파일</th><td><a href="download.jsp?fname=<%=video.getAttached() %>"><%=video.getAttached() %></a></td>
           			</tr>
           			<tr>
           				<th>현재 허용 여부</th><td><%=video.getPermit() %></td>
           			</tr>
           			<tr>
           				<th colspan="12">수업에 대한 소개</th>
           			</tr>
           			<tr>
           				<th></th>
           				<td><%=video.getDescription() %></td>
           			</tr>
              	</table>
            </div>		
            <div class="row text-right">
	       		<div class="col-sm-10">
	           		<a href="video-update.jsp?vno=<%=video.getNo() %>&change=<%="Y".equals(video.getPermit()) ? "2" : "1" %>" class="btn btn-<%="Y".equals(video.getPermit()) ? "danger" : "primary" %>"><%="Y".equals(video.getPermit()) ? "허가 취소" : "허가" %></a>
	           	</div>
            </div>
        </div>
    </div>
    <%@ include file="/common/footer.jsp" %>
</body>
</html>