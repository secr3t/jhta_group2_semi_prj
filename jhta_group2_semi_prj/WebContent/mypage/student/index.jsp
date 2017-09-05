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
	<% %>
	<%@ include file="../../common/nav.jsp" %>
	<div class="container">
	
		<div class="col-sm-offset-2 page-header">
			<h1>My Page</h1>
		</div>

    	<div class="col-sm-2">
			<%@ include file="left-menu.jsp" %>
		</div>

         <div class="col-sm-9">
             <div class="row">
                 <div class="col-sm-offset-1 col-sm-10">
                       <div class="panel panel-success">
                        	<div class="panel-heading">
                            	<label>김환희님 환영합니다.</label>
                            	<a href="#" class="pull-right">내 정보로 이동</a>
                        	</div>
                         	<table class="table table-condensed">
                             	<tr>
                                 	<th></th><td></td>
                                 	<th>잔여 포인트</th><td>500 <span class="glyphicon glyphicon-copyright-mark text-warning"></span></td>
                                 	<th><a href="#" class="btn btn-primary btn-sm pull-right">포인트 충전</a></th><td></td>
                             	</tr>
                        	 </table>
                       </div>
                 </div>
             </div>
 
             <div class="row">
                 <div class="col-sm-12">
                     <div class="panel panel-info">
                         <div class="panel-heading">
                             <label><a href="mycourse.jsp" class="pull-right">내 수강 목록</a></label>
                         </div>
                         <table class="table table-condensed table-hover">
                             <colgroup>
                                 <col width="30%">
                                 <col width="20%">
                                 <col width="50%">
                             </colgroup>
                             <thead>
                                 <tr>
                                     <th>강의명</th><th>강사</th><th>진행률</th>
                                 </tr>
                             </thead>
                             <tbody>
                                 <tr>
                                     <td><a href="course-info.jsp?no=1">Java</a></td>
                                     <td>이응수</td>
                                     <td>
                                         <div class="progress">
                                             <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemin="100" style="width: 20%;">
                                                <span>20%</span>
                                            </div>
                                        </div>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td><a href="course-info.jsp?no=1">Java</a></td>
                                    <td>이응수</td>
                                    <td>
                                        <div class="progress">
                                            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemin="100" style="width: 40%;">
                                                <span>40%</span>
                                            </div>
                                        </div>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td><a href="course-info.jsp?no=1">Java</a></td>
                                    <td>이응수</td>
                                    <td>
                                        <div class="progress">
                                            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemin="100" style="width: 90%;">
                                                <span>90%</span>
                                            </div>
                                        </div>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td><a href="course-info.jsp?no=1">Java</a></td>
                                    <td>이응수</td>
                                    <td>
                                        <div class="progress">
                                            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemin="100" style="width: 0%;">
                                                <span>0%</span>
                                            </div>
                                        </div>
                                    </td>
                                 </tr>  
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-sm-12">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <label><a href="myqna.jsp" class="pull-right">내 QnA</a></label>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-condensed table-hover">
                                <colgroup>
                                    <col width="50%">
                                    <col width="30%">
                                    <col width="20%">
                                </colgroup>                                   
                                <thead>
                                    <tr>
                                        <th>제목</th><th>강의명</th><th>게시일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><a href="#">Java가 무엇입니까?dddddddddddd</a></td>
                                        <td><a href="course-info.jsp?no=1">Java</a></td>
                                        <td>17/08/21</td>
                                    </tr>                               
                                    <tr>
                                        <td><a href="#">Java가 무엇입니까?dddddddddddd</a></td>
                                        <td><a href="course-info.jsp?no=1">Java</a></td>
                                        <td>17/08/21</td>
                                    </tr>
                                    <tr>
                                        <td><a href="#">Java가 무엇입니까?dddddddddddd</a></td>
                                        <td><a href="course-info.jsp?no=1">Java</a></td>
                                        <td>17/08/21</td>
                                    </tr>                
                                    <tr>
                                        <td><a href="#">Java가 무엇입니까?dddddddddddd</a></td>
                                        <td><a href="course-info.jsp?no=1">Java</a></td>
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
   	<%@ include file="../../common/footer.jsp" %>
</body>
</html>