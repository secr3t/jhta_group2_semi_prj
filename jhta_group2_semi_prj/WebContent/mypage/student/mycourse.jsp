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
  <title>My Course</title>
</head>
<body>
	<%@ include file="../../common/nav.jsp" %>
    <div class="container-fluid">
        <h1>My Course</h1>
        <hr/>
        <div class="row">
            <div class="col-sm-2">
                <ul class="nav nav-pills nav-stacked">
                    <li role="presentation"><a href="index.jsp">My Page 홈</a></li>
                    <li role="presentation"><a href="#">내 정보</a></li>
                    <li role="presentation"><a href="mycourse.jsp">내 수강 과목</a></li>
                    <li role="presentation"><a href="myqna.jsp">내 QnA</a></li>
                </ul>
            </div>
            <div class="col-sm-10">
                <div class="row">
                    <div class="col-sm-offset-1 col-sm-10">
                        <div class="panel panel-warning">
                            <div class="panel-heading">
                                <label>지난 강의 이어 듣기</label>
                            </div>
                            <div class="panel-body">
                                <div class="col-sm-5">
                                    <img src="../images/cassano.jpg" alt="강의" style="width: 200px"/>
                                </div>
                                <div class="col-sm-7">
                                    <h5>강의 소개</h5>
                                    <p>
                                       해당 강의에 대한 간략한 설명입니다. 
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-offset-1 col-sm-10">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <label>내 수강 목록</label>
                            </div>
                            <table class="table table-hover">
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
                                        <td><a href="">Java</a></td>
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
                                        <td><a href="">Java</a></td>
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
                                        <td><a href="">Java</a></td>
                                        <td>이응수</td>
                                        <td>
                                            <div class="progress">
                                                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuemin="0" aria-valuemin="100" style="width: 90%;">
                                                    <span>90%</span>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><a href="">Java</a></td>
                                        <td>이응수</td>
                                        <td>
                                            <div class="progress">
                                                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuemin="0" aria-valuemin="100" style="width: 0%;">
                                                    <span>0%</span>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>  
                                </tbody>
                            </table>
                            <div class="panel-footer">
                                <p class="text-danger">수강은 최대 10개까지만 가능합니다.</p>
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