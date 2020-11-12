<%@page import="poly.util.DateUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String room_name = (String)request.getAttribute("room_name");
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <link rel="stylesheet" href="/css/styles.css" />
    <script src="/js/jquery-3.4.1.min.js"></script>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Chat</title>
  </head>
  <body id="chat-screen">
  
  	<nav>
  		<div id="mysidenav" class="sidenav">
			<a href="#" class="closebtn" onclick='closeNav()'>x</a>
			<div class="chat_title">채팅방 유저</div>
			
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
        <h1 class="alt-header__title"><%=room_name %></h1>
      </div>
      <div class="alt-header__column">
      	<div class="alt-header__search-container">
      		<input type="search" class="alt-header__search-input" style="display:none"/>
        	<div class="alt-header__search-icon-div searching-btn" onclick="searching();"><i class="fas fa-search fa-lg"></i></div>
        </div>
        <span class="openmenu" onclick='openNav()'><i class="fas fa-bars fa-lg" aria-hidden="true"></i></span>
      </div>
    </header>

    <main class="main-screen main-chat">
      <div class="chat__timestamp">
        <%=DateUtil.getDateTime("M월 d일 E요일, yyyy") %>
      </div>

      <div class="message-row">
        <img src="../img/basic.gif" />
        <div class="message-row__content">
          <span class="message__author">kkyu</span>
          <div class="message__info">
            <span class="message__bubble">Hi!</span>
            <span class="message__time"><%=DateUtil.getDateTime("HH:mm") %></span>
          </div>
        </div>
      </div>

      <div class="message-row message-row--own">
        <div class="message-row__content">
          <div class="message__info">
            <span class="message__bubble">Hi nice to meet you!</span>
            <span class="message__time"><%=DateUtil.getDateTime("HH:mm") %></span>
          </div>
        </div>
      </div>
      
    </main>

    <form class="reply" onsubmit="return false;">
      <div class="reply__column">
        <i class="far fa-plus-square fa-lg"></i>
      </div>
      <div class="reply__column">
        <input type="text" placeholder="Write a message..."  />
        <i class="far fa-smile-wink fa-lg"></i>
        <button style="background-color:#fae100">
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
	<script src="/js/fontawesome.js"></script>
  </body>
</html>
