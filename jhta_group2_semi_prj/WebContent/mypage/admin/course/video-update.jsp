<%@page import="pro.video.vo.Video"%>
<%@page import="pro.mypage.dao.MypageCourseDao"%>
<%@page import="pro.utils.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int videoNo = StringUtils.changeIntToString(request.getParameter("vno"));
	String changeNo = request.getParameter("change");
	MypageCourseDao courDao = MypageCourseDao.getInstance();
	Video video = courDao.getVideoByVideoNo(videoNo);
	
	final String CHANGE_CODE_ADMIT = "1";
	final String CHANGE_CODE_CANCEL = "2";
	
	if(CHANGE_CODE_ADMIT.equals(changeNo)) {
		video.setPermit("Y");
	} else {
		video.setPermit("N");
	}
	
	courDao.updateVideoInfo(video);
	
	response.sendRedirect("video-detail.jsp?vno=" + videoNo);
%>