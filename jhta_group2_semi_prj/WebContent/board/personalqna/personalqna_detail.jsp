<%@page import="pro.utils.DateUtils"%>
<%@page import="pro.tech.vo.Tech"%>
<%@page import="pro.board.dao.TechBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@include file="../../common/header.jsp"%>
<body>
<%@include file="../../common/nav.jsp" %>
<div class="container">
	<div class="col-sm-3">
<%@ include file="../boardbanner/left-menu.jsp" %>
	</div>
	<div class="col-sm-9">
  <div class="row">
  	<div class="row">
  	    <h1 >FAQ게시판</h1>
  	<h4>
  	<span style="color:#ff0000;"><strong>|</strong>
  	</span> 1:1 문의
  	</h4>
  	<hr>
    </div>
    	<% 
    		int no = Integer.parseInt(request.getParameter("no"));
    	TechBoardDao tdao = TechBoardDao.getInstance();
    		
    		Tech tech = tdao.getTechBoardByNo(no);
    		
    	%>
  		<div class="panel panel-default">
  			<table class="table">
  				
  				<tbody>
  					<tr>
  					<th><h4><strong>질문</strong></h4></th>
  					<td><%=tech.getTitle() %></td>
  					</tr>
  				<tr>
  					<th class="col-sm-2">작성자</th>
  					<td><%=tech.getStudent().getName() %></td>
  					<th>날짜</th>
  					<td><%=DateUtils.yyyymmdd(tech.getQuesRegdate()) %></td>
  				</tr>
  				<tr>
  					<td colspan="6"><%=tech.getQuesContent() %></td>
  				</tr> 
  				</tbody>
  			</table>
  		</div>
  		<%//if(display=="Y"){ %>
  		<div class="panel panel-default">
  			<table class="table">
  				<tbody>
  				<tr>
  					<th><h3>답변</h3></th>
  				</tr>
  				<tr>
  					<th>답변날짜</th>
  					<td><%=DateUtils.yyyymmdd(tech.getAnsRegdate()) %></td>
  				</tr>
  				<tr>
  					<td colspan="6"><%=tech.getAnsContent() %></td>
  				</tr> 
  			</table>
  				<div class="text-right">
	  				<a href="/jhta_group2_semi_prj/board/personalqna/personalqna_replywrite.jsp?no=<%=tech.getNo() %>" class="btn btn-warning btn-sm">답변</a>
	  				<a href="/jhta_group2_semi_prj/board/personalqna/delete_personalqna.jsp?no=<%=tech.getNo() %>" class="btn btn-danger btn-sm">삭제</a>
	  				<a href="/jhta_group2_semi_prj/board/afterlecture/afterlecture.jsp" class="btn btn-primary btn-sm">돌아가기</a>
	  			</div>
  				</tbody>
  		</div>  			
  		<%//} %>
  </div>
</div>
<div class="col-sm-1"></div>
</div>
<%@include file="../../common/footer.jsp"%>
</body>
</html>