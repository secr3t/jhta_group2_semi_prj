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

<div class="container">
	<div class="col-sm-2">
	<%@ include file="../boardbanner/left-menu.jsp" %>
	</div>
	<div class="col-sm-9">
	  <div class="row">
	  	<div class="row">
	  	    <h1 >FAQ게시판</h1>
	  	<h4>
	  	<span style="color:#ff0000;"><strong>|</strong>
	  	</span> QnA 질의
	  	</h4>
	  	<hr>
	    </div>
	  		<div class="panel panel-default">
	  			<table class="table">
	  				<tbody>
	  				<tr>
	  					<th>제목</th>
	  					<td colspan="5">1</td>
	  				</tr>
	  				<tr>
	  					<th>작성자</th>
	  					<td>1</td>
	  					<th>날짜</th>
	  					<td>1</td>
	  				</tr>
	  				<tr>
	  					<td colspan="6">1</td>
	  				</tr> 
	  				</tbody>
	  			</table>
	  			</div>
	  			<%//if(display=="Y"){ %>
  		<div class="panel panel-default">
  			<table class="table">
  				<tbody>
  				<tr>
  					<th><h3>답변</h3></th>
  				</tr>
  				<tr>
  					<th>작성자</th>
  					<td>자바신</td>
  					<th>답변날짜</th>
  					<td>2017.09.02</td>
  				</tr>
  				<tr>
  					<td colspan="6">When you want more—more selection, protection, and power for embedded applications—Java is the choice. Oracle Java Embedded products are designed and optimized to meet the unique requirements of embedded devices, such as microcontrollers, sensors, and gateways. They enable intelligent systems for M2M communications and the Internet of Things so you can do more with your devices.</td>
  				</tr> 
  			</table>
  				<div class="text-right">
	  				<a href="/jhta_group2_semi_prj/board/qnaboard/qna_replay.jsp" class="btn btn-warning btn-sm">답변</a>
	  				<a href="/jhta_group2_semi_prj/board/qnaboard/delete_qna.jsp" class="btn btn-danger btn-sm">삭제</a>
	  				<a href="/jhta_group2_semi_prj/board/qnaboard/qnaboard.jsp" class="btn btn-primary btn-sm">돌아가기</a>
	  			</div>
  				</tbody>
  				
  		</div>  			
  		<%//} %>
	  		</div>
	  </div>
<div class="col-sm-1"></div>
</div>
<%@include file="../../common/footer.jsp"%>
</body>
</html>