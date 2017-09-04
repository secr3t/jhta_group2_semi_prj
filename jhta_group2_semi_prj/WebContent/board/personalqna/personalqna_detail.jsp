<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@include file="../../common/header.jsp"%>
<body>
<%@include file="../../common/nav.jsp" %>
<div class="container">
	<div class="col-sm-3">
<%@ include file="../boardbanner/left-menu.jsp" %>
	</div>
	<div class="col-sm-9">
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
  					<th><h3>질문</h3></th>
  				</tr>
  				<tr>
  					<th>제목</th>
  					<td colspan="5">자바신이 되려면 무엇을 해야되나요?</td>
  				</tr>
  				<tr>
  					<th>작성자</th>
  					<td>개똥이</td>
  					<th>날짜</th>
  					<td>2017.09.02</td>
  				</tr>
  				<tr>
  					<td colspan="6">자바의 신이 되고 싶어요. 하지만 무엇을 해야될지 모르겠어요. 도와주세요 자바신!!</td>
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
	  				<a href="/jhta_group2_semi_prj/board/personalqna/personalqna_replywrite.jsp" class="btn btn-warning btn-sm">답변</a>
	  				<a href="/jhta_group2_semi_prj/board/personalqna/delete_personalqna.jsp" class="btn btn-danger btn-sm">삭제</a>
	  				<a href="/jhta_group2_semi_prj/board/afterlecture/afterlecture.jsp" class="btn btn-primary btn-sm">돌아가기</a>
	  			</div>
  				</tbody>
  		</div>  			
  		<%//} %>
  </div>
</div>
</div>
<%@include file="../../common/footer.jsp" %>
</body>
</html>