<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.pull-left {
	height: 480px;
	overflow-y: scroll;
}

ul>li>a>.thumbnail {
	max-width: 120px;
}
</style>
<div class="well">
	<p class="panel" id="lecture-title">동영상</p>
	<div class="media">
		<div class="pull-left">
			<ul class="list-unstyled">
				<li><a href='#'> <img src='../images/daum.png' alt=''
						class='pull-right thumbnail'>
						<p>강의1</p>
						<p class="small">강의 설명</p>
				</a></li>
				<li><a href='#'> <img src='../images/daum.png' alt=''
						class='pull-right thumbnail'>
						<p>강의1</p>
						<p class="small">강의 설명</p>
				</a></li>
				<li><a href='#'> <img src='../images/daum.png' alt=''
						class='pull-right thumbnail'>
						<p>강의1</p>
						<p class="small">강의 설명</p>
				</a></li>
				<li><a href='#'> <img src='../images/daum.png' alt=''
						class='pull-right thumbnail'>
						<p>강의1</p>
						<p class="small">강의 설명</p>
				</a></li>
				<li><a href='#'> <img src='../images/daum.png' alt=''
						class='pull-right thumbnail'>
						<p>강의1</p>
						<p class="small">강의 설명</p>
				</a></li>
				<li><a href='#'> <img src='../images/daum.png' alt=''
						class='pull-right thumbnail'>
						<p>강의1</p>
						<p class="small">강의 설명</p>
				</a></li>

			</ul>
		</div>
		<div class="container">
			<div class="center-block">
				<div id="video-wrapper">
					<embed class="embed-responsive-item embed-reponsive-16by9"
						width="854" height="480" autoplay="1" start="4"
						src="https://www.youtube.com/embed/5UxU1g0YH0M" frameborder="0"
						allowfullscreen />
				</div>
			</div>
		</div>
	</div>
</div>
<script>
		var video = $('.html5-video-container > video');
		video.onplay = 		timer(ajaxUpdate(), 1000);
		function ajaxUpdate() {
		xhr = new XMLHttpRequest();
		var totalMin = totalTime.split(':')[0];
		var restSecs = totalTime.split(':')[1];
		var totalSecs = parseFloat(totalMin) * 60 + parseFloat(restSecs);
		var totalTime = $('.ytp-time-duration').textContent;
		var progress ;				//  video.currentTime/totalSecs * 100;
		var response;
		xhr.onreadystatechange = function() {
		    	if (this.readyState == 4 && this.status == 200) {
				response = this.responseText;
				console.log(response);
		    }
		};
		progress =  video.currentTime/totalSecs * 100;
		progress = progress.toFixed(2);
		xhr.open('POST', 'update-progress.jsp');
		xhr.send(progress);
	}
		
$(document).ready(function() {

	});

	var embedElement = getFirstEBT('embed');
		
		getFirstEBC('center-block').style.width = getFirstEBT('embed').getAttribute('width')+ 'px';


		
		
</script>