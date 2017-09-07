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
<% pageContext.setAttribute("cp", "login"); %>
<%@include file="../common/nav.jsp"%>

	<%
		if (request.getParameter("fail") != null) {
	%>
			<div class="alert alert-danger">
				<strong>오류</strong> 이메일 혹은 비밀번호가 올바르지 않습니다.
			</div>
	<%		
		}
	%>
	
	<%
		if (request.getParameter("deny") != null) {
	%>
		<div class="alert alert-danger">
			<strong>오류</strong> 로그인이 필요한 서비스입니다.
		</div>
	<%		
		}
	%>
	
	<%
		String returnUrl = request.getParameter("returnUrl");
	%>
    <div class="container">
        <div class="row">
            <form method="post" action="login.jsp">
            <%
            	if (returnUrl != null) {
            %>		
            		<input type="hidden" name="returnUrl" value="<%=returnUrl%>">
            <%	
            	} 
            %>
                <div class="col-xs-offset-4 col-xs-4">
                    <div class="panel panel-info">
                        <div class="panel-heading"><strong>로그인</strong></div>
                        <div class="panel-body">    
                            <div class="form-group">
                                <label>구분</label><br />
                                <input type="radio" name="div-user" value="student"/><span>학생</span>
                                <input type="radio" name="div-user" value="lecturer" class="pull-right"/><span class="pull-right">강사</span>
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