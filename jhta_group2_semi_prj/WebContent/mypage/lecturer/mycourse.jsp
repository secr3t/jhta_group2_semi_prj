<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>My Course</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
                    <li role="presentation"><a href="mycourse.jsp">내 강의 과목</a></li>
                    <li role="presentation"><a href="#">새 강의 신청</a></li>
                    <li role="presentation"><a href="myqna.jsp">등록된 QnA</a></li>
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
                              <table class="table table-condensed table-hover">
                                <colgroup>
                                    <col width="30%">
                                    <col width="20%">
                                    <col width="20%">
                                    <col width="30%">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>강의명</th><th>강의 수</th><th>학생 수</th><th>강의 평점</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><a href="#">Java</a></td>
                                        <td>10</td>
                                        <td>20</td>
                                        <td><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star-empty"></span></td>
                                    </tr>                                      
                                    <tr>
                                        <td><a href="#">Java</a></td>
                                        <td>10</td>
                                        <td>20</td>
                                        <td><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star-empty"></span></td>
                                    </tr>                                      
                                    <tr>
                                        <td><a href="#">Java</a></td>
                                        <td>10</td>
                                        <td>20</td>
                                        <td><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star-empty"></span></td>
                                    </tr>                                      
                                    <tr>
                                        <td><a href="#">Java</a></td>
                                        <td>10</td>
                                        <td>20</td>
                                        <td><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star-empty"></span></td>
                                    </tr>                                      
                                    <tr>
                                        <td><a href="#">Java</a></td>
                                        <td>10</td>
                                        <td>20</td>
                                        <td><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star-empty"></span></td>
                                    </tr>                                    
                                </tbody>
                            </table>
                            <div class="panel-body">
                                <p class="text-right"><a href="#" class="btn btn-primary">새 강의 신청</a></p>
                            </div>
                            <div class="panel-footer">
                                <div class="text-center">
                                    <ul class="pagination pagination-sm">
                                        <li><a href="#"><span class="glyphicon glyphicon-backward"></span></a></li>
                                        <li><a href="#"><span class="glyphicon glyphicon-triangle-left"></span></a></li>
                                        <li><a href="#">1</a></li>
                                        <li><a href="#">2</a></li>
                                        <li><a href="#">3</a></li>
                                        <li><a href="#">4</a></li>
                                        <li><a href="#">5</a></li>
                                        <li><a href="#"><span class="glyphicon glyphicon-triangle-right"></span></a></li>
                                        <li><a href="#"><span class="glyphicon glyphicon-forward"></span></a></li>
                                    </ul>
                                </div>
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