<%@page import="poly.util.CmmUtil"%>
<%@page import="poly.util.DateUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String SS_ROOM_NAME = CmmUtil.nvl((String)session.getAttribute("SS_ROOM_NAME"));
	String SS_USER_NAME = CmmUtil.nvl((String)session.getAttribute("SS_USER_NAME"));
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <link rel="stylesheet" href="/css/styles.css" />
    <script src="/js/fontawesome.js"></script>
    <script src="/js/jquery-3.4.1.min.js"></script>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Chat</title>
    <script type="text/javascript">
    	var SS_USER_NAME = '<%=SS_USER_NAME%>';
    	$(window).on('load',function() {
    		getAllMsg();
    		setInterval('getAllMsg()',500);
    		
    		$('#msgSendBtn').on('click',function() {
    			var send_msg = $('#send_msg').val();
    			
    			if( $('#send_msg').val()==""){
    				$('#send_msg').focus();
    				return false;
    			}
    			
    			$.ajax({
    				url : "/chat/msg.do",
    				type : "post",
    				dataType : "JSON",
    				data : {send_msg:send_msg},
    				success : function(json) {
    					getAllMsg();
    					$('#send_msg').val("");
    					$('#send_msg').focus();
    					var scollheight = document.body.scrollHeight;
    					window.scrollTo(0,scollheight);
    				}
    			})
    		});
    		
    	});
    	
    	//채팅방 전체 대화 가져오기
		function getAllMsg() {
			//Ajax 호출
			$.ajax({
				url : "/chat/getMsg.do",
				type : "post",
				dataType : "JSON",
				//data : $("form").serialize(),
				success : function(json) {
					doOutputMsg(json);
				}
			})
		}
    	
    	function doOutputMsg(json) {
			if(json != null) {
				var msgResult = "";
				var listResult ="";
				var userSet = new Set();
				msgResult += "<div class='chat__timestamp'>"+'<%=DateUtil.getDateTime("M월 d일 E요일, yyyy") %>'+"</div>";
				
				for(var i = 0; i<json.length;i++) {
					
					//  유저 셋 유저들 추가.
					userSet.add(json[i].user_name);
					
					var dateTimevalue = json[i].dateTime;
					var resdateTime = dateTimevalue.substring(11,16);	
					if(json[i].type == "admin"){
						msgResult+= json[i].msg+'<br/><br/>';
						
					} else if(json[i].user_name != SS_USER_NAME){
						msgResult += "<div class='message-row'>";
						msgResult += 	"<img src='../img/basic.gif'/>";
						msgResult += 	"<div class='message-row__content'>";
						msgResult +=		"<span class='message__author'>"+json[i].user_name+"</span>";
						msgResult += 		"<div class='message__info'>";
						msgResult += 			"<span class='message__bubble'>"+json[i].msg+"</span>";
						msgResult += 			"<span class='message__time'>"+resdateTime+"</span>";
						msgResult += 		"</div>";
						msgResult += 	"</div>";
						msgResult += "</div>";
					} else {
						msgResult += "<div class='message-row message-row--own'>";
						msgResult += 	"<div class='message-row__content'>";
						msgResult += 		"<div class='message__info'>";
						msgResult += 			"<span class='message__bubble'>"+json[i].msg+"</span>";
						msgResult += 			"<span class='message__time'>"+resdateTime+"</span>";
						msgResult += 		"</div>";
						msgResult += 	"</div>";
						msgResult += "</div>";
					}
				}
				
				$('#chatresultHTML').html(msgResult);
				
				var userArr = Array.from(userSet);
				for(var i = 0; i<userArr.length;i++) {
					listResult += "<div class='message__info'>";
					listResult += 	"<img class='sidenav__img' src='../img/basic.gif'/>";
					listResult += 	"<span class='message__bubble'>"+userArr[i]+"</span>";
					listResult += "</div>";
				}
					
				$('.sidenav__userlist').html(listResult);
				
			}
    	}
    	
    </script>
    <style>
    	.sidenav__img{
    		width: 50px;
		    height: 50px;
		    border-radius: 25px;
		    margin-left: 10px;
    	}
    </style>
  </head>
  <body id="chat-screen">
  
  	<nav>
  		<div id="mysidenav" class="sidenav">
  			<div class="sidenav__header">
				<a href="#" class="closebtn" onclick='closeNav()'>x</a>
				<div class="chat_title">채팅방 유저</div>
			</div>
			<div class="sidenav__userlist" style="padding-top:40px;">
		
			</div>
			
			<div class="reply chat__reply">
				<div class="nav__column" style="padding-left: 0px;">
					
					<span><i class="fas fa-sign-out-alt fa-lg"></i></span>
				</div>
				<div class="nav__column">
					<span><i class="far fa-bell-slash fa-lg"></i></span>
					<span><i class="far fa-star fa-lg"></i></span>
					<span><i class="fas fa-cog fa-lg"></i></span>
				</div>
			</div>
		</div>
		<div class="sidenav-left" onclick='closeNav()'>
		
		</div>
	</nav>
    
    <header class="alt-header">
      <div class="alt-header__column">
        <a href="/chats.do">
          <i class="fas fa-angle-left fa-3x"></i>
        </a>
      </div>
      <div class="alt-header__column text-hello">
        <h1 class="alt-header__title"><%=SS_ROOM_NAME %></h1>
      </div>
      <div class="alt-header__column">
      	<div class="alt-header__search-container">
      		<input type="search" class="alt-header__search-input" style="display:none"/>
        	<div class="alt-header__search-icon-div searching-btn" onclick="searching();"><i class="fas fa-search fa-lg"></i></div>
        </div>
        <span class="openmenu" onclick='openNav()'><i class="fas fa-bars fa-lg" aria-hidden="true"></i></span>
      </div>
    </header>

    <main class="main-screen main-chat" id="chatresultHTML" style="padding-bottom: 50px;">
      
    </main>

    <form class="reply" name="form" method="post" onsubmit="return false;">
      <div class="reply__column">
        <i class="far fa-plus-square fa-lg"></i>
      </div>
      <div class="reply__column">
        <input type="text" name="send_msg" id="send_msg" placeholder="Write a message..."/>
        <i class="far fa-smile-wink fa-lg"></i>
        <button id="msgSendBtn" style="background-color:#fae100; cursor:pointer;">
          <i class="fas fa-arrow-up"></i>
        </button>
      </div>
    </form>

    <div id="no-mobile">
      <span>Your screen is too big</span>
    </div>
    
    <!-- 로그인 확인 체크 페이지 -->
	<%@include file="/WEB-INF/view/include/logincheck.jsp" %>

	<script type="text/javascript">
		// 네비게이션 함수
		function openNav() {
			document.getElementById('mysidenav').style.width = '80%';
			document.querySelector('.sidenav-left').style.width = '100%';
		}
		function closeNav() {
			document.getElementById('mysidenav').style.width = '0';
			document.querySelector('.sidenav-left').style.width = '0';
		}
		
		// search 함수
		function searching(){
			if($('.text-hello').css('display') == 'none'){
				$('.text-hello').show();
			}else{
				$('.text-hello').hide();
			}
			
			if($('.alt-header__search-input').css('display') == 'none'){
				$('.alt-header__search-input').show();
			}else{
				$('.alt-header__search-input').hide();
			}
		}

	</script>
  </body>
</html>
