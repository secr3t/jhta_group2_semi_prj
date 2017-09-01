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

<div class="container">
  <div class="row">
  	    <h1 >FAQ게시판</h1>
  	<h4>
  	<span style="color:#ff0000;"><strong>|</strong>
  	</span> 1:1 질문 답변
  	</h4>
  	    <p><span class="glyphicon glyphicon-ok"></span> 결재/이용 관련 1대1 상담게시판입니다. 문의 사항에 대해 24시간 안에 답변을 드리고 있습니다.(주말 및 공휴일 제외)</p>
  	    <p><span class="glyphicon glyphicon-ok"></span> 자주하는질문을 클릭하여 질문 목록을 확인해 주세요. 10개의 문답에서 80% 이상의 궁금증이 해결될 것입니다. </p>
  	    <p><span class="glyphicon glyphicon-ok"></span> 빠른 답변을 원하시면 고객센터로 문의하여 주시기 바랍니다. </p>
  	<hr>
    </div>
</div>
 <div class="container">
     <div class="row">
         <form class="well" method="post" style="background-color:white; border: 1px solid;" action="addQuest.jsp">
             <div class="form-group">
                 <label>제목</label>
                 <input type="text" class="form-control" name="title" />
             </div>
             <div class="form-group">
                 <label>내용</label>
                 <textarea rows="6" class="form-control" name="contents"></textarea>
             </div>
             <div class="form-group text-right">
                 <a href="질문등록이완료" class="btn btn-warning btn-md">취소</a>
                 <button type="submit" class="btn btn-primary btn-md">완료</button>
             </div>
         </form>
     </div>
 </div>
  


</body>
</html>