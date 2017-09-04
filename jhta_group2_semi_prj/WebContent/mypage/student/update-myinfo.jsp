<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Modify</title>
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
        <h1>Modify My Info</h1>
        <hr/>
        <div class="row">
        	<div class="col-sm-2">
				<%@ include file="left-menu.jsp" %>
			</div>         
            <div class="col-sm-10">
                <h2 class="sub-header">내 정보</h2>
                <hr/>
                
                <form method="post" action="#" class="form-horizontal">
                    <div class="form-group">
                        <label class="control-label col-sm-2">이메일</label>
                        <div class="col-sm-7">
                            <label>blewwind70@naver.com</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2">비밀번호</label>
                        <div class="col-sm-2">
                            <input type="password" name="userpassword-1" class="form-control" value="zxcv1234"/>
                        </div>
                        <label class="control-label col-sm-2">비밀번호 확인</label>
                        <div class="col-sm-2">
                            <input type="password" name="userpassword-2" class="form-control" value="zxcv1234"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2">이름</label>
                        <div class="col-sm-7">
                        	<label>김환희</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2">연락처</label>
                        <div class="col-sm-7">
	                        <div class="col-sm-3">
	                        	<select name="userphone-1" class="form-control">
	                                <option value="010" selected="selected"> 010</option>
	                                <option value="011"> 011</option>
	                                <option value="016"> 016</option>
	                                <option value="017"> 017</option>
	                                <option value="018"> 019</option>
	                            </select>
	                    	</div>
	                       	<label class="col-sm-1">-</label>
	                        <div class="col-sm-3">
	                        	<input type="tel" name="userphone-2" class="form-control" value="1111"/>
	                        </div>
	                       	<label class="col-sm-1">-</label>
	                        <div class="col-sm-3">
	                        	<input type="tel" name="userphone-3" class="form-control" value="2222"/>
	                        </div>
	                	</div>
                    </div>
                    <div class="col-sm-10 form-group text-right">
                        <button type="reset" class="btn btn-warning">초기화</button>
                        <button type="submit" class="btn btn-success">변경완료</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <%@ include file="../../common/footer.jsp" %>
</body>
</html>