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
	<%@ include file="/mypage/lecturer/logincheck.jsp" %>
	<%@ include file="/common/nav.jsp" %>
    <div class="container">
 		<div class="col-sm-offset-2 page-header">
			<h1>내 정보</h1>
		</div>
		
    	<div class="col-sm-2">
			<%@ include file="../left-menu.jsp" %>
		</div>         
        <div class="col-sm-9">
             
             	 <%
             	 final String FAIL_CODE_NOT_SAME_PWD = "1";
             	 final String FAIL_CODE_NOT_ACCEPT_PHONE_NO = "2";
             	 
             	 if(FAIL_CODE_NOT_SAME_PWD.equals(request.getParameter("fail"))) {
             	 %>
             	     <div class="alert alert-danger">
             		 	<strong>ERROR!!</strong> 입력하신 두 비밀번호가 서로 일치하지 않습니다. 
             		 </div>
             	 <%
             	 }
             	 if(FAIL_CODE_NOT_ACCEPT_PHONE_NO.equals(request.getParameter("fail"))) {
             	 %>
             		 <div class="alert alert-danger">
             		 	<strong>ERROR!!</strong> 유효하지 않은 핸드폰 번호입니다. 
             		 </div>
             	 <%
             	 }
             	 if(request.getParameter("success") != null) {
             	 %>
             		 <div class="alert alert-success">
             		 	<strong>성공적으로 수정되었습니다.</strong> 
             		 </div>
             	 <%
             	 }
             	 %>
             <form method="post" action="image-update.jsp" enctype="multipart/form-data" class="form-horizontal col-sm-11">
	      		 <div class="row">
	              	<div class="col-sm-10">
		              	 <div class="form-group">
		                  	 <label class="control-label col-sm-2">이메일</label>
		                  	 <div class="col-sm-7">
		                     	 <label><%=lecturer.getEmail() %></label>
		                  	 </div>
		              	 </div>
			             <div class="form-group">
			                 <label class="control-label col-sm-2">비밀번호</label>
			                 <div class="col-sm-7">
			                     <input type="password" name="userpassword-1" class="form-control" value="<%=lecturer.getPwd().trim() %>"/>
			                 </div>
			             </div>
		                 <div class="form-group">
		                     <label class="control-label col-sm-2">비밀번호 확인</label>
		                     <div class="col-sm-7">
		                        <input type="password" name="userpassword-2" class="form-control" value="<%=lecturer.getPwd().trim() %>"/>
		                     </div>
		                 </div>
		                 <div class="form-group">
		                   	<label class="control-label col-sm-2">이름</label>
		                   	<div class="col-sm-3">
		                   		<label><%=lecturer.getName() %></label>
		                   	</div>
		               	   <label class="control-label col-sm-2">강사허용</label>
		               	   <div class="cols-sm-3">
		               	   		 <label><%=lecturer.getPermit() %></label>
		               	   </div>
		                </div>
		                <div class="form-group">
		                	<label class="control-label col-sm-2">연락처</label>
		                	<div class="col-sm-7">
		                   		<div class="col-sm-3">
		                       		<select name="userphone-1" class="form-control">
		                       		<%
		                       			String[] splitNumber = lecturer.getPhone().split("-");		
		                       		%>
		                         		<option value="010" <%="010".equals(splitNumber[0])?"selected" : "" %>> 010</option>
		                         		<option value="011" <%="011".equals(splitNumber[0])?"selected" : "" %>> 011</option>
		                         		<option value="016" <%="016".equals(splitNumber[0])?"selected" : "" %>> 016</option>
		                         		<option value="017" <%="017".equals(splitNumber[0])?"selected" : "" %>> 017</option>
		                        		<option value="018" <%="018".equals(splitNumber[0])?"selected" : "" %>> 018</option>
		                       		</select>
		                   		</div>
		                    	<label class="col-sm-1">-</label>
		                    	<div class="col-sm-3">
		                       		<input type="tel" name="userphone-2" class="form-control" value="<%=splitNumber[1] %>"/>
		                    	</div>
		                    	<label class="col-sm-1">-</label>
		                    	<div class="col-sm-3">
		                      		<input type="tel" name="userphone-3" class="form-control" value="<%=splitNumber[2] %>"/>
		                 		</div>
		              	 	</div>
		               </div>
		               <div class="form-group">
		                 	<label class="control-label col-sm-2">대표 이력</label>
		                 	<div class="col-sm-7">
		                 		<textarea rows="1" name="career" class="form-control"><%=lecturer.getCareer() %></textarea>
		                 	</div>
		               </div>
		            </div>
	    		 	<div class="col-sm-2">
		               	 <label class="control-label">사진</label>
		               	 <div class="row">
		                     <img src="<%=lecturer.getPicture() %>" width="120px" height="140px" alt="강사사진" id="image-uploaded"/>
		             	 </div>
		                 <input type="file" name="userimage" id="file-upload" class="form-control"/>
	              	</div>
	      		 </div>
              <div class="form-group text-right">
              		<button type="reset" class="btn btn-warning">초기화</button>
                    <button type="submit" class="btn btn-success">변경완료</button>
              </div>
           </form>
       </div>
    </div>
    <%@ include file="/common/footer.jsp" %>
</body>
<script type="text/javascript">
	var upload = document.getElementById('file-upload'),
	    imageTag = document.getElementById('image-uploaded');
	 
	upload.onchange = function (e) {
	  e.preventDefault();
	
	  var file = upload.files[0],
	      reader = new FileReader();
	  reader.onload = function (event) {
	    imageTag.src = event.target.result;
	  };
	  reader.readAsDataURL(file);
	
	  return false;
	};
</script>
</html>
