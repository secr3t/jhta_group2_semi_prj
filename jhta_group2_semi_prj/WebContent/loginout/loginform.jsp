<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<%@include file="../common/nav.jsp"%>

    <div class="container">
        <div class="row">
            <form method="post" action="">
                <div class="col-sm-offset-4 col-sm-4">
                    <div class="panel panel-info">
                        <div class="panel-heading"><strong>로그인</strong></div>
                        <div class="panel-body">    
                            <div class="form-group">
                                <label>구분</label><br />
                                <input type="radio" name="radio-student" value="student"/> 학생&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" name="radio-lecturer" value="lecturer"/> 강사
                            </div>                   
                            <div class="form-group">
                                <label>아이디</label>
                                <div>
                                    <input type="text" class="form-control" name="user-id" placeholder="이메일을 입력하세요."/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>비밀번호</label>
                                <div>
                                    <input type="text" class="form-control" name="user-pwd" placeholder="비밀번호를 입력하세요."/>
                                </div>
                            </div>
                            <div class="form-group"> 
                                <button class="btn btn-primary pull-right">로그인</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>        
    </div>

</body>
</html>