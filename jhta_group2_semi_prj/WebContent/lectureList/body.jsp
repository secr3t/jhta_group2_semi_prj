<%@page import="pro.video.vo.Video"%>
<%@page import="java.util.List"%>
<%@page import="pro.video.dao.VideoDao"%>
<%@page import="pro.utils.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	int courseNo = StringUtils.changeIntToString(request.getParameter("courseNo"));
    	VideoDao videoDao = VideoDao.getInstance();
    	List<Video> videoLists =videoDao.getVideosByCourseNo(courseNo); 	
    %>
<div class="well">
	<div class="row"></div>
	<%
	int count = 1;
	for(Video video : videoLists) {
	%>
	<div class="row">
	
	<a href="/jhta_group2_semi_prj/lecture/index.jsp?courseNo=<%=courseNo %>
		&orderNo=<%=count %>" target="_blank">
		<span class="col-sm-offset-1 col-sm-4">강의 <%=count %> </span><span class="small col-sm-6"><%=video.getTitle() %></span>
	</a>
	</div>
	<%
	count++;
	}
	%>
</div>