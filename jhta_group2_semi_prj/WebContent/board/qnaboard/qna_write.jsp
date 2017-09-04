<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Bootstrap Example</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<%@include file="../../common/header.jsp"%>
<body>
<%@include file="../../common/nav.jsp"%>

<div class="content-primary">
<div class="container">
	<div class="col-sm-2">
	<%@ include file="../boardbanner/left-menu.jsp" %>
	</div>
	<div class="col-sm-9">
	  <div class="row">
	    <div class="content-header">
	        <div class="crumb">
	  	        <h1 >강의 후기 게시판</h1>
	  			<h4>
	  			<span style="color:red;"><strong>|</strong>
	  			</span>	강의 후기 쓰기
	  			</h4>
	        </div>
	    </div>
	  	    <hr>
				<div class="container">
					<div class="row">
						<form class="form-horizontal" method="post" action="/jhta_group2_semi_prj/board/alertboard/add_alert.jsp">
							<div class="form-group">
								<label class="col-sm-1 control-label">제목</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" name="title" />
								</div>
								<div class="col-sm-4">
									<input type="hidden" class="form-control"/>
								</div>
								</div>
							
							<div class="form-group">
								<label class="col-sm-1 control-label">내용</label>
								<div class="col-sm-11 control-label">
									<textarea rows="6" class="form-control " name="contents"></textarea>
								</div>
							</div>
							<div class="form-group">
									<div class="col-sm-offset-1 col-sm-11 text-right">
										<a href="" class="btn btn-warning btn-md">취소</a>
										<button type="submit" class="btn btn-primary btn-md">완료</button>
									</div>
								</div>
							
						</form>
					</div>
				</div>
		</div>
	</div>
</div>
  
</div>

</body>
</html>