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
<%@include file="../../common/nav.jsp" %>
<div class="container">
	<div class="col-sm-3">
<%@ include file="../boardbanner/left-menu.jsp" %>
	</div>
	<div class="col-sm-9">
  <div class="row">
  	<div class="row">
  	    <h1 >FAQ게시판</h1>
  	<h4>
  	<span style="color:#ff0000;"><strong>|</strong>
  	</span> 1:1 문의
  	</h4>
  	<hr>
    </div>
  		<div class="panel panel-default">
  			<table class="table">
  				<tbody>
  				<tr>
  					<th><h3>질문</h3></th>
  				</tr>
  				<tr>
  					<th>제목</th>
  					<td colspan="5">자바신이 되려면 무엇을 해야되나요?</td>
  				</tr>
  				<tr>
  					<th>작성자</th>
  					<td>개똥이</td>
  					<th>날짜</th>
  					<td>2017.09.02</td>
  				</tr>
  				<tr>
  					<td colspan="6">우옭옭옭옥!</td>
  				</tr> 
  				</tbody>
  			</table>
  		</div>
  		<form class="form-horizontal" method="post" action="">
  			<label class="control-label">답변내용</label>
  			<textarea rows="6" class="form-control"></textarea>
  			<div class="text-right">
  				<a href="" class="btn btn-warning btn-md">답변</a>
  				<a href="/jhta_group2_semi_prj/board/qnaboard/qna_detail.jsp" class="btn btn-primary btn-md">돌아가기</a>
  			</div>
  		</form>
  </div>
</div>
<div class="col-sm-1"></div>
</div>
<%@include file="../../common/footer.jsp"%>
</body>
</html>