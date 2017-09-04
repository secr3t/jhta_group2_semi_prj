<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Student Manager</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<%@ include file="../../common/nav.jsp" %>
	<div class="container">
 		<div class="col-sm-offset-2 page-header">
			<h1>학생 관리</h1>
		</div>
			
		<div class="col-sm-2">
			<%@ include file="left-menu.jsp" %>
		</div>
		<div class="col-sm-9">
               <div class="row">
               	<div class="col-sm-3">
               		<label>정렬 :</label>
               		<button><span class="glyphicon glyphicon-sort-by-alphabet"></span></button>
               		<button><span class="glyphicon glyphicon-sort-by-alphabet-alt"></span></button>
               	</div>
               	<div class="col-sm-7 pull-right">
	                <form method="post" action="#" class="form-inline text-right">
	            		<div class="form-group">
	                        <label class="sr-only">검색분류</label>
	                        <select name="searchcategory" class="form-control">
	                            <option value="ID">ID</option>
	                            <option value="student">학생명</option>
	                        </select>
	                    </div>
	                    <div class="form-group">
	                        <label class="sr-only">검색</label>
	                        <input type="text" name="searchtext" class="form-control" placeholder="학생명을 입력해주세요."/>
	                    </div>
	                    <div class="form-group">
	                        <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
	                    </div>
	                </form>
	        	</div>
            </div>
               <div class="table-responsive">
                   <table class="table table-hover">
                       <colgroup>
                           <col width="30%">
                           <col width="20%">
                           <col width="30%">
                           <col width="20%">
                       </colgroup>                                   
                       <thead>
                           <tr>
                               <th>ID</th><th>학생명</th><th>수강 중인 과목</th><th>가입일</th>
                           </tr>
                       </thead>
                       <tbody>
                           <tr>
                               <td><a href="student-detail.jsp?no=1">blewwind70</a></td>
                               <td>김환희</td>
                               <td>4개</td>                                
                               <td>17/08/21</td>
                           </tr>                                                             
                           <tr>
                               <td><a href="#">blewwind70</a></td>
                               <td>김환희</td>
                               <td>4개</td>                                
                               <td>17/08/21</td>
                           </tr>                                                             
                           <tr>
                               <td><a href="#">blewwind70</a></td>
                               <td>김환희</td>
                               <td>4개</td>                                
                               <td>17/08/21</td>
                           </tr>                                                             
                       </tbody>
                   </table>
                   <div class="text-center">
                       <ul class="pagination pagination-sm">
                           <li><a href="#"><span class="glyphicon glyphicon-backward"></span></a></li>
                           <li><a href="#"><span class="glyphicon glyphicon-triangle-left"></span></a></li>
                           <li><a href="#">1</a></li>
                           <li><a href="#">2</a></li>
                           <li><a href="#">3</a></li>
                           <li><a href="#">4</a></li>
                           <li><a href="#">5</a></li>
                           <li><a href="#"><span class="glyphicon glyphicon-triangle-right"></span></a></li>
                           <li><a href="#"><span class="glyphicon glyphicon-forward"></span></a></li>
                       </ul>
                   </div>
               </div>
    	</div>
	 </div>
	 <%@ include file="../../common/footer.jsp" %>
</body>
</html>