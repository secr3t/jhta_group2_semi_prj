<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>게시판 메인</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<%@include file="../common/header.jsp"%>
<body>
    <div class="container">
        <div class="row row-offcanvas row-offcanvas-right">
            <div class="col-xs-12 col-sm-12">
                <div class="jumbotron" style="background-color:white; color: black;">
                    <h1> xx 학원</h1>
                    <p style="">최근 핫글 혹은 학원 설명 혹은 공지사항 봐주세요</p>
                </div>
                <div class="row">
                    <div class="col-xs-6 col-lg-4">
                        <h2 class="well" style="background-color: white; border: 2px solid;">
                        <strong><a href="freeboard.jsp">강의 후기 게시판</a></strong></h2>
                        <table class="table">
                          
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>1</td>
                                    <td>1</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>1</td>
                                    <td>1</td>
                                </tr>
                                   <tr>
                                    <td>1</td>
                                    <td>1</td>
                                    <td>1</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-xs-6 col-lg-4">
                        <h2 class="well" style="background-color: white; border: 2px solid;">
                        	<strong><a href="qnaboard.jsp">강의 질문 답변 게시판</a></strong></h2>
                        <table class="table">
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>1</td>
                                    <td>1</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>1</td>
                                    <td>1</td>
                                </tr>
                                   <tr>
                                    <td>1</td>
                                    <td>1</td>
                                    <td>1</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    
                    <div class="col-xs-6 col-lg-4">
                        <h2 class="well" style="background-color: white; border: 2px solid;">
                        	<strong style="color:#337AB7;">고객센터</strong></h2>
                        <table class="table">
                            <tbody>
                                <tr>
                                    <td><h4><strong>공지 사항</strong></h4></td>
                                </tr>
                                <tr>
                                    <td><h4><strong>자주하는 질문</strong></h4></td>
                                </tr>
                                   <tr>
                                    <td><h4><strong>1:1 문의</strong></h4></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
     <hr>
         <%@include file="../common/footer.jsp"%>

</body>
</html>