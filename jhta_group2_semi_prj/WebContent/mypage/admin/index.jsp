<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>My Page</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style>
	    .glyphicon {
            font-size: 20px;
        }
        .table-hover {
            table-layout: fixed;
        }
        .table-hover td {
            white-space: nowrap;
            overflow-x: hidden;
            text-overflow: ellipsis;
        }
	</style>
</head>
<body>
	<%@ include file="../../common/nav.jsp" %>
	<div class="container-fluid">
	        <h1>My Page</h1>
	        <hr/>
	        <div class="row">
	        	<div class="col-sm-2">
					<%@ include file="left-menu.jsp" %>
				</div>  
	            <div class="col-sm-9">    
	                <div class="row">
	                    <div class="col-sm-12">
	                        <div class="panel panel-warning">
	                            <div class="panel-heading">
	                                <label><a href="manager-lecturer.jsp">새 강사 신청</a><span class="badge">4</span></label>
	                            </div>
	                            <table class="table table-condensed table-hover">
	                                <colgroup>
	                                    <col width="20%">
	                                    <col width="20%">
	                                    <col width="25%">
	                                    <col width="20%">
	                                </colgroup>
	                                <thead>
	                                    <tr>
	                                        <th>ID</th><th>강사명</th><th>가입일</th><th>강의분야</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                    <tr>
	                                        <td><a href="course-detail.jsp?no=2">Hong</a></td>
	                                        <td>홍길동</td>
	                                        <td>17/08/31</td>
	                                        <td>언어</td>
	                                    </tr>
	                                    <tr>
	                                        <td><a href="course-detail.jsp?no=2">Hong</a></td>
	                                        <td>홍길동</td>
	                                        <td>17/08/31</td>
	                                        <td>언어</td>
	                                    </tr>
	                                    <tr>
	                                        <td><a href="course-detail.jsp?no=2">Hong</a></td>
	                                        <td>홍길동</td>
	                                        <td>17/08/31</td>
	                                        <td>언어</td>
	                                    </tr>
	                                    <tr>
	                                        <td><a href="course-detail.jsp?no=2">Hong</a></td>
	                                        <td>홍길동</td>
	                                        <td>17/08/31</td>
	                                        <td>언어</td>
	                                    </tr>
	                                </tbody>
	                            </table>
	                        </div>
	                    </div>
	                    <div class="col-sm-12">
	                        <div class="panel panel-info">
	                            <div class="panel-heading">
	                                <label>새 강의 신청<span class="badge">2</span></label>
	                                <a href="manager-course.jsp" class="pull-right">전체 강의 목록</a>
	                                
	                            </div>
	                            <div class="table-responsive">
	                                <table class="table table-condensed table-hover">
	                                    <colgroup>
	                                        <col width="50%">
	                                        <col width="20%">
	                                        <col width="10%">
	                                        <col width="20%">
	                                    </colgroup>                                   
	                                    <thead>
	                                        <tr>
	                                            <th>강의명</th><th>분류</th><th>강사명</th><th>신청일</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr>
	                                            <td><a href="course-detail.jsp?no=2">수학의 정석</a></td>
	                                            <td>수학</td>
	                                            <td><a href="lecturer-detail.jsp?no=2">정약용</a></td>
	                                            <td>17/08/21</td>
	                                        </tr>                               
	                                        <tr>
	                                            <td><a href="course-detail.jsp?no=2">수학의 정석</a></td>
	                                            <td>수학</td>
	                                            <td><a href="lecturer-detail.jsp?no=2">정약용</a></td>
	                                            <td>17/08/21</td>
	                                        </tr>                              
	                                    </tbody>
	                                </table>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	   	<%@ include file="../../common/footer.jsp" %>
</body>
</html>