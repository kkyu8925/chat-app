<%@page import="poly.util.CmmUtil"%>
<%@page import="poly.dto.UserDTO"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    List<UserDTO> rList = (List<UserDTO>)request.getAttribute("rList");
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <link rel="stylesheet" href="../css/styles.css" />
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
    		padding-top: 30px;
    		padding-bottom: 30px;
    		border-bottom: 1px solid rgba(0, 0, 0, 0.2);
		}
		.user-component:hover {
			background-color: #f9f9fa;
			cursor:pointer;
		}
    </style>
  </head>
  <body id="body-all">
  <form id="form-data" name="form" method="post" action="/chat/intro.do">
	<header class="screen-header">
		<h1 class="screen-header__title" style="padding-left:25px;">Chats</h1>
	    <div class="screen-header__icons" style="padding-right:25px;">
	    	<span><i class="fas fa-search fa-lg" onclick='UpFind();'></i></span>
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
          <a class="nav__link" href="/chat.do">
            <i class="fas fa-comment fa-2x"></i>
          </a>
        </li>
      </ul>
    </nav>
    <div id="splash-screen" style="background-color:white; color:red;">
      <i class="fab fa-youtube" ></i>
    </div>

    <div id="no-mobile">
      <span>Your screen is too big</span>
    </div>
    
	<script type="text/javascript">
		var myChatRoom = "";
		$(window).on('load', function() {
			//전체 채팅방 리스트 가져오기
			getRoomList();
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
						roomList += (json[i] + "<br>");
						
						roomList += "<div class='user-component' onClick='location.href='/chat.do''>";
						roomList +=   "<div class='user-component__column'>";
						roomList +=     "<div class='user-component__text'>";
						roomList +=       "<h4 class='user-component__title'>chatroom</h4>";
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
			$('#form-data').submit();
		}
		
	</script>
    
    <!-- find jsp -->
    <%@include file="/WEB-INF/view/include/find.jsp" %>
    
	<!-- 로그인 확인 체크 페이지 -->
	<%@include file="/WEB-INF/view/include/logincheck.jsp" %>
	
	<script src="/js/fontawesome.js"></script>
	<script src="/js/jquery-3.4.1.min.js"></script>
  </body>
</html>
