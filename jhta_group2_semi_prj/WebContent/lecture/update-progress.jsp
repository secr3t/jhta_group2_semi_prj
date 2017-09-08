<%@page import="pro.video.vo.Video"%>
<%@page import="pro.progress.vo.Progress"%>
<%@page import="pro.progress.dao.ProgressDao"%>
<%@page import="pro.user.vo.User"%>
<%@page import="pro.student.vo.Student"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
request.setCharacterEncoding("utf-8");

Student student = new Student();		// 후에 session에서 꺼낸 user정보를 바로 전달해주면됨.
User user = (User) session.getAttribute("loginUser");
Video video = new Video();
Progress progress = new Progress();
 
student.setNo(1);
video.setNo(1);
progress.setStudent(student);
progress.setVideo(video);
 
ProgressDao dao = ProgressDao.getInstance();

BufferedReader br = request.getReader();

double complete = Double.parseDouble(br.readLine());
System.out.println(complete);
progress.setComplete(complete);

dao.updateProgress(progress);
%>