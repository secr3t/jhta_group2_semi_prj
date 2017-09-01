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
  <style>
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
        <h1>My Q&amp;A</h1>
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
                </div>
                <div class="row">
                    <div class="col-sm-offset-1 col-sm-10">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <label>내 Q&amp;A</label>
                            </div>
                            <table class="table table-hover">
                                <colgroup>
                                    <col width="40%">
                                    <col width="20%">
                                    <col width="10%">
                                    <col width="10%">
                                </colgroup>                                   
                                <thead>
                                    <tr>
                                        <th>제목</th><th>강의명</th><th>강사</th><th>게시일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><a href="#">Java가 무엇입니까?dddddddddddd</a></td>
                                        <td><a href="#">Java</a></td>
                                        <td>이응수</td>
                                        <td>17/08/21</td>
                                    </tr>                               
                                    <tr>
                                        <td><a href="#">Java가 무엇입니까?dddddddddddd</a></td>
                                        <td><a href="#">Java</a></td>
                                        <td>이응수</td>
                                        <td>17/08/21</td>
                                    </tr>
                                    <tr>
                                        <td><a href="#">Java가 무엇입니까?dddddddddddd</a></td>
                                        <td><a href="#">Java</a></td>
                                        <td>이응수</td>
                                        <td>17/08/21</td>
                                    </tr>                
                                    <tr>
                                        <td><a href="#">Java가 무엇입니까?dddddddddddd</a></td>
                                        <td><a href="#">Java</a></td>
                                        <td>이응수</td>
                                        <td>17/08/21</td>
                                    </tr>                      
                                    <tr>
                                        <td><a href="#">Java가 무엇입니까?dddddddddddd</a></td>
                                        <td><a href="#">Java</a></td>
                                        <td>이응수</td>
                                        <td>17/08/21</td>
                                    </tr>
                                </tbody>
                            </table>
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