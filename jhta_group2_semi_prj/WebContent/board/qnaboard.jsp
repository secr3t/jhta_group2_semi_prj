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
<body>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="#">Page 1</a></li>
      <li><a href="#">Page 2</a></li>
      <li><a href="#">Page 3</a></li>
    </ul>
  </div>
</nav>
<div class="content-primary">
<div class="container">
  <div class="row">
    <div class="content-header">
        <div class="crumb">
  	        <h1 class="well" style="background-color: #337AB7; color:white;"><span class="glyphicon glyphicon-th-list"></span> <strong>QnA게시판</strong></h1>
        </div>
    </div>
  	    <hr>
		<div class="panel panel-default">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>날짜</th>
						<th>추천수</th>
					</tr>
				</thead>
				<tbody>
				    <tr>
				       <th>1</th>
						<th>1</th>
						<th>1</th>
						<th>1</th>
						<th>1</th> 
				    </tr>
				    <tr>
				       <th>1</th>
						<th>1</th>
						<th>1</th>
						<th>1</th>
						<th>1</th> 
				    </tr>
				    <tr>
				       <th>1</th>
						<th>1</th>
						<th>1</th>
						<th>1</th>
						<th>1</th> 
				    </tr>
				</tbody>
				
			</table>
			<div class="panel-body text-center">
				<ul class="pagination">
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
				</ul>
				<a href="write.jsp" class="btn btn-primary btn-md pull-right">글쓰기</a>
			</div>
		</div>
	</div>
</div>
  
</div>

</body>
</html>