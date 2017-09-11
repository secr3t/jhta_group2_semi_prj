<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
   String params =request.getQueryString();
    params = params  == null ? "" : "?"+params;
    String url = request.getRequestURI();
    System.out.println(url);
    System.out.println(params);
   if(session.getAttribute("loginUser")==null){
	   String path = "/jhta_group2_semi_prj/login/login.jsp?deny=1&returnUrl="+url+params;
	   response.sendRedirect(path);
      return;
   }
    %>