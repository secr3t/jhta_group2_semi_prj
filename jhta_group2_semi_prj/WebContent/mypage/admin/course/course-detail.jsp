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
	<%@ include file="/mypage/admin/logincheck.jsp" %>
	<%@ include file="/common/nav.jsp" %>
    <div class="container">
 
 		<div class="col-sm-offset-2 page-header">
			<h1>강의 상세 정보 <small>- Java</small></h1>
			<div class="row text-right">
	     		<a href="#" class="btn btn-md btn-info active">공개</a>
	     		<a href="#" class="btn btn-md btn-danger">비공개</a>
	      	</div>
		</div>
		
        <div class="col-sm-2">
			<%@ include file="../left-menu.jsp" %>
        </div>
        <div class="col-sm-9">

          <div class="row">
              <div class="panel panel-warning">
                  <div class="panel-heading">
                      <label>수강 중인 학생 <span class="badge">20</span></label>
                  </div>
                  <table class="table table-condensed">
                  		<colgroup>
                        	<col width="60%">
                          	<col width="40%">
                      	</colgroup>
                      	<thead>
                       		<tr>
                       			<th>학생명</th><th>진행률</th>
                       		</tr>
                   		</thead>
                   		<tbody>
                       		<tr>
                       			<td><a href="student-detail.jsp?no=1">김환희</a></td>
                       			<td>
                           			<div class="progress">
                               			<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemin="100" style="width: 20%;">
                                   			<span>20%</span>
                               			</div>
                           			</div>
                       			</td>
                   			</tr>
            			</tbody>                        
                  </table>
              </div>
          </div>
            
          <div class="row">
              <div class="panel panel-info">
                  <div class="panel-heading">
                      <label>전체 수업 목록 <span class="badge">10</span></label>
                  </div>
                  <table class="table table-condensed">
                  		<colgroup>
                        	<col width="30%">
                        	<col width="40%">
                          	<col width="30%">
                      	</colgroup>
                      	<thead>
                       		<tr>
                       			<th>NO</th><th>수업명</th><th>수업공개여부</th>
                       		</tr>
                   		</thead>
                   		<tbody>
                       		<tr>
                       			<td>1</td>
                       			<td><a href="lecture-detail.jsp?no=1">Java란 무엇인가?</a></td>
                       			<td>
                        			Y
                        
                        			<div class="pull-right">
                        				<a href="#"><span class="text-primary glyphicon glyphicon-ok-sign"></span></a>
                        				<a href="#"><span class="text-danger glyphicon glyphicon-remove-sign"></span></a>
                        			</div>		                           
                       			</td>
                   			</tr>
            			</tbody>                        
                  </table>
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
    <%@ include file="/common/footer.jsp" %> 
</body>
</html>