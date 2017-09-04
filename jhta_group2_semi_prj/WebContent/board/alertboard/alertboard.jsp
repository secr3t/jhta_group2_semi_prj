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
<%@include file="../../common/nav.jsp"%>
<%@ include file="../boardbanner/left-menu.jsp" %>s

<div class="container">
  <div class="page-header">
  	<h1 >FAQ게시판</h1>
  	<h4>
  	<span style="color:red;"><strong>|</strong>
  	</span> 공지사항
  	</h4>
  	<hr>
		<div class="panel-group col-md-8">
		    <div class="panel">
		        <div class="panel-heading input-lg" style="border: 2px solid silver;" >
		            <h4 class="panel-title">
		                <a href="#" class="" style="color: red;">[채용공고] 공부의 신 마케팅 신입사원 모집</a>
		            </h4>
		        </div>
            </div>
		    <div class="panel">
		        <div class="panel-heading input-lg" style="border: 2px solid silver;">
		            <h4 class="panel-title">
		                <a href="#" class="collapsed" style="color: red;">★공신닷컴이 카카오톡 채널탭에 입점하였습니다★</a>
		            </h4>
		        </div>
		    </div>
		    <div class="panel">
		        <div class="panel-heading input-lg" style="border: 2px solid silver;">
		            <h4 class="panel-title">
		                <a href="#" class="collapsed" style="color: royalblue;">[필독] 학습 보증금 제도 및 홈페이지 개편 공지_2016.09.22 수정</a>
		            </h4>
		        </div>
		    </div>
		    	<div class="text-right">
		    		<a href="" class="btn btn-primary btn-md">글쓰기</a>
		    	</div>
		    
		</div>
	</div>
</div>
  


</body>
</html>