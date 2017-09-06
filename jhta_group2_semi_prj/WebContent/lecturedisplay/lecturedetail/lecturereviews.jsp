<%-- <%@page import="pro.postscription.vo.Postscription"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <div class="row">
       <div class="col-sm-8"  style="padding-top:30px;">
          <h4><a href="http://localhost/jhta_group2_semi_prj/board/afterlecture/afterlecture.jsp">Lecture Reviews</a></h4>
       </div>
 </div>    
 <% List<Postscription> postscriptions = lecturePostScriptDao.getPostscriptionByCourseNo(courseNo); %>
 			<%for(int i = 0; i<5; i++){ %>
                <div class="row col-sm-12">
                    <div>
                        <p><strong></strong></p>
                    </div>
                    <div class="row col-sm-12">
                        <p>I missed this one (SC2x), I'm enrolled to SC1x and SC3x. I am a fan of the supply Chain Management MITx XSeries. Will there be mor...</p>
                    </div>
                </div>
            <% } %> --%>