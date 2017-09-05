<%@page import="pro.student.vo.Student"%>
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
	<% 
		Student student = (Student) session.getAttribute("loginedUser");
		if(student == null) {
			response.sendRedirect("../temp-login.jsp");
			return;
		}
	%>
	<%@ include file="../../common/nav.jsp" %>
    <div class="container">
		<div class="col-sm-offset-2 page-header">
			<h1>내 정보</h1>
		</div>   
    
   		<div class="col-sm-2">
			<%@ include file="left-menu.jsp" %>
		</div>         
       	<div class="col-sm-9">
             
             <form method="post" action="#" class="form-horizontal">
                 <div class="form-group">
                     <label class="control-label col-sm-2">이메일</label>
                     <div class="col-sm-7">
                         <label><%=student.getEmail() %></label>
                     </div>
                 </div>
                 <div class="form-group">
                     <label class="control-label col-sm-2">비밀번호</label>
                     <div class="col-sm-2">
                         <input type="password" name="userpassword-1" class="form-control" value="<%=student.getPwd().trim() %>"/>
                     </div>
                     <label class="control-label col-sm-2">비밀번호 확인</label>
                     <div class="col-sm-2">
                         <input type="password" name="userpassword-2" class="form-control" value="<%=student.getPwd().trim() %>"/>
                     </div>
                 </div>
                 <div class="form-group">
                     <label class="control-label col-sm-2">이름</label>
                     <div class="col-sm-7">
                     	<label><%=student.getName() %></label>
                     </div>
                 </div>
                 <div class="form-group">
                     <label class="control-label col-sm-2">연락처</label>
                     <div class="col-sm-7">
                      	<div class="col-sm-3">
                      		<select name="userphone-1" class="form-control" id="first-phone-number">
                      	<%
                      		String phone = student.getPhone();
                      		String[] splitNumber = phone.split("-");
                      		if("018".equals(splitNumber[0])) {
                      			
                      	%>
                              	<option value="010"> 010</option>
                              	<option value="011"> 011</option>
                              	<option value="016"> 016</option>
                              	<option value="017"> 017</option>
                              	<option value="018" selected="selected"> 018</option>
                      	<%		
                      		} else if("017".equals(splitNumber[0])) {
                      	%>
                              	<option value="010"> 010</option>
                              	<option value="011"> 011</option>
                              	<option value="016"> 016</option>
                              	<option value="017" selected="selected"> 017</option>
                              	<option value="018"> 018</option>
                      	<%		
                      		} else if("016".equals(splitNumber[0])) {
                      	%>
                              	<option value="010"> 010</option>
                              	<option value="011"> 011</option>
                              	<option value="016" selected="selected"> 016</option>
                              	<option value="017"> 017</option>
                              	<option value="018"> 018</option>
                      	<%		
                      		} else if("011".equals(splitNumber[0])) {
                      	%>
                              	<option value="010"> 010</option>
                              	<option value="011" selected="selected"> 011</option>
                              	<option value="016"> 016</option>
                              	<option value="017"> 017</option>
                              	<option value="018"> 018</option>
                      	<%		
                      		} else {
                      	%>
                              	<option value="010" selected="selected"> 010</option>
                              	<option value="011"> 011</option>
                              	<option value="016"> 016</option>
                              	<option value="017"> 017</option>
                              	<option value="018"> 018</option>
                      	<%		
                      		}
                      	%>
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
                 <div class="col-sm-10 form-group text-right">
                     <button type="reset" class="btn btn-warning">초기화</button>
                     <button type="submit" class="btn btn-success">변경완료</button>
                 </div>
             </form>
         </div>
     </div>
    <%@ include file="../../common/footer.jsp" %>
</body>
</html>