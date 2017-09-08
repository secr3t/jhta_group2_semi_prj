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
	<%@ include file="/common/nav.jsp" %>
    <div class="container">
 		<div class="col-sm-offset-2 page-header">
			<h1>학생 상세 정보<small> - 김환희</small></h1>
		</div>
		    
        <div class="col-sm-2">
			<%@ include file="../left-menu.jsp" %>
        </div>
        <div class="col-sm-9">
            
            <div class="row">
                <div class="panel panel-warning">
                    <div class="panel-heading">
                        <label>수강 중인 강의</label>
                    </div>
                    <table class="table table-condensed">
                        <colgroup>
                            <col width="60%">
                            <col width="40%">
                        </colgroup>
                        <thead>
	                         <tr>
	                         	<th>강의명</th><th>진행률</th>
	                         </tr>
                     	</thead>
                     	<tbody>
	                         <tr>
		                         <td><a href="#">Java</a></td>
		                         <td>
		                             <div class="progress">
		                                 <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemin="100" style="width: 20%;">
		                                     <span>20%</span>
		                                 </div>
		                             </div>
		                         </td>
                     		</tr>                        
                         	<tr>
		                         <td><a href="#">Java</a></td>
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
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <label>학생정보</label>
                    </div>
                    <table class="table table-bordered">
                        <tr>
                            <th colspan="4">ID</th><td colspan="8">blewwind70</td>
                        </tr>                        
                        <tr>
							<th colspan="12">관심 수업</th>
                        </tr>                        
                        <tr>
							<td colspan="12">프로그래밍</td>
                        </tr>                        
                        <tr>
                            <th colspan="12">수강 완료 강의 목록</th>
                        </tr>
                        <tr>
                            <td colspan="12">Java</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/common/footer.jsp" %> 
</body>
</html>