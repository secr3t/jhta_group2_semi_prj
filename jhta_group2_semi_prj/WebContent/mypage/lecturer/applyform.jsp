<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Apply Course</title>
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
        <h1>Apply Course</h1>
        <hr/>
        <div class="row">
        	<div class="col-sm-2">
				<%@ include file="left-menu.jsp" %>
			</div>         
            <div class="col-sm-10">
                <h2 class="sub-header">강의 신청하기</h2>
                <hr/>
                
                <form method="post" action="#" class="form-horizontal">
                    <div class="form-group">
                        <label class="control-label col-sm-2">강의명</label>
                        <div class="col-sm-7">
                            <input type="text" name="coursename" class="form-control" placeholder="강의명 제한 글자?"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2">강의분류</label>
                        <div class="col-sm-3">
                            <select name="coursecategory" class="form-control">
                                <option value="" selected="selected"> 선택</option>
                                <option value="kor"> 언어</option>
                                <option value="eng"> 영어</option>
                                <option value="math"> 수학</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2">강의당 포인트</label>
                        <div class="col-sm-2">
                            <input type="number" name="coursepoint" class="form-control"/>
                        </div>
                        <label><span class="glyphicon glyphicon-copyright-mark text-warning"></span></label>
                    </div>
                    <div class="form-group">
                    	<label class="control-label col-sm-2">강의에 대한 간단한 소개</label>
                    	<div class="col-sm-7">
                    		<textarea rows="15" name="courseinfo" class="form-control" placeholder="xx자 내외로 써주세요."></textarea>
                    	</div>
                    </div>
                    <div class="col-sm-10 form-group text-right">
                        <button type="reset" class="btn btn-warning">초기화</button>
                        <button type="submit" class="btn btn-success">신청</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <%@ include file="../../common/footer.jsp" %>
</body>
</html>