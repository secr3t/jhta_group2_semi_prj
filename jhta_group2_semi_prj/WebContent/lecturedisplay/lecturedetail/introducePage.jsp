<%@page import="pro.introducecourse.dao.LectureCourseDao"%>
<%@page import="pro.course.vo.Course"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@include file="../../common/header.jsp" %>
<body>
<%@include file="../../common/nav.jsp" %>
<div class="container">
<%
	LectureCourseDao courseDao = LectureCourseDao.getInstance();
	//Course course = courseDao.getCourseByNo(no);

%>
   <div class="row">
        <p><small>Home>All subjects>Economic>Marketing Analytics</small></p>
   </div>
   <div class="row well">
        <div class="col-sm-3">
            <img src="../../images/%EA%B0%95%EC%82%AC%EC%82%AC%EC%A7%84.jpg" style="width: 70%;">
            <p><strong>맛보기 동영상</strong></p>
        </div>
        <div class="col-sm-6">
            <h3>Marketing Analytics: Marketing Measurement Strategy</h3>
            <h4>Learn best approaches and practices for marketing measurement, including how to use metrics to measure success.</h4>
        </div>
        
        <div class="col-sm-3">
           <div class="row">
               <br>
           </div>
            <div class="text-left">
                <p><small>강사 : 이성환</small></p>
                <p><small>등록일 : 2017-09-01</small></p>
                <p><small>강의수 : 60강</small></p>
                <p><small>가격 : 900P</small></p>
            </div>
            <div class="text-right">
                <button class="btn btn-success">수강신청</button>
            </div>
        </div>
   </div>
   <div class="row">
        <div class="col-sm-9">
            <div class="row well">
                <div class="row">
                    <div class="col-sm-8">
                        <h4>About this course</h4>
                    </div>
                    <div class="col-sm-4">
                        <h5>평점</h5>
                    </div>
                </div>
                <div class="col-sm-12 row">
                    <div style="padding-top:20px">
                        <p>Begin your journey in a new career in marketing analytics. Learn about powerful strategies and methodology, starting with identifying market trends and metrics used to measure marketing success.</p>
                    </div>
                    <div class="col-sm-12 row collapse" id="collapseExample">
                        <div class="car card-block" style="white-space: pre-line;">
                            <p>In this marketing course, you will learn how to execute market sizing, identify market trends, and predict future conditions.

                            This course is taught by Stephan Sorger who has held leadership roles in marketing and product development at companies such as Oracle, 3Com and NASA. He has also taught for over a decade at UC Berkeley Extension and is the author of two widely adopted marketing textbooks. This course will equip you with the knowledge and skills necessary to immediately see practical benefits in the workplace.

                            Analytics-based marketing is increasingly important in determining a company’s spending and ROI. Many entry-level positions in marketing now require some basic level of knowledge in this rapidly growing field.</p>
                        </div>
                    </div>
                    <div class="col-sm-8">
                         <button class="btn btn-default" type="button" data-toggle="collapse" 
                                 data-target="#collapseExample" aria-expanded="false" 
                                 aria-controls="collapseExample">+ See More</button>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-8"  style="padding-top:30px;">
                        <h4>What you'll learn</h4>
                    </div>
                </div>    
                <div class="row">
                    <ul>
                        <li>How to identify market trends</li>
                        <li>How to predict future conditions</li>
                        <li>An understanding of metrics used to measure marketing success</li>
                    </ul>
                </div>
                <div class="row">
                    <div class="col-sm-8"  style="padding-top:30px;">
                        <h4>Teacher Inroduction</h4>
                    </div>
                </div>    
                <div class="row">
                    <div class="col-sm-3" style="padding-top:30px;">
                        <img src="../../images/%EA%B0%95%EC%82%AC%EC%82%AC%EC%A7%84.jpg" style="width: 80%;">
                    </div>
                    <div class="col-sm-9">
                        <div class="text-right">
                            <br>
                            <h4>이성환 강사</h4>
                            <p><small>태평양중학교졸업</small></p>
                            <p><small>하와이거주</small></p>
                            <p><small>sleepyHead@gmail.com</small></p>
                            <p><small>050-0900-9999</small></p>
                        </div> 
                    </div>
                </div>  
<%@include file="lecturereviews.jsp"%>
        <div class="col-sm-3">
            <div class="row well">
               <div class="row">
    	         <h5><strong>연관 강의</strong></h5>
        	     <ul>
	        	      <li><a href=""><small>Introduction to Brokerage Operations</small></a></li>
	                  <li><a href=""><small>Macroeconomics</small></a></li>
             	 </ul>
               </div>
               <div class="row">
                   <h5><strong>인기 강의</strong></h5>
                   <ul>
	        	      <li><a href=""><small>Introduction to Brokerage Operations</small></a></li>
	                  <li><a href=""><small>Macroeconomics</small></a></li>
             	 </ul>
               </div>
            </div>
        </div>
    </div>
<%@include file="../../common/footer.jsp" %>
</body>
<script type="text/javascript">
	
</script>
</html>