<%@page import="java.util.HashMap"%>
<%@page import="pro.video.dao.VideoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%VideoDao dao = VideoDao.getInstance();

%>
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
					<!-- 					<embed class="embed-responsive-item embed-reponsive-16by9"
						width="854" height="480" autoplay="1" start="4"
						src="https://www.youtube.com/embed/5UxU1g0YH0M" frameborder="0"
						allowfullscreen >
						</embed> -->
					<div id="player"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
// 2. This code loads the IFrame Player API code asynchronously.
var tag = document.createElement('script');
tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[4];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

// 3. This function creates an <iframe> (and YouTube player)
//    after the API code downloads.
var player;
function onYouTubeIframeAPIReady() {
  player = new YT.Player('player', {
    height: '360',
    width: '640',
    
<%--     <%
    HashMap<String, Integer> map = new HashMap<>();
  map.put("courseNo", 1);				//	parameter에서 가져와야함
  map.put("orderNo", 1);				//	parameter에서 가져와야함
  String src = 
  VideoDao.getInstance().getVideoAttachedSrcByVideoOrderNoAndCourseNo(map); 
    %>
    videoId: '<%=src%>',  --%>
    
    videoId: '5UxU1g0YH0M',
    events: {
	 /*     'onReady': onPlayerReady, */
      'onStateChange': onPlayerStateChange
    }
  });
}

// 4. The API will call this function when the video player is ready.
function onPlayerReady(event) {

	// youtube player가 준비되면 할 행동.

}

// 5. The API calls this function when the player's state changes.
//    The function indicates that when playing a video (state=1),
//    the player should play for six seconds and then stop.

function printValue(value){
	console.log(value);
}

function getTimerFactory(event) {
	var ajaxCallIterate;
	
	return function() {
		if (ajaxCallIterate) {
			return ajaxCallIterate;
		} else {
			ajaxCallIterate = new timer(ajaxCall, 1000,  event.target );
			return ajaxCallIterate;
		}
	}
}

var ajaxTimerSingleton = (function () {
	// Instance는 Singleton에 대한 참조를 가짐
	var instance;
	var count = 0;
	function init() {
		// initializing, Singleton
		// private methods and variables
		var target;	// undefined target
		var ajaxTimer;
		
		return {
			setTarget: function(target) {
				this.target = target;
				if(ajaxTimer)
						ajaxTimer.stop();
				ajaxTimer = new timer(ajaxCall, 1000,  target );
			}, 
			getAjaxTimer : function() {
				return ajaxTimer;
			}
		};
	};
	  return {
		    // Get the Singleton instance if one exists
		    // or create one if it doesn't
		    getInstance: function () {
		      if ( !instance ) {
		        instance = init();
		      }
		      return instance;
		    }
		  };
})();

var timerFactory ;

/* function onPlayerStateChange(event) {
	//var ajaxCallIterate = new timer(ajaxCall, 1000,  event.target );
	if (!timerFactory) {
		timerFactory = getTimerFactory(event);
	}
	var ajaxCallIterate = timerFactory();
  if (event.data == YT.PlayerState.PLAYING) {
	  ajaxCallIterate.start();
  } else if(event.data == YT.PlayerState.PAUSED) {
	  ajaxCallIterate.stop();
  }
} */
 function onPlayerStateChange(event) {
	var ajaxTimerSingletonInstance = ajaxTimerSingleton.getInstance();
	ajaxTimerSingletonInstance.setTarget(event.target);
	var ajaxTimer = ajaxTimerSingletonInstance.getAjaxTimer();
  if (event.data == YT.PlayerState.PLAYING) {
	ajaxTimer.start();
  } else if(event.data == YT.PlayerState.PAUSED) {
	  ajaxTimer.stop();
  }
}

function stopVideo() {
  player.stopVideo();
}

function ajaxCall(target) {
	var xhr = new XMLHttpRequest();
	var progress = target.getCurrentTime()/target.getDuration() * 100.00;
	xhr.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
		}
	}
	console.log('send', progress);
	xhr.open('POST', 'update-progress.jsp');
	xhr.send(progress.toFixed(2));
}
</script>