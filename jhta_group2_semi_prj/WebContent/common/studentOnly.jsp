<%@page import="pro.user.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
User checkedUser = (User) session.getAttribute("loginUser");
if(!"S".equals(checkedUser.getType().toUpperCase())){
	response.sendError(401);
	return;
}
%>