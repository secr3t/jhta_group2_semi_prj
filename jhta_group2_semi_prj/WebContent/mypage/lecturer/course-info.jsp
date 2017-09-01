<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Insert Your Title</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
	   .table-bordered td {
	       text-align: right;
	   }
  </style>	
</head>
<body>
	<%@ include file="../../common/nav.jsp" %>
    <div class="container-fluid">
        <h1>My Course</h1>
        <hr/>
        <div class="row">
            <div class="col-sm-2">
				<%@ include file="left-menu.jsp" %>
            </div>
            <div class="col-sm-9">
                <h2 class="sub-header">Java</h2>
                <hr/>
                
                <div class="row well">
                    <div class="col-sm-8">
                        <label>강의 소개</label>
                        <p>간단한 강의에 대한 소개입니다.</p>
                    </div>
                    <div class="col-sm-4">
                        <img src="../images/cassano.jpg" alt="강사사진" style="width: 240px;"/>
                    </div>
                </div>
                
                <div class="row">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <label>강의 관리</label>
                        </div>
                        <table class="table table-bordered">
                            <colgroup>
                                <col width="50%">
                                <col width="30%">
                                <col width="20%">
                            </colgroup>
                            <tr>
                                <th>현재 등록된 강의 수</th><td>10개</td>
                                <td><a href="upload-lectureform.jsp" class="btn btn-info pull-right">새영상 등록</a></td>
                            </tr>                        
                            <tr>
                                <th>수강 중인 학생 수</th><td>20명</td>
                                <td><a href="manager-student.jsp" class="btn btn-info pull-right">학생 관리</a></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../../common/footer.jsp" %> 
</body>
</html>