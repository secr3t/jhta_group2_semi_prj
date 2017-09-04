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
</head>
<body>
	<%@ include file="../../common/nav.jsp" %>
    <div class="container-fluid">
        <h1>Detail <small>- Course</small></h1>
        <hr/>
        <div class="row">
            <div class="col-sm-2">
				<%@ include file="left-menu.jsp" %>
            </div>
            <div class="col-sm-9">
                <h2 class="sub-header">Java</h2>
                
		        <div class="row text-right">
	        		<a href="#" class="btn btn-md btn-primary">강의 페이지로 이동</a>
		        </div>
                <hr/>
                
                
                <div class="row">
                    <div class="panel panel-warning">
                        <div class="panel-heading">
                            <label>진행률</label>
                        </div>
                        <div class="panel-body">
							<div class="progress">
							    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemin="100" style="width: 20%;">
							    	<span>20%</span>
							    </div>
							</div>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <label>강의정보</label>
                        </div>
                        <table class="table table-bordered">
                        	<colgroup>
                        		<col width="20%">
                        		<col width="30%">
                        		<col width="20%">
                        		<col width="30%">
                        	</colgroup>                        
                            <tr>
								<th>강의 분류</th><td>프로그래밍</td>
                                <th>수강 완료 강의 목록</th><td>Java</td>
                            </tr>                        
                            <tr>
								<th>강의 평점</th><td><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star-empty"></span></td>
                                <th>등록된 강의 수</th><td>10개</td>
                            </tr>
                            <tr>
                                <th colspan="12">강의 소개</th>
                            </tr>
                            <tr>
                                <td colspan="12">간단한 강의 소개입니다.</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../../common/footer.jsp" %> 
</body>
</html>