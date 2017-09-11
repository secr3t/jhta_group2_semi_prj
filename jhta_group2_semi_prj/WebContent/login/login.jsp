<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@include file="/common/header.jsp" %>
<body>

<%@include file="../common/nav.jsp"%>
<div class="container">
		<div class="col-sm-2">
		</div>
		<div class="col-sm-9">
			<%@include file="body.jsp"%>
		</div>
	<div class="col-sm-1"></div>
	</div>
	<%@include file="../common/footer.jsp"%>
</body>
<script>
$$$('#login-btn').addEventListener('click', function(event){
	event.preventDefault();
	if( !$$$('#login-student').checked && !$$$('#login-lecturer').checked && 
			!$$$('input[name="user-id"]').value || !$$$('input[name="user-pwd"]').value){
		alert('선택하지 않았거나 입력하지 않은곳이 존재합니다. 모두 입력해주세요.');
	} else {
		$$$('#login-form').submit();
	}
});

</script>
</html>