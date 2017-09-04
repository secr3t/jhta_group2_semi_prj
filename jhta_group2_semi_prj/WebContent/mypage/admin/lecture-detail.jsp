<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Detail</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
		.glyphicon {
		    font-size: 20px;
		}
		.table-hover {
		    table-layout: fixed;
		}
		.table-hover td {
		    white-space: nowrap;
		    overflow-x: hidden;
		    text-overflow: ellipsis;
		}
  </style>
</head>
<body>
	<%@ include file="../../common/nav.jsp" %>
    <div class="container-fluid">
        <h1>Detail <small>- Lecture</small></h1>
        <hr/>
        <div class="row">
        	<div class="col-sm-2">
				<%@ include file="left-menu.jsp" %>
			</div>         
            <div class="col-sm-10">
                <h2 class="sub-header">영상 상세 정보</h2>
                <hr/>
                
               <div class="col-sm-9">
               		<table class="table">
               			<colgroup>
               				<col width="20%">
               				<col width="80%">
               			</colgroup>
               			<tr>
               				<th>강의 제목</th><td>Java란 무엇인가?</td>
               			</tr>
               			<tr>
               				<th>강의 링크 주소</th><td><a href="#">www.naver.com</a></td>
               			</tr>
               			<tr>
               				<th>첨부파일</th><td><a href="#">java.jpg</a></td>
               			</tr>
               			<tr>
               				<th colspan="12">수업에 대한 소개</th>
               			</tr>
               			<tr>
               				<th></th>
               				<td>
               					수업에 대한 간단한 소개입니다.ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ
	               				ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ
	               			</td>
               			</tr>
               		</table>
               </div>		
               <div class="row text-right">
               		<div class="col-sm-10">
                   		<a href="#" class="btn btn-primary">허용</a>
                   		<a href="#" class="btn btn-danger">거절</a>
                   	</div>
               </div>
            </div>
        </div>
    </div>
    <%@ include file="../../common/footer.jsp" %>
</body>
</html>