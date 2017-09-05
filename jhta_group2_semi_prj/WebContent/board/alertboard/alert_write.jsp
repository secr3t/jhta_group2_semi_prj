<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<%@include file="../../common/header.jsp"%>
<body>
<%@include file="../../common/nav.jsp"%>


	<div class="content-primary">
		<div class="container">
			<div class="col-sm-offset-2 col-sm-2">
				<%@ include file="../boardbanner/left-menu.jsp"%>
			</div>
			<div class="col-sm-8">
				<div class="row">
					<div class="content-header">
						<div class="crumb">
							<h1>공지 사항 게시</h1>
							<h4>
								<span style="color: red;"><strong>|</strong> </span> 공지 사항 쓰기
							</h4>
						</div>
					</div>
					<hr>
					<div class="container">
						<div class="row">
							<form class="form-horizontal" id="submit" method="post" action="add_alert.jsp">
								<div class="form-group">
								<label class="col-sm-1 control-label">제목</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" name="title" id="alerttypetext" />
								</div>
								</div>
								<div class="form-group">
									<div class="col-sm-1 control-label">
										<strong>공지 타입</strong>
									</div>
									<select class="form-control col-sm-3" style="width: 100px;" name="type" id="alerttype">
										<option>필독</option>
										<option>일반</option>
										<option>이벤트</option>
									</select>
								</div>
							<div class="form-group">
								<label class="col-sm-1 control-label">내용</label>
								<div class="col-sm-10">
									<textarea rows="6" class="form-control " name="contents"></textarea>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-1 col-sm-9 text-right">
									<a href="" class="btn btn-warning btn-md">취소</a>
									<button type="submit" class="btn btn-primary btn-md" id="complete">완료</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-sm-1"></div>
	</div>
	<%@include file="../../common/footer.jsp"%>
</body>
<script type="text/javascript">
	document.getElementById('complete').addEventListener('click', function(event) {
		event.preventDefault();
		var alerttypevalue = document.getElementById('alerttype').value;
		var alerttypetext = document.getElementById('alerttypetext');
		alerttypetext.value = '[' + alerttypevalue + ']'+ alerttypetext.value;
		console.log(alerttypetext.value);
		document.getElementById("submit").submit();
				});
</script>
</html>