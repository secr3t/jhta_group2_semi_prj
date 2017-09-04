<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <nav class="navbar">
    <div class="col-sm-offset-1">
    <ul class="nav navbar-nav navbar-left">
        <div class="dropdown">
            <label class="dropdown-toggle" id="menu1" data-toggle="dropdown">필터<span class="caret"></span></label>
            <ul id="myDropdown-1" class="dropdown-menu" role="menu" aria-labelledby="menu1">
                 <li id="teacher">강사</li>
                 <li id="subject">과목</li>
                 <li id="popular">인기</li>
            </ul>
        </div>
     </ul>
    <ul class="nav navbar-nav navbar-left">
        <div class="dropdown">
            <label class="dropdown-toggle active" id="menu2"  data-toggle="dropdown">필터<span class="caret"></span></label>
            <ul id="myDropdown-2" class="dropdown-menu" role="menu" aria-labelledby="menu2">
            </ul>
        </div>
    </ul>
    </div>
    <div class="nav navbar-nav navbar-right">
    	<form>
    		<div class="input-group pull-right">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Search" id="textSearch"/>
					<div class="input-group-btn">
						<button class="btn btn-primary" type="submit">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</div>
				</div>	 
			</div>  	
    	</form>
    </div>
</nav>