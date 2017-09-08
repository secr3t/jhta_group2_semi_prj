<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@include file="../../common/header.jsp" %>
<body>
<%@include file="../../common/nav.jsp" %>
<div class="container">
<style>
input#point {
    background-color: white;
}
</style>
<%
	if(!"S".equals(loginUser.getType().toUpperCase())){
		response.sendError(401);
	}
	Student student = (Student)loginUser;
	
%>
	<div class="row">
		<div class="col-sm-2">
			<h2><a href="/jhta_group2_semi_prj/lecturer/lecturerIndex.jsp">결제</a></h2>
		</div>
		<div class="col-sm-10">
			<%@include file="nav.jsp" %>
			<div class="row">
				<div class="panel panel-default">
					<div class="panel-heading text-center"><strong><%=student.getName() %>님의 결제 페이지</strong></div>
				 	<div class="panel-body text-center">
 			 		<span>현재 포인트 : </span><span><strong id="currentPoint"><%=student.getPoint() %></strong></span>
				 		<span><strong>P</strong></span>
				 		<span>&emsp;&emsp;결제 후 포인트 : </span><span style="color:red;"><strong id="afterPoint"></strong></span>
				 		<span style="color:red;"><strong>P</strong></span>
				 	</div>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-sm-offset-2 col-sm-3">
	         		 <a href="" id="p1000">
	              		<div class="panel panel-primary">
				    		<div class="panel-heading text-center">1000P</div>
				     		<div class="panel-body text-center">포인트</div>
				  		</div>
					</a>
		    	</div>
			    <div class="col-sm-3">
			         <a href="" id="p3000">
			             <div class="panel panel-success">
						    <div class="panel-heading text-center">3000P</div>
						    <div class="panel-body text-center">포인트</div>
						 </div>
			         </a>
			    </div>
			    <div class="col-sm-3">
		          	 <a href="" id="p5000">
		               <div class="panel panel-warning">
					      <div class="panel-heading text-center">5000P</div>
				 	      <div class="panel-body text-center">포인트</div>
				 	   </div>
		          	 </a>
			    </div>
			</div>
			<hr>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-offset-3  col-sm-8">
			<form action="/jhta_group2_semi_prj/payment/paymentController.jsp" class="form-inline" method="get">
				<div class="form-group">
					<label for="point">결제포인트 : </label>
					<input name="paymentpoint" id="point" type="number" min="0" max="100000" class="form-control" value="0" required readonly>Point
				</div>
				<div class="text-right">
					<input type="reset" class="btn btn-danger" value="초기화" id="resetButton">
					<input type="submit" class="btn btn-success" value="결제">
				</div>
			</form>
		</div>
	</div>
</div>
<%@include file="../../common/footer.jsp" %>
</body>
<script type="text/javascript">
(function(){
		document.getElementById("afterPoint").innerText = document.getElementById("currentPoint").innerText;
}());
(function(){
	document.getElementById("p1000").addEventListener("click", function(event){
	      event.preventDefault(); 
	      var prePoint = parseInt(document.getElementById("point").value);
	      if(prePoint < 50000){
	      	prePoint += 1000;
	      	document.getElementById("point").value = prePoint + "";
	      	var currentPoint = document.getElementById("currentPoint").innerText;
	      	document.getElementById("afterPoint").innerText = parseInt(currentPoint)+prePoint+"";
	      }else{
	    	document.getElementById("point").value = prePoint + "";
	      }
	});
}());
(function(){
	document.getElementById("p3000").addEventListener("click", function(event){
	      event.preventDefault(); 
	      var prePoint = parseInt(document.getElementById("point").value);
	      if(prePoint <= 47000){
		      	prePoint += 3000;
		      	document.getElementById("point").value = prePoint + "";
		      	var currentPoint = document.getElementById("currentPoint").innerText;
		      	document.getElementById("afterPoint").innerText = parseInt(currentPoint)+prePoint+"";
		      }else{
		    	document.getElementById("point").value = prePoint + "";
		      }
	});
}());
(function(){
	document.getElementById("p5000").addEventListener("click", function(event){
	      event.preventDefault(); 
	      var prePoint = parseInt(document.getElementById("point").value);
	      if(prePoint <= 45000){
		      	prePoint += 5000;
		    	document.getElementById("point").value = prePoint + "";
		      	var currentPoint = document.getElementById("currentPoint").innerText;
		      	document.getElementById("afterPoint").innerText = parseInt(currentPoint)+prePoint+"";
		      }else{
		    	document.getElementById("point").value = prePoint + "";
		      }
	});
}());

(function(){
	document.getElementById("resetButton").addEventListener("click", function(){
		document.getElementById("afterPoint").innerText = document.getElementById("currentPoint").innerText;
	});
}());
</script>
</html>