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
<%@ include file="../boardbanner/left-menu.jsp" %>
<div class="container">
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
  			<div class="text-right">
  				<a href="/jhta_group2_semi_prj/board/personalqna/delete_personalqna.jsp" class="btn btn-danger btn-md">삭제</a>
  				<a href="/jhta_group2_semi_prj/board/afterlecture/afterlecture.jsp" class="btn btn-primary btn-md">돌아가기</a>
  			</div>
  		</div>
  </div>
</div>

</body>
</html>