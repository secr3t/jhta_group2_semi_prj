<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@include file="../common/header.jsp" %>
<body>
<%@include file="../common/nav.jsp" %>
 <!-- sidebar -->
        <div class="col-xs-6 col-sm-2 sidebar-offcanvas" id="sidebar" role="navigation">
            <ul class="nav">
              <li class="active"><a href="#">Home</a></li>
              <li><a href="#">Link 1</a></li>
              <li><a href="#">Link 2</a></li>
              <li><a href="#">Link 3</a></li>              
            </ul>
        </div>
<div class="container col-sm-8">
    
  <nav class="navbar">
        <ul class="nav navbar-nav">
            <li>강의목록</li>
        </ul>        
       
        <ul class="nav navbar-nav navbar-right">
            <div class="dropdown">
                <label class="dropdown-toggle active" id="menu2"  data-toggle="dropdown">필터<span class="caret"></span></label>
                <ul id="myDropdown-2" class="dropdown-menu" role="menu" aria-labelledby="menu2">
                
                </ul>
            </div>
         </ul>
           <ul class="nav navbar-nav navbar-right">
            <div class="dropdown">
                <label class="dropdown-toggle" id="menu1" data-toggle="dropdown">필터<span class="caret"></span></label>
                <ul id="myDropdown-1" class="dropdown-menu" role="menu" aria-labelledby="menu1">
                     <li id="teacher">강사</li>
                     <li id="subject">과목</li>
                     <li id="popular">인기</li>
                </ul>
            </div>
         </ul>
    </nav>

 
        <div class="col-sm-3 well" >
            
             <div>
                 <img src="../images/%EA%B0%95%EC%82%AC%EC%82%AC%EC%A7%84.jpg" alt="강사사진" style="width: 40%; float:left">
             </div>
             <div>
                 <h3>고등수학</h3>
             </div>
             <div class="text-right">
                  <p>강의 설명 이건 정말 꼭 수강해야되</p>
                  <p>강사 <strong>이성환</strong></p>
             </div>
             <div class=" text-right"> 
                 <p>포인트 <strong>300P</strong></p>
             </div>
            		
            <div class="btn-group btn-group-justified" role="group">
                    <a href="" class="btn btn-primary">소개</a>
                    <a href="" class="btn btn-success">수강신청</a>
            </div>
        </div>
        <div class="col-sm-offset-1 col-sm-3 well" >
                        
             <div>
                 <img src="../images/%EA%B0%95%EC%82%AC%EC%82%AC%EC%A7%84.jpg" alt="강사사진" style="width: 40%; float:left">
             </div>
             <div>
                 <h3>고등수학</h3>
             </div>
             <div class="text-right">
                  <p>강의 설명 이건 정말 꼭 수강해야되</p>
                  <p>강사 <strong>이성환</strong></p>
             </div>
             <div class=" text-right"> 
                 <p>포인트 <strong>300P</strong></p>
             </div>
            		
            <div class="btn-group btn-group-justified" role="group">
                    <a href="" class="btn btn-primary">소개</a>
                    <a href="" class="btn btn-success">수강신청</a>
            </div>
        </div>
        <div class="col-sm-offset-1 col-sm-3 well" >
                        
             <div>
                 <img src="../images/%EA%B0%95%EC%82%AC%EC%82%AC%EC%A7%84.jpg" alt="강사사진" style="width: 40%; float:left">
             </div>
             <div>
                 <h3>고등수학</h3>
             </div>
             <div class="text-right">
                  <p>강의 설명 이건 정말 꼭 수강해야되</p>
                  <p>강사 <strong>이성환</strong></p>
             </div>
             <div class=" text-right"> 
                 <p>포인트 <strong>300P</strong></p>
             </div>
            		
            <div class="btn-group btn-group-justified" role="group">
                    <a href="" class="btn btn-primary">소개</a>
                    <a href="" class="btn btn-success">수강신청</a>
            </div>
        </div>

    
    
</div>
<%@include file="../common/footer.jsp" %>
</body>
<script type="text/javascript">
    document.getElementById("myDropdown-1").addEventListener("click", function(event){
       var clicked =event.target;
        console.log(clicked);
        if(clicked.id === "teacher"){
            var htmlContent = "";
            htmlContent += "<li id='uisil'>맹의실</li>";
            htmlContent += "<li id='seungyong'>이승용</li>";
            htmlContent += "<li id='daenyeong'>허대녕</li>";
            htmlContent += "<li id='seonghwan'>이성환</li>";
            document.getElementById("menu2").setAttribute("data-toggle", "dropdown");
            document.getElementById("menu2").innerHTML = "필터"+"<span class='caret'></span>"; 
            document.getElementById("myDropdown-2").innerHTML = htmlContent;
            document.getElementById("menu1").innerHTML = clicked.innerText+"<span class='caret'></span>";
        }else if(clicked.id === "subject"){
            var htmlContent = "";
            htmlContent +="<li id='korean'>국어</li>";
            htmlContent +="<li id='science'>과학</li>";
            htmlContent +="<li id='math'>수학</li>";
             document.getElementById("menu2").setAttribute("data-toggle", "dropdown");
            document.getElementById("menu2").innerHTML = "필터"+"<span class='caret'></span>"; 
            document.getElementById("myDropdown-2").innerHTML = htmlContent;
            document.getElementById("menu1").innerHTML = clicked.innerText+"<span class='caret'></span>";
        }else if(clicked.id === "popular"){
            document.getElementById("menu1").innerHTML = clicked.innerText+"<span class='caret'></span>";
            document.getElementById("menu2").innerHTML = ""
            document.getElementById("menu2").setAttribute("data-toggle", "");
        }
    });
    
   document.getElementById("myDropdown-2").addEventListener("click", function(event){
        var clicked = event.target;     
        document.getElementById("menu2").innerHTML = clicked.innerText+"<span class='caret'></span>";
       
    });
</script>
</html>