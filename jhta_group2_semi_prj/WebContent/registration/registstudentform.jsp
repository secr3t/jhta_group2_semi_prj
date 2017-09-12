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
    	<%
			final String FAIL_CODE_DUP_ID = "1";
			final String FAIL_CODE_SHORT_PWD = "2";
			
			String failCode = request.getParameter("fail");
		%>
		
		<%	if (FAIL_CODE_DUP_ID.equals(failCode)) {%>
			<div class="alert alert-danger">
				<strong>오류</strong> 이미 사용중인 아이디입니다.
			</div>
		<%	}%>
		
		<%	if (FAIL_CODE_SHORT_PWD.equals(failCode)) {%>
			<div class="alert alert-danger">
				<strong>오류</strong> 비밀번호는 8글자 이상 입력하시기 바랍니다.
			</div>
		<%	}%>
    	
        <div class="row">
            <form method="post" action="registstudent.jsp">
                <div class="col-sm-offset-4 col-sm-5">
                    <div class="panel panel-info">
                        <div class="panel-heading"><strong>회원가입</strong></div>
                        <div class="panel-body">
                            <div class="form-group">
                                <label>이름</label>
                                <div>
                                    <input type="text" class="form-control" name="user-name" placeholder="이름을 입력하세요."/>
                                </div>
                            </div>                       
                            <div class="form-group">
                                <label>아이디</label>
                                <div>
                                    <input type="text" class="form-control" name="user-email" placeholder="이메일을 입력하세요."/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>비밀번호</label>
                                <div>
                                    <input type="password" class="form-control" name="user-pwd" placeholder="비밀번호를 입력하세요."/>
                                </div>
                            </div>
                             <div class="form-group">
                                <label>연락처</label>
                                <div>
                                    <input type="text" class="form-control" name="user-phone" placeholder="연락처를 입력하세요."/>
                                </div>
                            </div>
                            <div class="form-group"> 
                                <button class="btn btn-primary pull-right">가입</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>        
    </div>

</body>
</html>