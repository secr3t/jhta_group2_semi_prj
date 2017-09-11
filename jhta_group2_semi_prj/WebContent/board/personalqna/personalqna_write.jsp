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


<div class="container">
	<div class="col-sm-2">
	<%@ include file="../boardbanner/left-menu.jsp" %>
	</div>
	<div class="col-sm-9">
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
	
	     <div class="row">
	         <form class="form-horizontal" method="post" id="submit" action="/jhta_group2_semi_prj/board/personalqna/add_personalqna.jsp">
				<div class="form-group">
					<label class="col-sm-1 control-label">제목</label>
					<div class="col-sm-7">
						<input type="text" class="form-control" name="title" id="titletext"/>
					</div>
					<div class="col-sm-2 control-label"><strong>질문 타입</strong></div>
						<select class="form-control col-sm-3" style="width:100px;" name="questiontype" id="qtype">
						  <option value="결제">결제</option>
						  <option value="이용">이용</option>
						</select>
					</div>
				
				<div class="form-group">
					<label class="col-sm-1 control-label">내용</label>
					<div class="col-sm-11">
						<textarea rows="6" class="form-control " name="contents"></textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-1 col-sm-11 text-right">
						<a href="" class="btn btn-warning btn-md">취소</a>
						<button type="submit" id="complete" class="btn btn-primary btn-md">완료</button>
					</div>
				</div>
			</form>
 		</div>
 	</div>
<div class="col-sm-1"></div>
</div>
<%@include file="../../common/footer.jsp"%>

</body>
<script type="text/javascript">
	document.getElementById('complete').addEventListener ('click', function(event) {
		event.preventDefault();
		var qtype = document.getElementById('qtype').value;
		var titletext = document.getElementById('titletext');
		titletext.value = '['+qtype+']' + titletext.value;
		
		document.getElementById('submit').submit();
		
		
	});
</script>
</html>