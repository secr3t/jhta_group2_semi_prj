<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<%@include file="../../common/header.jsp"%>
<body>
<%@include file="../../common/nav.jsp"%>
<%@include file="../../common/loginCheck.jsp"%>

	<div class="content-primary">
		<div class="container">
			<div class="col-sm-2">
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
								<div class="col-sm-5">
									<input type="text" class="form-control" name="title" id="alerttypetext" />
								</div>
									<div class="col-sm-1 control-label">
										<strong>공지 타입</strong>
									</div>
									<select class="form-control col-sm-3 control-label" style="width: 100px;" name="type" id="alerttype">
										<option value="1">필독</option>
										<option value="2">일반</option>
										<option value="3">이벤트</option>
									</select>
								</div>
							<div class="form-group">
								<label class="col-sm-1 control-label">내용</label>
								<div class="col-sm-8">
									<textarea rows="6" class="form-control " name="contents"></textarea>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-1 col-sm-8 text-right">
									<a href="/jhta_group2_semi_prj/board/alertboard/alertboard.jsp" class="btn btn-warning btn-md">취소</a>
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
</html>