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
                <ul class="nav nav-pills nav-stacked">
                    <li role="presentation"><a href="index.jsp">My Page 홈</a></li>
                    <li role="presentation"><a href="#">내 정보</a></li>
                    <li role="presentation"><a href="mycourse.jsp">내 강의 과목</a></li>
                    <li role="presentation"><a href="#">새 강의 신청</a></li>
                    <li role="presentation"><a href="myqna.jsp">등록된 QnA</a></li>
                </ul>
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
                                    <th>잔여 포인트</th><td>500P</td>
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
                                <label>내 강의 목록</label>
                                <a href="#" class="pull-right">목록으로</a>
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
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="panel panel-warning">
                            <div class="panel-heading">
                                <label>미답변 질문</label>
                                <a href="#" class="pull-right">목록으로</a>
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
                                            <td><a href="#">Java</a></td>
                                            <td>17/08/21</td>
                                        </tr>                               
                                        <tr>
                                            <td><a href="#">Java가 무엇입니까?dddddddddddd</a></td>
                                            <td><a href="#">Java</a></td>
                                            <td>17/08/21</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">Java가 무엇입니까?dddddddddddd</a></td>
                                            <td><a href="#">Java</a></td>
                                            <td>17/08/21</td>
                                        </tr>                
                                        <tr>
                                            <td><a href="#">Java가 무엇입니까?dddddddddddd</a></td>
                                            <td><a href="#">Java</a></td>
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