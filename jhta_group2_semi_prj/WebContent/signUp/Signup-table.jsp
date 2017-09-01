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
<%@include file="../template/left-menu.jsp" %>
	<div class="container">
		<div class="book-table">
			<div class="panel-default">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="#">Menu 1</a></li>
					<li><a href="#">Menu 2</a></li>
					<li><a href="#">Menu 3</a></li>
				</ul>
			</div>
			<table id="Dept-list" class="table table-hover table-condensed">
				<thead>
					<tr>
						<th>No</th>
						<th>과목명</th>
						<th>소개</th>
						<th>교수이름</th>
					</tr>
				</thead>
				<tbody>
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

		<table id="selected-list">
			<thead>

			</thead>
		</table>
	</div>
	<%@include file="../common/footer.jsp" %>
</body>
</html>