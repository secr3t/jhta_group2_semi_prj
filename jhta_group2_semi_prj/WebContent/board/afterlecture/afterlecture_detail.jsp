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
	<%@include file="/template/left-menu.jsp" %>
	</div>
	<div class="col-sm-9">
	  <div class="row">
	  	<div class="content-header">
	        <div class="crumb">
	  	        <h1 class="well" style="background-color: #337AB7; color:white;"><span class="glyphicon glyphicon-th-list"></span> 
	  	        <strong>강의 후기 게시판</strong></h1>
	        </div>
	    </div>
	  		<div class="panel panel-default">
	  			<table class="table">
	  				<tbody>
	  				<tr>
	  					<th>제목</th>
	  					<td colspan="5">1</td>
	  					<th>평점</th>
	  					<td colspan="2">1</td>
	  				</tr>
	  				<tr>
	  					<th>작성자</th>
	  					<td>1</td>
	  					<th>날짜</th>
	  					<td>1</td>
	  					<th>추천수</th>
	  					<td>0</td>
	  				</tr>
	  				<tr>
	  					<td colspan="6">1</td>
	  				</tr> 
	  				</tbody>
	  			</table>
	  			<div class="text-right">
	  				<a href="/jhta_group2_semi_prj/board/afterlecture/delete_afterlecture.jsp" class="btn btn-danger btn-md">삭제</a>
	  				<a href="/jhta_group2_semi_prj/board/afterlecture/afterlecture.jsp" class="btn btn-primary btn-md">돌아가기</a>
	  			</div>
	  		</div>
	  </div>
  </div>
  <div class="col-sm-1"></div>
</div>
<%@include file="../../common/footer.jsp"%>

</body>
</html>