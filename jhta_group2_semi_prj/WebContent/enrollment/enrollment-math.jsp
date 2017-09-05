<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@include file="../common/header.jsp" %>
<body>
<%@include file="../common/nav.jsp" %>
<!--  왼쪽 메뉴 부분은 상의하여 각 페이지마다 메뉴를 불러올 것인지 각 페이지의
 left-menu.jsp를 만들어서 사용할 것인지 논의가 필요함.(사실 상 mypage 부분을 제외하고는 거의 겹친다고 보면됨.)
 -->
	<div class="container">
		<div class="book-table">
			<div class="panel-default">
				<ul class="nav nav-tabs">
					<li><a href="enrollment-table.jsp">전체</a></li>
					<li><a href="enrollment-kor.jsp">국어</a></li>
					<li><a href="enrollment-eng.jsp">영어</a></li>
					<li class="active"><a href="enrollment-math.jsp">수학</a></li>
					<li><a href="enrollment-sci.jsp">과학</a></li>
				</ul>
			</div>
			<div id="Dept-list">
				 
				<table class="table table-hover table-condensed">
					<thead>
						<tr>
							<th >No</th>
							<th>과목명</th>
							<th>소개</th>
							<th>교수이름</th>
						</tr>
					</thead>
					<tbody id="getTable">
						<tr>
							<td>1</td>
							<td>영어</td>
							<td><a href="">링크</a></td>
							<td>이광수</td>
						</tr>
						<tr>
							<td>2</td>
							<td>수학</td>
							<td><a href="">링크</a></td>
							<td>김수학</td>
						</tr>
						<tr>
							<td>3</td>
							<td>국어</td>
							<td><a href="">링크</a></td>
							<td>한지리</td>
						</tr>
						<tr>
							<td>3</td>
							<td>국어</td>
							<td><a href="">링크</a></td>
							<td>한지리</td>
						</tr>
						<tr>
							<td>3</td>
							<td>국어</td>
							<td><a href="">링크</a></td>
							<td>한지리</td>
						</tr>
						<tr>
							<td>3</td>
							<td>국어</td>
							<td><a href="">링크</a></td>
							<td>한지리</td>
						</tr>
						<tr>
							<td>3</td>
							<td>국어</td>
							<td><a href="">링크</a></td>
							<td>한지리</td>
						</tr>
						<tr>
							<td>3</td>
							<td>국어</td>
							<td><a href="">링크</a></td>
							<td>한지리</td>
						</tr>
						<tr>
							<td>3</td>
							<td>국어</td>
							<td><a href="">링크</a></td>
							<td>한지리</td>
						</tr>
						<tr>
							<td>3</td>
							<td>국어</td>
							<td><a href="">링크</a></td>
							<td>한지리</td>
						</tr>
						<tr>
							<td>3</td>
							<td>국어</td>
							<td><a href="">링크</a></td>
							<td>한지리</td>
						</tr>
						<tr>
							<td>3</td>
							<td>국어</td>
							<td><a href="">링크</a></td>
							<td>한지리</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<br><br />
		<!-- <p>
		<button id= "btn-down">down</button>
		<button id= "btn-up">up</button>
		</p> -->
		<div align="center">
		<button type="button" class="btn btn-default" aria-label="">
  		<span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
		</button>
		</div>
		
		<br><br />
		<div class="book-table">
		<div id="selected-list">
				<table class="table table-hover table-condensed">
					<thead>
						<tr>
							<th>No</th>
							<th>과목명</th>
							<th>소개</th>
							<th>교수이름</th>
						</tr>
					</thead>
					<tbody id="getTable-2">
						
					</tbody>
				</table>
		</div>
		</div>
	<div class= "text-right">
		<ul class="well">
			<li>예상포인트</li>
			<li>현재포인트</li>
			<li>수강과목수</li>
			
		</ul>
	</div>
	<%@include file="../common/footer.jsp" %>
	</div>
</body>
<script type="text/javascript">
(function(){	
	var trNodeList = document.querySelectorAll("#getTable>tr");
	var getTable2 = document.getElementById("getTable-2");
	var getTable = document.getElementById("getTable");

	for(var i=0; i<trNodeList.length; i++){
		var tr = trNodeList.item(i);
		 tr.addEventListener('click', function(event){
			var self = event.target;
				if(self.parentNode.parentNode == getTable && getTable2.getElementsByTagName('tr').length<10){
				getTable2.append(self.parentNode);
				} else if(self.parentNode.parentNode == getTable2){
					getTable.append(self.parentNode);
				}
				
		})
	};
	
	
		/*  tr.addEventListener('click', function(event){
			var self = event.target;
				if(getTable2.getElementsByTagName('tr').length<10){
				getTable2.append(self.parentNode);
				}
		}) */
	

	
}())
</script>
</html>