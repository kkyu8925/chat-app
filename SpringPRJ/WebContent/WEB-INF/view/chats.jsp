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
  	<script src="https://kit.fontawesome.com/54d6336788.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/styles.css" />
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Chats</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
	<header class="screen-header">
		<h1 class="screen-header__title" style="padding-left:25px;">Chats</h1>
	    <div class="screen-header__icons" style="padding-right:25px;">
	    	<span><i class="fas fa-search fa-lg" onclick='UpFind();'></i></span>
	    	<span><i class="far fa-comment-dots fa-lg"></i></span>
	    </div>
	</header>
		
    <main id="resContainer" class="friends-screen friend-mp">
		
 		<div class="user-component" onClick="location.href='/chat.do'">
          <div class="user-component__column">
            <div class="user-component__text">
              <h4 class="user-component__title">chatroom</h4>
            </div>
          </div>
          <div class="user-component__column">
          	<i class="fas fa-angle-right"></i>
          </div>
        </div>
      
		<div class="user-component" onClick="location.href='/chat.do'">
          <div class="user-component__column">
            <div class="user-component__text">
              <h4 class="user-component__title">chatroom</h4>
            </div>
          </div>
          <div class="user-component__column">
          	<i class="fas fa-angle-right"></i>
          </div>
        </div>
		
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
    
    <!-- find jsp -->
    <%@include file="/WEB-INF/view/include/find.jsp" %>
    
	<!-- 로그인 확인 체크 페이지 -->
	<%@include file="/WEB-INF/view/include/logincheck.jsp" %>
	
  </body>
</html>
