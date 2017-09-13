<%@page import="pro.enrollment.vo.Enrollment"%>
<%@page import="java.util.List"%>
<%@page import="pro.enrollment.dao.EnrollmentDao"%>
<%@page import="pro.user.vo.User"%>
<%@page import="pro.student.vo.Student"%>
<%@page import="pro.utils.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int cn = StringUtils.changeIntToString(request.getParameter("courseNo"));
int on = StringUtils.changeIntToString(request.getParameter("orderNo"));
User user =  (User) session.getAttribute("loginUser");
if(on != 1 && "S".equals(user.getType())){
	boolean permission = false;
	// enrollment 테이블에서 찾은 후 아니면 권한 없음 반환.
	Student student = (Student) user;
	EnrollmentDao enrollmentDao = EnrollmentDao.getInstance();
	List<Enrollment> lists =  enrollmentDao.getEnrolledListsByStudentNo(student.getNo());
	for(Enrollment item : lists) {
		if(item.getCourse().getNo() ==  cn){
			permission = true;
			System.out.println("권한 확인 완료");
			break;
		}
	}
	if(!permission) {
		System.out.println("권한 없음");
	%>
	<script>
	alert("강의 시청 권한이 없습니다. 수강신청을 먼저 해주시길 바랍니다.");
	</script>
	<%
	response.sendRedirect("/jhta_group2_semi_prj/");
	return;
	}
}
%>