<%@page import="poly.util.CmmUtil"%>
<%@page import="poly.dto.UserDTO"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
  	<script src="/js/fontawesome.js"></script>
  	<script src="/js/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="/css/styles.css" />
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Chats</title>
    <style>
    	/* 화면 조절 css start */
    	html, body, #resContainer{
    		height:100%;
    	}
    	body {
    		overflow-x:hidden;
    	}
    	.user-component:first-child{
    		padding-top: 115px;
    	}
    	.user-component:last-child{
    		margin-bottom:80px;
    	}
    	/* 화면 조절 css end */
    	.user-component {
    		border-bottom: 1px solid rgba(0, 0, 0, 0.2);
    		padding-bottom:30px;
			padding-top:30px;
		}

		.user-component:hover {
			background-color: #f9f9fa;
			cursor:pointer;
		}

    </style>
    	<script type="text/javascript">
		$(window).on('load', function() {
			//전체 채팅방 리스트 가져오기
			getRoomList();
			
			setInterval('getRoomList()',1000);
			
		});
		//전체 채팅방 리스트 가져오기
		function getRoomList() {
			//Ajax 호출
			$.ajax({
				url : '/chat/roomList.do',
				type : 'post',
				dataType : "JSON",
				contentType:"application/json; charset=UTF-8",
				success : function(json) {
					var roomList = "";
					for (var i = 0; i < json.length; i++) {
						
						roomList += "<div class='user-component' onclick='goRoom(this)' id='"+json[i]+"'>";
						roomList +=   "<div class='user-component__column'>";
						roomList +=     "<div class='user-component__text'>";
						roomList +=       "<h4 class='user-component__title'>"+json[i]+"</h4>";
						roomList +=     "</div>";
						roomList +=   "</div>";
						roomList +=   "<div class='user-component__column'>";
						roomList +=   	"<i class='fas fa-angle-right'></i>";
						roomList +=   "</div>";
						roomList += "</div>";
						
					}
					$('.room_list').html(roomList);
				}
			})
		}
		
		function createRoom() {
			var title = prompt('채팅방 이름을 입력하세요.','');
			if(title != null){
			$('#room_name').val(title);
			$('#form-data').submit();
			}
		}
		
		function goRoom(title) {
			var roomtitle = $(title).attr('id');
			console.log(roomtitle);
			location.href='/chat/intro.do?roomKey='+roomtitle;
		}
		
	</script>
  </head>
  <body id="body-all">
  <form id="form-data" name="form" method="get" action="/chat/intro.do">
  	<input type="hidden" id="room_name" name="roomKey"/>
	<header class="screen-header">
		<h1 class="screen-header__title" style="padding-left:25px;">Chats</h1>
	    <div class="screen-header__icons" style="padding-right:25px;">
	    	<span><i class="far fa-comment-dots fa-lg" onclick='createRoom();'></i></span>
	    </div>
	</header>
	</form>
		
    <main id="resContainer" class="friends-screen friend-mp room_list">
		
    </main>
    
    <nav class="nav">
      <ul class="nav__list">
        <li class="nav__btn">
          <a class="nav__link" href="/friends.do">
            <i class="far fa-user fa-2x"></i>
          </a>
        </li>
        <li class="nav__btn">
          <a class="nav__link" href="/chats.do">
            <i class="fas fa-comment fa-2x"></i>
          </a>
        </li>
      </ul>
    </nav>

    <div id="no-mobile">
      <span>Your screen is too big</span>
    </div>
    
	<!-- 로그인 확인 체크 페이지 -->
	<%@include file="/WEB-INF/view/include/logincheck.jsp" %>
	
  </body>
</html>
