<%@page import="com.google.gson.Gson"%>
<%@page import="pro.introducecourse.dao.LecturerDao"%>
<%@page import="pro.lecturer.vo.Lecturer"%>
<%@page import="pro.dept.vo.Dept"%>
<%@page import="java.util.List"%>
<%@page import="pro.dept.dao.DeptDao"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	String type = request.getParameter("type");
	
	String jsonText = "[]";
	Gson gson = new Gson();
	if ("sub".equals(type)) {
		List<Dept> deptList = DeptDao.getInstance().getAllDepts();
		jsonText = gson.toJson(deptList);
	} else if ("lct".equals(type)) {
		List<Lecturer> lecturerList = LecturerDao.getInstance().getAlllecturers();
		jsonText = gson.toJson(lecturerList);		
	}
	
	out.write(jsonText);

%>