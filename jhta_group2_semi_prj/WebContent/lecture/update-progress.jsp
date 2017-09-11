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
Student loginUser = (Student) session.getAttribute("loginUser");
// 후에 loginUser의 no를 받아와서 update 하면됨.
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


double beforeComplete = 0.0;
try {
	beforeComplete = dao.getCompleteByStudentAndVideo(progress);
} catch(Exception e) {
	// beforeComplete가 null인경우 0과 마찬가지이므로 업데이트 함.
}

if(beforeComplete < complete){
progress.setComplete(complete);
dao.updateProgress(progress);
} else {
	System.out.println("이전 진행률이 더 높습니다. 업데이트를 하지 않습니다.");
}

%>