<%@page import="poly.util.CmmUtil"%>
<%@page import="poly.util.DateUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String SS_ROOM_NAME = CmmUtil.nvl((String)session.getAttribute("SS_ROOM_NAME"));
	String SS_USER_NO = CmmUtil.nvl((String)session.getAttribute("SS_USER_NO"));
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
    	var SS_USER_NO = '<%=SS_USER_NO%>';
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
    		
    		$('.apparatusWrap').hover(
    				function(){
    					$('.apparatusWrap').removeClass("far");
    					$('.apparatusWrap').removeClass("fa-smile-wink");
    					$('.apparatusWrap').addClass("fas");
    					$('.apparatusWrap').addClass("fa-grin-squint-tears");
    				},                  
    				function(){
    					$('.apparatusWrap').addClass("far");
    					$('.apparatusWrap').addClass("fa-smile-wink");
    					$('.apparatusWrap').removeClass("fas");
    					$('.apparatusWrap').removeClass("fa-grin-squint-tears");
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
				msgResult += "<div class='chat__timestamp'>"+'<%=DateUtil.getDateTime("M월 d일 E, yyyy") %>'+"</div>";
				
				for(var i = 0; i<json.length;i++) {
					
					//  유저 셋 유저들 추가.
					userSet.add(json[i].user_name);
					
					var dateTimevalue = json[i].dateTime;
					var resdateTime = dateTimevalue.substring(11,16);	
					if(json[i].type == "admin"){
						msgResult+= json[i].msg+'<br/><br/>';
						
					} else if(json[i].user_no != SS_USER_NO){
						msgResult += "<div class='message-row'>";
						msgResult += 	"<img src='/img/basic.jpg'/>";
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
					listResult += 	"<img class='sidenav__img' src='/img/basic.jpg'/>";
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
    	/*### 버튼 양식 ###*/
		/* Popup container - can be anything you want */
		.popup {
		  position: relative;
		  display: inline-block;
		  cursor: pointer;
		  -webkit-user-select: none;
		  -moz-user-select: none;
		  -ms-user-select: none;
		  user-select: none;
		}
		/* The actual popup */
		.popup .popuptext {
		  visibility: hidden;
		  width: 160px;
		  background-color: #555;
		  color: #fff;
		  text-align: center;
		  border-radius: 6px;
		  padding: 8px 0;
		  position: absolute;
		  z-index: 1;
		  bottom: 125%;
		  left: 50%;
		  margin-left: -80px;
		  
		}
		
		/*### 삼각형 ###*/
		/* Popup arrow */
		.popup .popuptext::after {
		  content: "";
		  position: absolute;
		  top: 100%;
		  left: 50%;
		  margin-left: -5px;
		  border-width: 5px;
		  border-style: solid;
		  border-color: #555 transparent transparent transparent;
		}
		
		/*### 보이기 ###*/
		/* Toggle this class - hide and show the popup */
		.popup .show {
		  visibility: visible;
		  -webkit-animation: fadeIn 1s;
		  animation: fadeIn 1s;
		}
		/*### 애니메이션 ###*/
		/* Add animation (fade in the popup) */
		@-webkit-keyframes fadeIn {
		  from {opacity: 0;} 
		  to {opacity: 1;}
		}
		@keyframes fadeIn {
		  from {opacity: 0;}
		  to {opacity:1 ;}
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
      <div class="popup" onclick="myFunction()">
        <i class="far fa-plus-square fa-lg"></i>
        <img class="popuptext" id="myPopup" src="/img/bear.jpg"
			     alt="bears">
      </div>

      <div class="reply__column">
        <input type="text" name="send_msg" id="send_msg" placeholder="Write a message..."/>
        <i class="far fa-smile-wink fa-lg apparatusWrap"></i>
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
		
		// 클릭시 보여주기 
		function myFunction() {
		  var popup = document.getElementById("myPopup");
		  popup.classList.toggle("show");
		}
		
	</script>
  </body>
</html>
