<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <div class="row">
            <form method="post" action="loginController.jsp" id="login-form">
                    <div class="panel panel-info">
                        <div class="panel-heading"><strong>로그인</strong></div>
                        <div class="panel-body">    
                            <div class="form-group">
                                <label class="show">구분</label>
                                <input type="radio" id="login-student" value="student" name="login-type"/> <label for="login-student">학생</label>
                                <input type="radio" id="login-lecturer" value="lecturer" name="login-type"/> <label for="login-lecturer">강사</label>
                            </div>                   
                            <div class="form-group">
                                <label>아이디</label>
                                <div>
                                    <input type="text" class="form-control" name="user-id" placeholder="이메일을 입력하세요."/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>비밀번호</label>
                                <div>
                                    <input type="password" class="form-control" name="user-pwd" placeholder="비밀번호를 입력하세요."/>
                                </div>
                            </div>
                            <div class="form-group"> 
                            	<input type="hidden" name="returnUrl"/>
                                <button class="btn btn-primary pull-right" id="login-btn">로그인</button>
                            </div>
                        </div>
                    </div>
            </form>
        </div>     