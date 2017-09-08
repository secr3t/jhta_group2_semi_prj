<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
request.setCharacterEncoding("utf-8");
response.setContentType("text/plain;charset=utf-8");
BufferedReader br = request.getReader();
System.out.println(br.readLine());
PrintWriter pw = response.getWriter();
pw.println("update 완료");
%>